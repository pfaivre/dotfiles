from collections import namedtuple
from datetime import datetime, timezone, date
from pathlib import Path
from typing import NamedTuple
import argparse
import json
import requests
import sys


HOME = Path.home()
CONFIG_PATH = Path(HOME /".config" / "hypr" / "hyprsunset.conf")


class SunlightInfo(NamedTuple):
    latitude: float
    longitude: float

    # Sunrise
    astronomical_twilight_begin: datetime
    nautical_twilight_begin: datetime
    civil_twilight_begin: datetime
    sunrise: datetime
    
    # Day
    solar_noon: datetime
    day_length: int
    
    # Sunset
    sunset: datetime
    civil_twilight_end: datetime
    nautical_twilight_end: datetime
    astronomical_twilight_end: datetime

    def __repr__(self):
        s = ""
        s += f"# Coordinates: {self.latitude},{self.longitude}\n"
        s += "# \n"
        s += f"# astronomical_twilight_begin: {self.astronomical_twilight_begin.astimezone().isoformat()}\n"
        s += f"# nautical_twilight_begin:     {self.nautical_twilight_begin.astimezone().isoformat()}\n"
        s += f"# civil_twilight_begin:        {self.civil_twilight_begin.astimezone().isoformat()}\n"
        s += f"# sunrise:                     {self.sunrise.astimezone().isoformat()}\n"
        s += "# \n"
        s += f"# solar_noon:                  {self.solar_noon.astimezone().isoformat()}\n"
        s += f"# day_length:                  {self.day_length}\n"
        s += "# \n"
        s += f"# sunset:                      {self.sunset.astimezone().isoformat()}\n"
        s += f"# civil_twilight_end:          {self.civil_twilight_end.astimezone().isoformat()}\n"
        s += f"# nautical_twilight_end:       {self.nautical_twilight_end.astimezone().isoformat()}\n"
        s += f"# astronomical_twilight_end:   {self.astronomical_twilight_end.astimezone().isoformat()}\n"
        return s


def generate_sunlight_timeline(info: SunlightInfo) -> str:
    """Generate a timeline visualization of sunlight using shaded block characters."""
    # Define shaded block characters with varying opacity
    blocks = [
        " ",  # Empty (night)
        "░",  # Low opacity (twilight)
        "▒",  # Medium opacity
        "▓",  # High opacity
        "█",  # Full opacity (daylight)
    ]
    
    # Time intervals in minutes (e.g., 20 minutes per block for 3 blocks per hour)
    interval_minutes = 20
    total_blocks = 24 * 60 // interval_minutes  # 72 blocks for 24 hours
    
    # Convert all times to minutes since midnight
    def time_to_minutes(dt: datetime) -> int:
        return dt.hour * 60 + dt.minute
    
    # Get all relevant times in minutes since midnight
    astronomical_begin = time_to_minutes(info.astronomical_twilight_begin.astimezone())
    nautical_begin = time_to_minutes(info.nautical_twilight_begin.astimezone())
    civil_begin = time_to_minutes(info.civil_twilight_begin.astimezone())
    sunrise = time_to_minutes(info.sunrise.astimezone())
    sunset = time_to_minutes(info.sunset.astimezone())
    civil_end = time_to_minutes(info.civil_twilight_end.astimezone())
    nautical_end = time_to_minutes(info.nautical_twilight_end.astimezone())
    astronomical_end = time_to_minutes(info.astronomical_twilight_end.astimezone())
    
    # Check if astronomical twilight times are invalid (e.g., 1970-01-01)
    # This happens when astronomical twilight never ends/begins (e.g., around summer solstice)
    astronomical_invalid = (info.astronomical_twilight_begin.year == 1970 or 
                           info.astronomical_twilight_end.year == 1970)
    
    # Check if the timeline wraps around midnight
    wraps_around = astronomical_end < astronomical_begin if not astronomical_invalid else False
    
    # Generate the timeline
    timeline = []
    for i in range(total_blocks):
        current_minute = i * interval_minutes
        
        # Determine the block character based on the time of day
        if astronomical_invalid:
            # Handle case where astronomical twilight is invalid (never ends/begins)
            # Use nautical twilight as the boundary instead
            if current_minute < nautical_begin or current_minute >= nautical_end:
                # Night (no sunlight) - but this is rare when astronomical is invalid
                block = blocks[0]
            elif current_minute < sunrise:
                # Morning twilight (nautical to sunrise)
                if current_minute < civil_begin:
                    block = blocks[2]
                else:
                    block = blocks[3]
            elif current_minute >= sunset:
                # Evening twilight (sunset to nautical)
                if current_minute >= civil_end:
                    block = blocks[2]
                else:
                    block = blocks[3]
            else:
                # Daylight (full opacity)
                block = blocks[4]
        elif wraps_around:
            # Handle wrap-around case
            if current_minute >= astronomical_begin or current_minute < astronomical_end:
                # Daylight or twilight (wrap-around)
                if current_minute >= astronomical_begin:
                    # Morning twilight (astronomical to sunrise)
                    if current_minute < nautical_begin:
                        block = blocks[1]
                    elif current_minute < civil_begin:
                        block = blocks[2]
                    elif current_minute < sunrise:
                        block = blocks[3]
                    elif current_minute < sunset:
                        block = blocks[4]
                    elif current_minute < civil_end:
                        block = blocks[3]
                    elif current_minute < nautical_end:
                        block = blocks[2]
                    else:
                        block = blocks[1]
                else:
                    # Evening twilight (wrap-around)
                    if current_minute < astronomical_end:
                        block = blocks[1]
                    else:
                        block = blocks[0]
            else:
                # Night (no sunlight)
                block = blocks[0]
        else:
            # Normal case (no wrap-around)
            if current_minute < astronomical_begin or current_minute >= astronomical_end:
                # Night (no sunlight)
                block = blocks[0]
            elif current_minute < sunrise:
                # Morning twilight (astronomical to sunrise)
                if current_minute < nautical_begin:
                    block = blocks[1]
                elif current_minute < civil_begin:
                    block = blocks[2]
                else:
                    block = blocks[3]
            elif current_minute >= sunset:
                # Evening twilight (sunset to astronomical)
                if current_minute >= nautical_end:
                    block = blocks[1]
                elif current_minute >= civil_end:
                    block = blocks[2]
                else:
                    block = blocks[3]
            else:
                # Daylight (full opacity)
                block = blocks[4]
        
        timeline.append(block)
    
    # Combine the timeline into a single string
    timeline_str = "".join(timeline)
    
    # Add time labels (e.g., every 2 hours to fit the increased width)
    time_labels = ""
    for hour in range(0, 25, 2):
        position = hour * 3  # 3 blocks per hour (20 minutes per block)
        time_labels += " " * (position - len(time_labels)) + f"{hour:2d}"
    
    return f"# ┌{"─"*24*3}┐\n# │{timeline_str}│\n# └{"┬──"*24}┘\n# {time_labels}\n"


def generate_hyprsunset_config(info: SunlightInfo) -> str:
    return f"""# Configuration file for Hyprsunset
# Generated automatically on {datetime.now()}

{info}
{generate_sunlight_timeline(info)}

profile {{
    time = {info.nautical_twilight_begin.astimezone().strftime("%-H:%M")}
    temperature = 5000
}}

profile {{
    time = {info.civil_twilight_begin.astimezone().strftime("%-H:%M")}
    temperature = 5500
}}

profile {{
    time = {info.sunrise.astimezone().strftime("%-H:%M")}
    identity = true
}}

profile {{
    time = {info.sunset.astimezone().strftime("%-H:%M")}
    temperature = 5000
}}

profile {{
    time = {info.civil_twilight_end.astimezone().strftime("%-H:%M")}
    temperature = 4500
}}

profile {{
    time = {info.nautical_twilight_end.astimezone().strftime("%-H:%M")}
    temperature = 4000
}}

profile {{
    time = {info.astronomical_twilight_end.astimezone().strftime("%-H:%M")}
    temperature = 3500
}}
"""


def fetch_sunlight_info(latitude: float, longitude: float, day: date or None = None) -> SunlightInfo:
    try:
        url = f"https://api.sunrise-sunset.org/json?lat={latitude}&lng={longitude}&formatted=0"
        if day:
            url += "&date=" + day.strftime("%Y-%m-%d")
        r = requests.get(url)
        response = r.content.decode("utf-8")
        
        # Use this response instead for testing
        # response = '{"results":{"sunrise":"2026-04-12T05:03:43+00:00","sunset":"2026-04-12T18:39:02+00:00","solar_noon":"2026-04-12T11:51:22+00:00","day_length":48919,"civil_twilight_begin":"2026-04-12T04:32:26+00:00","civil_twilight_end":"2026-04-12T19:10:19+00:00","nautical_twilight_begin":"2026-04-12T03:52:16+00:00","nautical_twilight_end":"2026-04-12T19:50:29+00:00","astronomical_twilight_begin":"2026-04-12T03:08:34+00:00","astronomical_twilight_end":"2026-04-12T20:34:11+00:00"},"status":"OK","tzid":"UTC"}'

        response = json.loads(response)
        if "status" not in response or response["status"] != "OK":
            raise ValueError(f"Failed to fetch sunlight information: {response}")

        info = SunlightInfo(
            latitude = latitude,
            longitude = longitude,
            sunrise = datetime.fromisoformat(response["results"]["sunrise"]),
            sunset = datetime.fromisoformat(response["results"]["sunset"]),
            solar_noon = datetime.fromisoformat(response["results"]["solar_noon"]),
            day_length = int(response["results"]["day_length"]),
            civil_twilight_begin = datetime.fromisoformat(response["results"]["civil_twilight_begin"]),
            civil_twilight_end = datetime.fromisoformat(response["results"]["civil_twilight_end"]),
            nautical_twilight_begin = datetime.fromisoformat(response["results"]["nautical_twilight_begin"]),
            nautical_twilight_end = datetime.fromisoformat(response["results"]["nautical_twilight_end"]),
            astronomical_twilight_begin = datetime.fromisoformat(response["results"]["astronomical_twilight_begin"]),
            astronomical_twilight_end = datetime.fromisoformat(response["results"]["astronomical_twilight_end"])
        )
    except Exception as e:
        print(f"Error while fetching sunlight info: {e}", file=sys.stderr)
        exit(1)

    return info


def write_hyprsunset_config(config: str) -> None:
    try:
        if CONFIG_PATH.exists(follow_symlinks=False):
            CONFIG_PATH.unlink()
        
        CONFIG_PATH.touch()
        CONFIG_PATH.write_text(config, "utf-8")
    except Exception as e:
        print(f"Error while writing the config file: {e}", file=sys.stderr)
        exit(1)


def main():
    parser = argparse.ArgumentParser(description="Configure Hyprsunset based on sunlight information.")
    parser.add_argument("--latitude", "--lat", type=float, required=True, help="Latitude of the location")
    parser.add_argument("--longitude", "--lon", type=float, required=True, help="Longitude of the location")
    parser.add_argument("--force", action='store_true', help="Force writting the configuration file")
    args = parser.parse_args()
    
    if CONFIG_PATH.exists():
        # Check if the modification time is from today
        mod_time = datetime.fromtimestamp(CONFIG_PATH.stat().st_mtime, tz=timezone.utc)
        if mod_time.date() == datetime.now(timezone.utc).date() and not args.force:
            print(f"{CONFIG_PATH} has been generated today already")
            print("ok")
            exit(0)

    info = fetch_sunlight_info(args.latitude, args.longitude)
    config = generate_hyprsunset_config(info)
    write_hyprsunset_config(config)
    print(f"Written {CONFIG_PATH}")
    print("ok")


if __name__ == "__main__":
    main()

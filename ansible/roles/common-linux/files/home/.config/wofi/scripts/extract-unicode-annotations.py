import json

# This scripts helps to extract characters from the Unicode CLDR Project
# https://github.com/unicode-org/cldr-json
# And format them in a way that can be used in a wofi selector
# See wofi-emoji-fr.sh


excluded_words = (
    "a",
    "à",
    "au",
    "aux",
    "avec",
    "ça",
    "dans",
    "de",
    "de",
    "des",
    "du",
    "émoticône",
    "en",
    "et",
    "il",
    "j'ai",
    "j'ai",
    "j'en",
    "c'est",
    "m'en",
    "quelqu'un",
    "qu'une",
    "je",
    "l'un",
    "l'une",
    "la",
    "là",
    "le",
    "les",
    "ne",
    "non",
    "on",
    "par",
    "plus",
    "qui",
    "sans",
    "se",
    "sur",
    "te",
    "très",
    "un",
    "une",
    "y",
)


excluded_chars = "(),:"


def clean_keywords(words: set) -> set:
    """ Remove unwanted words like "de" "le", "j'ai", etc.
        As well as characters like '(', ')', ',' and ':'.
    """
    new_words = set()

    for w in words:
        # Replace fancy aprostrophe with regular ones
        w = w.replace("’", "'")

        # Remove unwanted characters
        new_words.add(w.translate({ord(i): None for i in excluded_chars}))

    # Remove unwanted words
    return new_words.difference(excluded_words)


if __name__ == "__main__":
    print("Starting...")

    with open("annotations.json", "r") as file:
        file_content = json.load(file)

    annotations = file_content["annotations"]["annotations"]

    count = 0

    with open("out.txt", "w") as out_file:
        for char, keywords in annotations.items():
            word_list = set()  # List of words for this character

            # Add the default keywords to the list (use a set to deduplicate them)
            tmp = " ".join(keywords["default"])
            word_list |= set(tmp.split(" "))

            # Add the tts keywords to the list (use a set to deduplicate them)
            tmp = " ".join(keywords["tts"])
            word_list |= set(tmp.split(" "))

            # Lower case all words to avoid duplication
            word_list = set(map(str.lower, word_list))

            # Remove any unwanted keywords and characters
            word_list = clean_keywords(word_list)

            # Append the result to the out file
            line = f"{char} {" ".join(sorted(word_list))}\n"
            out_file.write(line)

            count += 1

    print(f"Completed {count} characters.")

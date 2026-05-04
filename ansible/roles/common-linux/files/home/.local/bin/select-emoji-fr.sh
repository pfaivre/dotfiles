#!/usr/bin/env bash

# Emoji selector using Rofi
# French version
# Originally extracted from the Unicode CLDR Project (with modifications)
# https://github.com/unicode-org/cldr-json/blob/main/cldr-json/cldr-annotations-full/annotations/fr/annotations.json

# UNICODE LICENSE V3

# COPYRIGHT AND PERMISSION NOTICE

# Copyright © 1991-2025 Unicode, Inc.

# NOTICE TO USER: Carefully read the following legal agreement. BY
# DOWNLOADING, INSTALLING, COPYING OR OTHERWISE USING DATA FILES, AND/OR
# SOFTWARE, YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO BE BOUND BY, ALL OF THE
# TERMS AND CONDITIONS OF THIS AGREEMENT. IF YOU DO NOT AGREE, DO NOT
# DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR USE THE DATA FILES OR SOFTWARE.

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of data files and any associated documentation (the "Data Files") or
# software and any associated documentation (the "Software") to deal in the
# Data Files or Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, and/or sell
# copies of the Data Files or Software, and to permit persons to whom the
# Data Files or Software are furnished to do so, provided that either (a)
# this copyright and permission notice appear with all copies of the Data
# Files or Software, or (b) this copyright and permission notice appear in
# associated Documentation.

# THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
# KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
# THIRD PARTY RIGHTS.

# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS NOTICE
# BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES,
# OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
# ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THE DATA
# FILES OR SOFTWARE.

# Except as contained in this notice, the name of a copyright holder shall
# not be used in advertising or otherwise to promote the sale, use or other
# dealings in these Data Files or Software without prior written
# authorization of the copyright holder.


emoji="$(pkill rofi; sed '1,/^### DATA ###$/d' $0 | rofi -dmenu -normalize-match | cut -d ' ' -f 1 | tr -d '\n')"
wl-copy "${emoji}"
exit
### DATA ###
😀 content dents grand heureux joyeux rieur rire souriant sourire super
😃 bouche content dents formidable grand grands heureux ouverte souriant sourire super yeux
😄 bouche content grand heureux joyeux lol mdr mignon ouverte rieurs rire souriant souriants sourire yeux
😁 content dents grand heureux rieurs ses souriant souriants sourire super toutes yeux
😆 ahah bouche content fermés lol mdr ouverte plissés rire souriant sourire yeux
😅 excité froid froides goutte nerveux souriant sourire stressé sueur sueurs
🤣 content drôle hilare joyeux larmes lol mdr pleurer rire rit rouler terre tordre
😂 content heureux joie larmes lol mdr pleurer riant rire sourire
🙂 content heureux léger souriant sourire
🙃 incroyable envers renversée tête
🫠 disparaître dissoudre fond fondre gêne liquide liquéfié sarcasme
😉 blague clin œil oeil faisant flirter plaisanter sexy
😊 content heureux rieurs rougir rougit satisfait souriant souriants sourire yeux œil oeil
😇 ange angélique auréole bible béni heureux innocent paix souriant sourire spirituel
🥰 3 adorer aimer amour amoureuse amoureux béguin coeur cœur j'adore romance smiley souriant sourire aime
😍 amour amoureux cœur coeur forme romantique souriant sourire yeux œil oeil
🤩 grand heureux place pressé sourire surexcité tête wow yeux étoile étoiles
😘 amour baiser bise bisou bonjour bonne cœur coeur embrasser envoyant fait nuit aime
😗 amour baiser bise bisou embrasser faisant fait petit aime
☺️ content décontracté détendu fermés heureux souriant sourire yeux
😚 baiser bise bisou embrasser faisant fait fermés rougir rougissant yeux
😙 amour baiser bise bisou embrasser faisant fait fermés gros rieurs souriants sourire aime yeux
🥲 fier heureux larme reconnaissant smiley soulagé souriant touché ému
😋 bon content délicieux faim heureux langue manger miam savourer souriant sourire tire
😛 cool génial langue super tire
😜 amusant blague clin œil fait fou langue loufoque marrant rigolo tire
🤪 folle fou fous grand large oeil petit tête yeux œil
😝 dégoûtant ferme fermés fois goût horrible importe langue omd peu plissés tire vit yeux œil
🤑 argent bouche dollars yeux
🤗 câlin fait gentil mains
🤭 bouche devant main malin oops oups rigole secret surprise
🫢 bouche choqué embarrassé gêné impressionné main ouverts stupéfait surpris yeux étonné
🫣 cacher captivé coup œil doigts effrayé entre fasciné fixement jeter regarde regarder ses timide
🤫 bouche bruit chut dit doigt pas silence tête
🤔 hum méditer penser pleine réflexion réfléchir
🫡 armée bonne chance compris fait militaire ok oui respect salut
🤐 bouche cousue fermeture motus secret taire éclair
🤨 euh hein incrédule levé méfiant pas quoi relevés sceptique sourcil sourcils surprise tête vrai
😐 chaud commentaires drôle expression froid gêné importe marbre neutre ni pas peu rester rire
😑 expression importe inexpressif mécontent neutre peu
😶 bouche commentaires dire expression muet neutre rien secret silence sourdine taire voix
🫥 cacher disparaître déprimé introverti invisible pointillés
😶‍🌫️ brouillard distrait nuages
😏 arrogant charmeur malin ricaner rusé sourire suffisant suspicieux séducteur
😒 bizarre blasé content fâché importe jaloux pas peu ennuie énervé
🙄 agacé ciel excédé incrédulité lève roulant roule roulement yeux
😬 dents grimace grimaçant gêné rien sourire
😮‍💨 chuchoter découragé déçu ennuyé expirant expiration exténué fatigué siffler souffler soulagement soupir sursaut
🤥 mensonge menteur nez pinocchio allonge
🫨 choc fou omg ouah panique secoué surprenant terre tremblement vibration étourdi
🙂‍↔ horizontalement secouer secouée tête
🙂‍↕ hochement oui secouée tête verticalement
😌 calme soulagement soulagé sérénité zen
😔 abattu déçu horrible mort pensif perdu triste
😪 endormi fatigué larme pleurer sommeil triste
🤤 bave baver délicieux mmh
😴 bonne coucher dormir endormi fatigué nuit sieste sommeil somnolent zzz
🫩 ensommeilé fatigué sommeil sous valises yeux épuisé
😷 bactéries chirurgical dentiste docteur germes malade masque médecin rhume
🤒 indisposé malade thermomètre
🤕 autour aïe bandage blessure bobo pansement tête
🤢 dégoûtant malade nausée nauséeux vert vomir écœuré
🤮 gerbe gerber malade tête vomi vomissure vomit
🤧 atchoum fièvre grippe malade moucher mouchoir rhume souhaits tes éternue éternuement éternuer
🥵 chaleur chaud coup fièvre rouge sue suer tout toute transpiration trop
🥶 bleu caille froid gel gelure gelé glacial glacé glaçon
🥴 bouche bourré bourrée clair hébété ondulée pas pompette rond saoul souler tourne tête vapes éméché
😵 fatigué malade mort tournis étourdi
😵‍💫 confusion hagard malade nausée ouh spirales tourne tête yeux étourdi
🤯 choc choqué choquée explose surpris surprise tête
🤠 chapeau cowboy
🥳 anniversaire chapeau célébration festif fête heureux hourra joyeux pointu sifflet youpi
🥸 déguisement déguisé espion faux grimer incognito lunettes moustache nez postiche smiley sourcils ébouriffés
😎 cool lunettes posé soleil tranquille
🤓 classe doué futé geek idiot intelligent lunettes personne premier ringard surdoué tronche
🧐 classe collet fortune jeu monocle monté riche tête vieux
😕 confus désolé ennuyé pas sais triste
🫤 bof bouche confus diagonale déçu euh frustration incertain sceptique
😟 anxieux inquiet préoccupé stressé surpris triste
🙁 légèrement mécontent triste
☹️ malheureux mécontent triste
😮 bouche bée choqué incroyable omd oubli ouverte surpris épaté étonné
😯 bouche incroyable omd ouverte stupeur stupéfait surpris voix ébahi
😲 choc choqué impossible incroyable omd stupéfait étonné
😳 chaud comment gêné hébété impressionné incroyable incrédule quoi rouge rougissant rougit stupéfait ébahi étonné
🥺 battus chiens embarrassé excuse gros implorant pardon pitié plaît il supplication supplie yeux
🥹 admiration fierté gratitude joie larmes pleurs retenant retenir ses triste ému
😦 bouche dépourvu déçu effrayé mécontent ouverte peur pris surpris
😧 angoisse angoissé comment hein mécontent oubli peur quoi stressé surpris terrifié
😨 anxieux apeuré blême effrayé inquiet peur terrifié
😰 aah anxieux bleu bleue bouche bée effrayé froid froides goutte mince nerveux ouverte peur sueur sueurs terrifié
😥 déçu mais ouf pfiou soulagé sueur triste
😢 horrible larme larmes malheureux pleure pleurer triste
😭 chaudes larme larmes malheureux pleure pleurer pleurs sangloter triste
😱 choqué cri effrayé hurle munch omd peur surpris terreur
😖 confus déconcerté fermés frustré fâché irrité triste yeux
😣 concentré mal migraine persévérant tête
😞 abattu affreux découragé déçu malheureux tort triste
😓 démoralisé froide froides goutte mal migraine mince ouf peur sueur sueurs triste tête
😩 faim fatigué las mécontent pleurer sommeil triste échec épuisé
😫 contrarié fatigue fatigué mécontent triste
🥱 bâillant bâille bâiller dormir ennui fatigant fatigue sieste
😤 colère fumée fâché mécontent narines sortant triomphe victoire énervé
😡 boudeur colère exaspéré froncés furieux fâché mécontent rageur rouge sourcils énervé
😠 colère exaspéré froncés frustré fâché mécontent rageur sourcils
🤬 bouche censuré colère gros insulter insultes jurer juron mots symboles tête
😈 cornes fantastique fâché souriant sourire
👿 colère cornes diable diablotin démon fantastique malicieux mauvais
💀 corps crâne dead fantastique mort squelette tête
☠️ crâne mort os tête
💩 bande bd caca crotte dessin dessinée excrément mauvais odeur popo puer sentir tas
🤡 clown maquillage
👹 créature effrayant fantastique japonais masque monstre ogre
👺 colère créature fantastique farfadet japonais masque monstre méchant
👻 blague bouh créature effrayant fantastique fantôme halloween hanter monstre peur
👽 alien créature espace extraterrestre monstre ovni science-fiction
👾 alien créature envahisseur espace extraterrestre fantastique jeu monstre ovni pixels vidéo
🤖 androïde automate machine monstre robot
😺 animal bouche chat ouverte sourire sourit
😸 animal chat grand rieurs souriants sourire sourit yeux
😹 animal chat joie larmes lol mdr pleure pleurer rire rit
😻 amour amoureux chat cœur coeur souriant sourire yeux
😼 animal chat coin ironique narquois sourire tête
😽 animal baiser bise bisou chat embrasse embrasser fait fermés tête yeux
🙀 animal bouche chat fatigue fatigué inquiet oh ouverte surpris tête
😿 animal chat larme pleure pleurer triste tête
😾 animal boude bouder chat colère désaccord ennui tête
🙈 animal caché effrayé embarras entendu geste gêne interdit omd oubli pas peur rien secret singe voir vu yeux
🙉 animal entendre entendu geste interdit oreilles pas rien secret singe sourd vu écouter
🙊 animal bouche chut cousue dire geste interdit motus muet parler rien secret silence singe taire
💌 amour cœur coeur lettre saint-valentin
💘 amour coeur cupidon cœur flèche sentiment transpercé
💝 amour anniversaire cœur coeur ruban saint-valentin sentiment
💖 amour cœur coeur sentiment étincelant étincelles
💗 amour bat battant cœur coeur grandissant pulsations sentiment
💓 amour bat battant cardio cœur coeur pulsations sentiment
💞 amour anniversaire cœurs coeurs deux sentiment tourbillon tournent
💕 amour anniversaire cœurs coeurs deux petits rendez-vous roses sentiment
💟 amour blanc cœur coeur décoration décoré sentiment violet
❣️ amour cœur coeur exclamation point ponctuation
💔 amour brisé cœur coeur malheureux sentiment séparé triste
❤‍🔥 amour cœur coeur désir enflammé feu passion
❤‍🩹 bandages cœur coeur réconforter réparer soigner
❤ amour cœur coeur rouge sentiment
🩷 143 adorable aimer amour cœur coeur jtm mignon rose émotion
🧡 amour coeur cœur orange
💛 amour cœur coeur jaune sentiment
💚 amour cœur coeur sentiment vert
💙 amour bleu cœur coeur sentiment
🩵 143 aimer amour bleu ciel clair cyan cœur coeur jtm mignon sarcelle spécial émotion
💜 amour cœur coeur sentiment violet
🤎 brun cœur coeur marron
🖤 cœur coeur noir
🩶 143 amour ardoise argent argenté cœur coeur gris jtm spécial émotion
🤍 blanc cœur coeur
💋 baiser bise bisou bouche embrasser lèvres rendez-vous rouge sexy trace
💯 100 cent points score
💢 bande bd colère dessin dessinée furieux symbole
💥 bande bd bombe boum collision dessinée détonation explosion étincelles
💫 bande bd dessinée filante tournis voir étincelles étoile étoiles étourdissement
💦 bande bd dessinée eau effort entraînement gouttes sueur éclabousser éclaboussures
💨 bande bd courant dessinée décamper déguerpir détaler filer fumée nuage partir pet vent vite
🕳️ trou
💬 bande bd bulle dessinée dialogue message parole sms écrire
👁‍🗨 bande bd bulle dessinée témoin voir œil oeil
🗨️ bulle dialogue gauche parole
🗯️ bande bd bulle colère crier dessinée droite hurler
💭 bande bd bulle dessinée idée imaginer inventer invention penser pensée rêve rêver
💤 bande bd bonne dessinée dormir endormi fatigué nuit ronfler zzz
👋 ? bientôt bonjour bye coucou hello main revoir salue salut signe tard
🤚 dos levée main
🖐 doigts levée main paume stop écartés
✋ feuille levée main paume stop tope
🖖 doigts main salut spock star trek vulcain
🫱 droite main serrer tenir vers
🫲 gauche main serrer tenir vers
🫳 bas chasser choisir faire laisser main ouste partir paume rejeter tomber vers
🫴 appeler attirer faire haut main offre paume venir vers
🫷 arrêter attendre bloquer cinq five gauche halte high main pousse pousser refuser stop tape top vers
🫸 arrêter attendre bloquer cinq droite five halte high main pousse pousser refuser stop tape top vers
👌 bien compris accord geste main nickel ok parfait super tout va
🤌 ! agacement argumentation bout doigts geste interrogation joints main mains parler patience silence
🤏 deux doigts index petit petite peu pouce quantité rapprochés somme
✌ amour and ciseaux doigts love main paix peace v victoire
🤞 bonne chance croisés doigts main
🫰 amour argent cher claquer croisés cœur coeur doigts index main pouce
🤟 amour doigts geste ily main signe aime trois
🤘 cornes diable doigts main rock rock'n roll yeah
🤙 appel doigts main signe téléphone téléphonique
👈 doigt gauche index main pointant pointé vers
👉 doigt droite index main pointant pointé vers
👆 doigt haut index main montrer pointant vers
🖕 honneur doigt main majeur
👇 bas doigt index main montrer pointant vers
☝️ doigt haut index main moi pointant pointé vers
🫵 index utilisateur pointant pointer toi vers main
👍 aussi bien compris accord génial haut levé main moi ok oui pouce super top vers
👎 baissé bas main mauvais nul pouce vers
✊ levé main pierre poing serré solidarité
👊 absolument battre boum correct coup accord face main mon poing pote serrer
🤛 fistbump gauche main poing
🤜 droite main poing
👏 applaudissements applaudissent bien bon bravo formidable félicitations geste joué mains super travail
🙌 air geste hourra levées mains youpi
🫶 amour cœur coeur forment mains
👐 main ouvert ouvertes écartées
🤲 contre doigts ensemble espérer haut mains paume paumes prier prière vers
🤝 conclu accord mains marché poignée présentation rencontre serrer
🙏 contre demander félicitations main mains merci plaît prier prière salut taper tope
✍ main écrire écrit
💅 cosmétiques manucure maquillage ongles ennuyer vernis
🤳 appareil photo selfie téléphone
💪 biceps bodybuilding contracté corps culturisme entraînement exercice force haltérophilie muscles soulever bras
🦾 accessibilité bras handicap mécanique prothèse robot
🦿 accessibilité artificielle handicap jambe mécanique prothèse robot
🦵 coup cuisse fléchi genou genoux jambe membre pied
🦶 cheville coup lourd pas pied
👂 corps entendre oreille ouïe son écouter
🦻 accessibilité appareillée auditive handicap malentendant oreille prothèse sonotone sourd surdité
👃 corps narines nez odeur sentir
🧠 cerveau intelligent intelligente
🫀 anatomie battement battements cardiologie coeur cœur organe pouls pulsation
🫁 anatomie expiration inspiration organe poumons respiration respirer souffle
🦷 carie dent dentiste diamant émail
🦴 chien halloween os squelette
👀 chercher corps coup œil oeil regarder voir yeux
👁️ corps œil oeil
👅 corps langue lécher
👄 baiser beauté bise bisou bouche corps embrasser lèvres rouge
🫦 anxieux flirt inquiet aise lèvre lèvres mal mordent mordue nerveux
👶 bébé enceinte enfant nouveau-né petit
🧒 enfant genre jeune neutre non-genré
👦 enfant garçon jeune personne
👧 couettes enfant fille grands jeune nattes personne petite tresses vierge yeux zodiaque
🧑 adulte genre neutre non-genré
👱 blond blonde cheveux garçon homme humain personne tête
👨 ami garçon homme personne petit pote
🧔 barbe barbu barbue personne
🧔‍♂ barbe barbu homme
👱‍♂ blond cheveux homme
👩 blonde cheveux coupe femme personne
🧔‍♀ barbe barbue femme
👱‍♀ blonde cheveux femme personne
🧓 adulte genre neutre non-genré personne âgé âgée
👴 chauve grand-père homme monsieur papi personne sage vieux âgé âgée
👵 blonde dame femme grand-mère mamie personne sage âgée
🙍 contente contrariée déçue embêtée femme froncer fronçant geste gênée mécontente pas personne sourcils triste
🙍‍♂ froncement fronçant geste homme mécontent renfrogné sourcils
🙍‍♀ femme froncement fronçant geste sourcils
🙎 boude bouder déçue expression faire femme froncer fâchée geste inquiète moue personne sourcils tête énervée
🙎‍♂ boude bouder faire geste homme moue
🙎‍♀ boude femme geste
🙅 aucune bloquer chance interdiction faisant femme geste impossible interdit main niet pas personne possible stop
🙅‍♂ interdiction faisant geste homme interdit main
🙅‍♀ interdiction faisant femme geste interdit main
🙆 bras acceptation accord danser exercice faisant femme geste grandir lever main ok personne
🙆‍♂ acceptation accord faisant geste homme main ok
🙆‍♀ acceptation accord faisant femme geste main ok
💁 aide diva femme haut importe information insouciante main paume personne peu potins prétentieuse sarcastique sophistiqué vers
💁‍♂ aide apporter diva haut homme importe informations insolent main paume peu potins sarcastique vers
💁‍♀ femme haut paume vers
🙋 compte content femme geste ici levée lève main moi participer personne présente sais
🙋‍♂ geste homme levée lève main moi personne répondre sais
🙋‍♀ femme geste levée lève main
🧏 accessibilité entendre malentendant oreille personne sourd sourde surdité
🧏‍♂ accessibilité entendre homme malentendant oreille sourd
🧏‍♀ accessibilité entendre femme malentendant oreille sourd sourde
🙇 compris confus désolé excuses geste gronder incliné inclinée ok pardon personne incline
🙇‍♂ désolé geste homme incliné incline
🙇‍♀ désolée excuses femme geste inclinée méditation méditer prosterne incline
🤦 drame exaspération femme geste incroyable incrédulité main pas paume personne peux possible
🤦‍♂ encore exaspération homme incroyable incrédulité main oh oubli paume personne
🤦‍♀ crois encore exaspération femme incroyable incrédulité main oh oubli pas paume personne
🤷 aucune comme épaules doute faire femme hausse haussement idée ignorance indifférence pas personne peut-être que sais sait
🤷‍♂ aucune épaules doute hausse haussement homme idée ignorance indifférence moi pas personne rien sais vu
🤷‍♀ aucune épaules doute femme hausse haussement idée ignorance indifférence moi pas personne rien sais vu
🧑‍⚕ docteur genres infirmier médecin professionnel santé thérapeute tous
👨‍⚕ docteur homme infirmier médecin médicale métier profession professionnel santé
👩‍⚕ docteur docteure femme infirmière médecin médicale métier profession professionnelle santé
🧑‍🎓 diplôme genres tous étudiant étudiante
👨‍🎓 diplômé homme étudiant
👩‍🎓 diplômée femme étudiante
🧑‍🏫 enseignant enseignante formateur formatrice personnel professeur
👨‍🏫 enseignant homme instituteur instructeur métier professeur
👩‍🏫 enseignante femme institutrice instructrice professeure
🧑‍⚖ balance juge
👨‍⚖ balance homme juge justice métier
👩‍⚖ balance femme juge justice métier
🧑‍🌾 fermier fermière genres jardinier jardinière tous
👨‍🌾 agriculteur fermier homme jardinier métier
👩‍🌾 agricultrice femme fermière jardinière métier
🧑‍🍳 chef cuisinier cuisinière genres tous
👨‍🍳 chef cuisinier homme métier
👩‍🍳 chef cuisinière femme métier
🧑‍🔧 artisan genres mécanicien mécanicienne plombier tous électricien électricienne
👨‍🔧 homme mécanicien mécanique métier ouvrier plombier électricien
👩‍🔧 femme mécanicienne mécanique métier ouvrière plombier électricienne
🧑‍🏭 assemblage genres industrie ouvrier ouvrière tous usine
👨‍🏭 assemblage homme industrie montage métier ouvrier usine
👩‍🏭 assemblage femme industrie montage métier ouvrière usine
🧑‍💼 affaires architecte bureau employé employée genres tous
👨‍💼 affaires architecte bureau cadre directeur employé homme métier
👩‍💼 affaires architecte bureau cadre directrice employée femme métier
🧑‍🔬 chimiste scientifique
👨‍🔬 biologiste chimiste homme ingénieur mathématicien métier physicien scientifique
👩‍🔬 biologiste chimiste femme ingénieure mathématicienne métier physicienne scientifique
🧑‍💻 développeur développeuse genres informaticien informaticienne logiciels technologie tous
👨‍💻 codeur développeur homme informaticien inventeur logiciels métier technologie
👩‍💻 codeuse développeuse femme informaticienne inventrice logiciels métier technologie
🧑‍🎤 artiste chanteur chanteuse genres rock star tous
👨‍🎤 acteur artiste chanteur homme métier rock rockeur star
👩‍🎤 actrice artiste chanteuse femme métier rock rockeuse star
🧑‍🎨 artiste palette
👨‍🎨 artiste homme métier palette peintre
👩‍🎨 artiste femme métier palette peintre
🧑‍✈ avion pilote
👨‍✈ avion homme métier pilote
👩‍✈ avion femme métier pilote
🧑‍🚀 astronaute fusée
👨‍🚀 astronaute casque cosmonaute espace fusée homme métier spationaute
👩‍🚀 astronaute casque cosmonaute espace femme fusée métier spationaute
🧑‍🚒 camion pompier pompiers
👨‍🚒 camion casque homme métier pompier pompiers
👩‍🚒 camion casque femme métier pompier pompiers
👮 autorité flic homme loi métier officier personne police policier tenue uniforme
👮‍♂ flic homme officier police policier
👮‍♀ autorité femme flic loi métier officier personne police policière tenue uniforme
🕵 détective enquêteur espion homme
🕵‍♂ détective enquêteur espion homme
🕵‍♀ détective enquêteuse enquêtrice espionne femme
💂 buckingham casque garde homme londres palace
💂‍♂ garde homme
💂‍♀ buckingham casque femme garde londres métier palace
🥷 assassin combat furtif guerrier masqué ninja personne sabre secret soldat
👷 btp bâtiment casque chantier construction homme métier ouvrier personne personnel réparer
👷‍♂ bâtiment homme ouvrier
👷‍♀ bâtiment casque chantier femme métier ouvrier ouvrière
🫅 couronne monarque noble personne royal royauté
🤴 couronne prince royal royauté
👸 conte couronne fantastique fées personne princesse reine
👳 homme oriental personne turban
👳‍♂ homme turban
👳‍♀ femme turban
👲 casquette chapeau chinoise homme mao
🧕 bandana femme foulard hijab mantilla tichel voile
🤵 homme marié mariée personne smoking élégant
🤵‍♂ homme smoking
🤵‍♀ femme smoking
👰 mariage mariée personne voile
👰‍♂ homme voile
👰‍♀ femme voile
🤰 enceinte femme
🫃 enceint enceinte grossesse homme mangé personne trop ventre
🫄 enceinte grossesse mangé personne trop ventre
🤱 allaitement bébé maman nourrice nourrir sein soins
👩‍🍼 allaitant allaitement biberon bébé femme maman mère nounou nouveau-né personne
👨‍🍼 allaitant allaitement biberon bébé homme nouveau-né papa personne père
🧑‍🍼 allaitant allaitement biberon bébé homme maman mère nounou nouveau-né papa personne père
👼 ailes ange auréole bébé fantastique église
🎅 bonnet claus fêtes magie noël père santa tradition
🤶 bonnet fêtes mère noël santa
🧑‍🎄 joyeux noël papa personne père saint-nicolas santa
🦸 bien cape force heroïne héros héroïne monde personnage pouvoir sauver super superman vengeur voler
🦸‍♂ bien homme héros super-héros super-pouvoir
🦸‍♀ bien femme héros héroïne super-héroïne super-pouvoir
🦹 cape criminel diabolique déguisement mal mauvais méchant personnage pouvoir super vilain
🦹‍♂ criminel homme mal méchant super-pouvoir super-vilain
🦹‍♀ criminelle femme mal méchante super-pouvoir super-vilain
🧙 chapeau enchantement ensorceleur envoûtement jeu mage magicien personnage rôle sorcier sorcière sortilège
🧙‍♂ homme mage magicien sorcier
🧙‍♀ ensorceleuse femme mage sorcière
🧚 ailes clochette déguisement fée féerie féérique magie obéron personnage puck titania voler
🧚‍♂ féetaud obéron puck
🧚‍♀ fée titania
🧛 canines cape conte dents dracula déguisement halloween mort-vivant personnage sang vampire
🧛‍♂ dracula homme mort-vivant vampire
🧛‍♀ femme morte-vivante vampire
🧜 aquatique ariel créature folklore mer océan personnage petite poisson queue sirène trident triton
🧜‍♂ triton
🧜‍♀ sirène
🧝 anneaux conte elf elfe legolas magique oreilles personnage seigneur
🧝‍♂ elfe homme magique
🧝‍♀ elfe femme magique
🧞 aladin djinn génie homme lampe magie magique personnage souhait voeu vœu
🧞‍♂ djinn génie homme
🧞‍♀ djinn femme génie
🧟 effrayant flippant halloween horreur mort mort-vivant personnage peur vivant zombie
🧟‍♂ homme mort-vivant zombie
🧟‍♀ femme morte-vivante zombie
🧌 conte fées légende monstre mythe troll troller
💆 détente fait femme fermer massage masser personne relaxation repos salon thérapie tête yeux zen
💆‍♂ apaiser fait homme mal massage masser migraine relaxation salon tension tête
💆‍♀ fait femme massage masser
💇 barbier beauté cheveux ciseaux coiffure coupe couper fait femme personne salon style
💇‍♂ cheveux chez coiffeur coiffure coupe couper fait homme salon
💇‍♀ cheveux coiffure couper fait femme
🚶 balade balader flâner homme marche marcher nonchalant personne piéton promenade route
🚶‍♂ homme marche piéton
🚶‍♀ femme marche marcher piétonne randonneuse
🧍 debout personne
🧍‍♂ debout homme
🧍‍♀ debout femme
🧎 genoux personne prière religion
🧎‍♂ genoux homme
🧎‍♀ femme genoux
🧑‍🦯 accessibilité aveugle blanche canne personne
👨‍🦯 accessibilité aveugle blanche canne déficient handicap homme malvoyant visuel
👩‍🦯 accessibilité aveugle blanche canne déficiente femme handicap malvoyante visuelle
🧑‍🦼 accessibilité fauteuil motorisé personne roulant
👨‍🦼 accessibilité fauteuil handicap homme motorisé roulant
👩‍🦼 accessibilité fauteuil femme handicap motorisé roulant
🧑‍🦽 accessibilité fauteuil manuel personne roulant
👨‍🦽 accessibilité fauteuil handicap homme manuel roulant
👩‍🦽 accessibilité fauteuil femme handicap manuel roulant
🏃 arriver coureur courir course court homme jogging marathon marathonien personne pied pressé rapide sportif vite
🏃‍♂ course court homme jogging marathon pied
🏃‍♀ course court dépêcher femme joggeuse jogging marathon pied running vite vitesse
💃 danse danser danseuse femme flamenco fête rythme salsa sortir tango
🕺 danse danseur femme flamenco fête homme rythme salsa
🕴 affaires costume homme lévitation
👯 amies bunny danseuse double déguisement femme femmes fille filles fête jumelles lapin oreilles personnes synchro
👯‍♂ amis danseur faire fête homme hommes lapin oreilles
👯‍♀ danseuse femme femmes fête lapin oreilles
🧖 bien-être chaud détente hammam personne relaxation sauna spa vapeur
🧖‍♂ hammam homme sauna
🧖‍♀ femme hammam sauna
🧗 alpiniste escalade escalader grimpe grimper grimpeur montagne personne sport
🧗‍♂ alpiniste grimpe grimpeur homme
🧗‍♀ alpiniste femme grimpe grimpeuse
🤺 escrime escrimeur escrimeuse personne sport épée
🏇 cheval chevaux course hippique jockey sport
⛷ neige ski skieur sport
🏂 homme neige ski snowboard snowboardeur sport
🏌 balle golf golfeur green homme joueur personne pga pitch sport
🏌‍♂ golf golfeur homme
🏌‍♀ femme golf golfeuse practice sport
🏄 faisant glisse homme mer océan personne plage planche sport surf vagues
🏄‍♂ homme surf surfeur
🏄‍♀ femme mer océan plage sport surf surfeuse vagues
🚣 barque bateau lac naviguer personne pêche ramant ramer rameur rivière sport
🚣‍♂ barque bateau homme rameur
🚣‍♀ barque bateau femme lac navigation plaisance pêche ramer rameuse rivière sport
🏊 crawl eau exercice homme nage nageant nageur natation personne piscine sport
🏊‍♂ homme nage nageur
🏊‍♀ femme nage nageuse natation sport
⛹ athlétique ballon basket-ball basketteur dribble joueur match personne rebond sport
⛹‍♂ ballon homme
⛹‍♀ ballon basket-ball basketteuse femme sport
🏋 bodybuilding entraînement force haltérophile haltérophilie homme lever muscles personne poids sport
🏋‍♂ haltérophile homme
🏋‍♀ entraînement exercice femme haltérophile sport
🚴 course cycliste france guidon homme personne pédaler rouler sport tour vélo
🚴‍♂ cyclisme cycliste homme vélo
🚴‍♀ cyclisme cycliste femme sport vélo
🚵 coureur cyclisme france grimper homme montagne personne sport tour vtt vélo
🚵‍♂ cycliste homme vtt vélo
🚵‍♀ cycliste femme montagne sport vtt vttiste vélo
🤸 agilité athlète faire faisant femme gymnaste gymnastique personne roue sport
🤸‍♂ acrobatie content faire faisant garçon gymnastique homme personne roue souple sport
🤸‍♀ acrobatie exercice faire faisant femme gymnaste gymnastique personne roue sport
🤼 bataille faisant lutte lutteur lutteurs personnes sport
🤼‍♂ athlètes bataille force hommes lutte lutteurs personne personnes ring sport
🤼‍♀ bataille combat duel femmes lutte lutteuse lutteuses personne personnes sport
🤽 ballon homme jouant joue personne piscine sport water-polo
🤽‍♂ ballon eau homme jeu joueur match personne piscine sport water-polo
🤽‍♀ ballon femme joueuse nager personne piscine sport water-polo
🤾 athlète ballon handball handballeur jouant lancer personne sport
🤾‍♂ handball handballeur homme sport
🤾‍♀ athlète attaquante ballon femme handball handballeuse personne sport tir
🤹 artiste cirque gérer jongle jongler jongleur multitâche personne
🤹‍♂ acrobatie artiste balles cirque homme jonglage jongleur multitâche personne
🤹‍♀ femme jonglage jongleuse multitâche
🧘 assise détendu femme lotus méditation personne position posture relax relaxation tailleur yoga zen
🧘‍♂ homme lotus méditation position posture yoga
🧘‍♀ femme lotus méditation position posture yoga
🛀 baignoire bain personne prenant prend
🛏️ auberge coucher dodo dormir fatigué hôtel lit nuit personne sieste
🛌 auberge coucher dodo dormir fatigué hôtel lit nuit personne sieste
🧑‍🤝‍🧑 couple deux gay homosexuel main personne personnes poignée tenant tenir
👭 amies amitié amoureuses couple deux femmes filles gay homosexuelles jumelles lesbiennes lgbtqia meilleures petite sœurs
👫 amie amis amoureux couple donnant femme homme main petit petite rendez-vous tenant
👬 amis amitié amoureux couple deux fils frères gay gémeaux hommes homosexuels jumeaux lgbtqia main meilleurs petit zodiaque
💏 amour anniversaire baiser bisou couple femme homme
💑 amour anniversaire couple cœur coeur femme homme rendez-vous
🗣 parle parler silhouette tête
👤 buste mystère ombre silhouette
👥 ami amie amies amis bff bustes gens meilleur meilleure meilleures meilleurs monde personnes silhouettes tout
🫂 accolade amitié bonjour câlin embrassades gratitude merci personne revoir étreinte
👪 enfant famille femme fils garçon homme mère père
🧑‍🧑‍🧒 adulte enfant famille
🧑‍🧑‍🧒‍🧒 adulte enfant famille
🧑‍🧒 adulte enfant famille monoparentale
🧑‍🧒‍🧒 adulte enfant famille monoparentale
👣 empreintes nus pas pied pieds traces
🫆 biométriques dermatoglyphe digitale données empreinte identité sécurité
🦰 cheveux rouquin rouquine roux
🦱 afro boucles bouclés cheveux
🦳 blancs cheveux gris vieux
🦲 chauve cheveux chimiothérapie imberbe rasé
🐵 animal curieux georges petit singe sourire tête
🐒 animal primate singe
🦍 animal gorille primate singe
🦧 animal orang-outan primate singe
🐶 animal chien chiot domestique tête
🐕 animal aboyer chien domestique
🦮 animal accessibilité aveugle chien guide malvoyant non-voyant
🐕‍🦺 animal accessibilité aide assistance chien chien-guide handicap
🐩 animal caniche chien
🐺 animal loup louve tête
🦊 animal nature renard tête
🦝 animal curieux laveur raton sournois
🐱 animal chat chaton miaou minou tête
🐈 animal chat chaton domestique miaou miauler
🐈‍⬛ animal chat chaton félin halloween malchanceux matou miaou noir superstition
🦁 animal astrologie crinière fort horoscope lion roi rugissement safari savane tête zodiaque
🐯 animal félin prédateur tigre tête
🐅 animal félin prédateur tigre tigresse zoo
🐆 animal félin léopard prédateur zoo
🐴 animal cheval dressage ferme jument tête équitation
🫎 animal bois cervidé mammifère orignal ramure élan
🫏 animal bourricot mammifère mule têtu âne
🐎 animal cheval course hippique hippodrome tiercé
🦄 animal licorne licrone tête
🦓 animal blanc noir rayure rayures zèbre zébrure
🦌 animal bois cerf
🦬 animal bison buffle cornes herbivore nature troupeau
🐮 animal lait meuh tête vache
🐂 animal astrologie bœuf ferme horoscope taureau zodiaque
🐃 animal buffle corne zoo
🐄 animal ferme lait meuh vache
🐷 animal cochon ferme porc tête
🐖 animal cochon ferme gros jambon porc truie
🐗 animal game of sanglier thrones
🐽 animal cochon ferme flair groin museau porc sentir tête
🐏 animal astrologie bélier corne ferme horoscope mouton zodiaque
🐑 animal brebis bêler doux ferme laine lait mouton
🐐 animal astrologie capricorne chèvre ferme fromage horoscope lait zodiaque
🐪 animal bosse dromadaire désert
🐫 animal bosse bosses chameau deux désert
🦙 animal alpaca alpaga guanaco laine lama llama pérou vicuña vigogne
🦒 animal cou girafe tâches
🐘 animal pachyderme trompe éléphant
🦣 animal défenses extinction grand géant laineux mammouth
🦏 animal corne rhinocéros
🦛 animal hippo hippopotame
🐭 animal souris tête
🐁 animal souris
🐀 animal rat
🐹 animal domestique hamster tête
🐰 animal dents domestique lapin tête
🐇 animal domestique lapin
🐿️ animal noisettes écureuil
🦫 animal barrage castor dents rongeur
🦔 animal hérisson piquant porc-épic épines épineux
🦇 animal chauve-souris vampire
🐻 animal brun miel nounours ours teddy tête
🐻‍❄️ animal arctique blanc ours polaire
🐨 animal australie koala
🐼 animal panda tête
🦥 animal aï endormi lent paresseux
🦦 animal joueur loutre mignon pêcheur
🦨 animal mouffette odeur puer putois
🦘 austalie joey kangoo kangourou marsupial marsupiaux saut
🦡 animal blaireau ratel
🐾 animaux empreintes pattes
🦃 animal action dinde dindon grâces oiseau thanksgiving volaille
🐔 animal coq ferme oiseau poule poulet volaille
🐓 animal coq oiseau volaille
🐣 animal bébé naissance naître nouveau-né oiseau poussin éclosion éclôt œuf
🐤 animal oiseau poussin tête
🐥 animal bébé face nouveau-né oiseau poussin
🐦 animal oiseau ornithologie
🐧 animal antarctique banquise manchot oiseau pingouin
🕊️ animal colombe oiseau paix rameau voler
🦅 animal aigle oiseau rapace
🦆 animal canard coin-coin oiseau
🦢 animal canard cygne jeune oiseau petit vilain
🦉 animal chouette hibou oiseau sage
🦤 animal dodo dronte espèce extinction grand maurice oiseau éteinte
🪶 léger oiseau plumage plume voler écrire écrivain
🦩 animal flamant oiseau rose tropical
🦚 animal bel coloré fier fière oiseau paon paonne prétentieux
🦜 animal oiseau parle perroquet pirate répète
🪽 aile angélique aviation céleste mythologie oiseau envoler élever voler
🐦‍⬛ animal bec corbeau corneille corvidé croasser merle noir oiseau
🪿 animal bête cacarder canard jars oie oiseau troupeau volaille volée
🐦‍🔥 ailes cendres feu gloire immortel mythologie oiseau phénix renaissance renaître revivre transformation
🐸 animal crapaud grenouille tête
🐊 animal alligator caïman crocodile reptile zoo
🐢 animal carapace lentement reptile tortue
🦎 animal lézard reptile
🐍 animal reptile serpent sonnette venin
🐲 animal dragon mythe tradition tête
🐉 animal chine chinois dragon game mythe of thrones tradition
🦕 animal brachiosaure brontosaure dinosaure diplodocus sauropode
🦖 animal dinosaure rex t-rex t. tyrannosaure tyrannosaurus
🐳 animal baleine mer océan plage son soufflant souffle évent
🐋 animal baleine mer océan plage
🐬 animal dauphin flipper mer océan plage
🦭 animal lion mer océan otarie phoque
🐟 animal alimentation astrologie horoscope manger nourriture poisson poissons repas zodiaque
🐠 animal poisson tropical
🐡 animal poisson poisson-lune
🦈 animal dents mer poisson requin
🐙 animal créature mer mollusque océan pieuvre poulpe
🐚 animal conque coquillage coquille mer plage spirale
🪸 climatique corail océan réchauffement récif
🪼 animal aquarium aïe brûlure gélatineux invertébré marin marine mer mou méduse océan piqûre plancton tentacules vie
🦀 animal astrologie cancer crabe horoscope mer pinces plage zodiaque
🦞 animal bisque fruit fruits homard mer pinces
🦐 aliment crevette crustacé fruits mer nourriture
🦑 aliment animal calamar encornet mollusque nourriture
🦪 coquillage coquille huître mollusque perle
🐌 animal escargot jardin lentement nature
🦋 animal insecte mignon papillon printemps
🐛 animal chenille insecte jardin
🐜 animal fourmi insecte jardin
🐝 abeille animal bourdon guêpe insecte miel nature printemps
🪲 animal insecte scarabée
🐞 animal bête coccinelle insecte jardin nature
🦗 animal criquet insecte sauterelle
🪳 animal blatte cafard coquerelle insecte nuisible
🕷 animal araignée insecte
🕸 araignée toile
🦂 animal astrologie désert horoscope scorpion zodiaque
🦟 fièvre infection insecte maladie malaria moustique piqûre virus
🪰 animal asticot insecte maladie mouche nuisible pourrissement puanteur putréfaction tsé-tsé
🪱 animal annélide insecte lombric parasite terre ver
🦠 amibe bactérie biologie microbe microorganisme phagocytose pseudopode science virus
💐 amoureux anniversaire bouquet fleur fleurs plante rendez-vous roses
🌸 bourgeon cerisier fleur plante printemps
💮 blanche fleur
🪷 beauté bouddhisme calme fleur hindouisme lotus pureté sérénité
🏵 plante rosette
🌹 amour beauté fleur plante rose rouge saint-valentin
🥀 fanée fleur mort rose
🌺 fleur hibiscus plante
🌻 champs fleur plante soleil tournesol
🌼 bourgeon bouton or dent-de-lion fleur pissenlit plante printemps
🌷 bourgeon fleur plante printemps tulipe
🪻 fleur fleurir indigo jacinthe lavande lilas lupin mauve muflier plante printemps violet
🌱 germe jeune plante plantule pousse pousser printemps semis
🪴 décoration ennuyeux faire intérieur nature plante pot pousser prendre soin
🌲 arbre conifère feuilles forêt noël persistantes pin plante sapin
🌳 arbre caduques feuilles feuillu forêt nature plante
🌴 arbre cocotier palmier plage plante tropical tropiques
🌵 cactus désert nature piquant plante sécheresse épines
🌾 grain plante riz
🌿 arbre feuille feuilles plante
☘️ irlande plante trèfle
🍀 4 chance feuilles irlande plante porte-bonheur quatre trèfle
🍁 automne érable feuille morte tomber
🍂 automne feuille feuilles morte mortes tomber
🍃 bourrasque feuille feuilles souffle tourbillon vent virevoltante virevolter
🪹 branches faire maison nid son vide
🪺 branches faire nid oiseau son œufs
🍄 champignon mario plante vénéneux
🪾 arbre aride feuille hiver sécheresse
🍇 fruit nourriture raisin
🍈 fruit melon nourriture
🍉 fruit pastèque nourriture
🍊 agrume c clémentine fruit mandarine nourriture orange vitamine
🍋 acide agrume citron fruit nourriture zeste
🍋‍🟩 acide agrume citron fruit lime mojito tropical vert zeste
🍌 banane fruit nourriture potassium
🍍 ananas fruit nourriture tropical
🥭 fruit mangue nourriture tropical tropique
🍎 fruit nourriture pomme rouge
🍏 fruit nourriture pomme verte
🍐 fruit nourriture poire
🍑 fruit nourriture pêche
🍒 cerise cerises fruit nourriture
🍓 fraise fruit nourriture
🫐 airelles baies bleu bleuets fruit myrtilles nourriture violet
🥝 fruit kiwi nourriture
🍅 fruit légume nourriture plante tomate
🫒 aliment apéritif apéro nourriture olive olivier rameau
🥥 coco colada fruit noix nourriture palmier piña
🥑 avocat fruit nourriture
🍆 aubergine légume nourriture
🥔 légume nourriture patate pomme purée terre
🥕 carotte légume nourriture
🌽 ferme maïs nourriture épi
🌶️ nourriture piment piquant rouge
🫑 légume piment poivron rouge vert nourriture
🥒 concombre cornichon légume nourriture
🥬 bok chinois chou choy feuilles frisé kale laitue légume pommé salade vertes nourriture
🥦 broccoli brocoli chou légume sauvage nourriture
🧄 ail aromate assaisonnement condiment légume vampire nourriture
🧅 assaisonnement condiment légume ognon oignon nourriture
🥜 arachide cacahuète cacahuètes noisette nourriture
🫘 haricot haricots légume légumineuse nourriture petit rognon rouge
🌰 châtaigne marron nourriture plante
🫚 bière gingembre naturel racine santé épice nourriture
🫛 cosse edamame fève haricot légume légumineuse petits pois soja nourriture
🍄‍🟫 automne brun champignon cèpe fongus marron nature nourriture
🫜 betterave jardin légume légume-racine navet racine
🍞 miche mie nourriture pain
🥐 croissant nourriture pain petit-déjeuner viennoiserie
🥖 baguette nourriture pain
🫓 arepa galette gordita lavash naan nourriture pain pita plat
🥨 bretzel nourriture torsade
🥯 bagel boulangerie petit-déjeuner sandwich schmear
🥞 crêpe goûter nourriture pancake pancakes petit-déjeuner
🧇 brunch déjeuner gaufre gourmandise goûter moule petit petit-déjeuner pâtisserie
🧀 fromage nourriture part
🍖 nourriture os viande
🍗 cuisse dinde nourriture os poulet volaille
🥩 côtelette agneau morceau nourriture porc rouge steak viande
🥓 bacon lard nourriture porc viande
🍔 burger cheeseburger fast food hamburger nourriture
🍟 fast food frites potatoes potatœs
🍕 fromage nourriture part pepperoni pizza tranche
🌭 dog francfort hot nourriture saucisse
🥪 mie nourriture pain pique-nique sandwich
🌮 mexicain nourriture taco
🌯 burrito kebab mexicain wrap
🫔 mexicain nourriture pamonha papillote tamal
🥙 falafel kebab nourriture pain pita
🧆 boulette boulettes chiches falafel falafels pois seitan soja viande
🥚 nourriture œuf oeuf
🍳 cuire cuisine faire frire friture nourriture petit-déjeuner plat poêle œuf
🥘 casserole espagne mitonné paella plat poêle riz
🍲 marmite nourriture ragoût
🫕 bourguignonne chocolat fondue fromage plat poêlon savoyarde ski suisse
🥣 bol congee cuillère céréales déjeuner petit soupe
🥗 nourriture salade verte
🍿 cinéma nourriture pop-corn
🧈 beurre gras laitier produit
🧂 condiment salière salé saveur sel
🥫 aliments boîte conserve nourriture
🍱 bento boîte déjeuner nourriture
🍘 cracker galette nourriture riz
🍙 boulette japonais nourriture onigiri plat riz
🍚 bol nourriture riz
🍛 curry nourriture riz
🍜 bol fumant nouilles nourriture ramen vapeur
🍝 bolognaise italien nourriture pâtes restaurant sauce spaghetti
🍠 douce four nourriture patate
🍢 brochette fruits mer nourriture poisson restaurant
🍣 japonais nourriture poisson riz sushi
🍤 beignet crevette
🍥 croquette gâteau narutomaki nourriture poisson restaurant surimi
🥮 automne cake festival gâteau lune moon yuèbǐng
🍡 bonbons brochette dango dessert japonais nourriture
🥟 boulette dumpling empanada gyoza gyōza jiaozi pierogi potsticker pâte ravioli
🥠 biscuit chinois nourriture prophétie
🥡 baguettes boîte carton chinois emporter nourriture
🍦 cornet dessert glace italienne nourriture sucré
🍧 coupe crème dessert glace glacée granité nourriture restaurant sucré
🍨 coupe crème dessert glace glacée nourriture restaurant sucré
🍩 dessert donut doughnut goûter nourriture sucrerie sucré
🍪 biscuit chocolat cookie dessert goûter gâteau nourriture pépites sucré
🎂 anniversaire bougies dessert fête goûter gâteau joyeux nourriture pâtisserie
🍰 dessert goûter gâteau nourriture pâtisserie sablé sucré
🧁 cupcake dessert muffin pâtisserie sucre sucrerie
🥧 décoration fruits garniture gâteau nourriture pâte pâtisserie tarte tourte
🍫 barre chocolat chocolatée dessert goûter nourriture sucré
🍬 bonbon dessert goûter nourriture sucrerie sucré
🍭 dessert goûter nourriture sucette sucrerie sucré
🍮 crème dessert flan nourriture pudding renversée sucré
🍯 miel nourriture ours pot sucré
🍼 biberon boisson bébé lait naissance nouveau-né tétine
🥛 boisson lait verre
☕ boisson café caféine chaude matin thé
🫖 boisson chaude infusion thé théière
🍵 anse boisson tasse thé
🍶 boisson bouteille restaurant saké verre
🍾 alcool boisson bouchon bouteille champagne félicitations fête pop
🍷 alcool bar boisson club restaurant verre vin
🍸 alcool bar boisson club cocktail martini pied verre
🍹 alcool bar boîte cocktail fête sunrise tequila tropical verre
🍺 alcool bar bière boisson chope oktoberfest picoler pinte santé
🍻 alcool bière boisson chopes santé tchin trinquer
🥂 alcool champagne célébrer fêter santé tchin trinquer verre verres
🥃 alcool liqueur tumbler verre whisky
🫗 accident boisson eau liquide oups renverser verre verser vider
🥤 boisson eau fruit fruits gobelet jus paille soda verre
🧋 boba boisson bubble bulle bulles froid lait paille perle perles tea thé zenzou
🧃 boisson briquette carton fruits jus paille
🧉 boisson maté
🧊 cube froid glace glaçon iceberg
🥢 baguettes hashi
🍽️ assiette couteau couverts cuisine fourchette restaurant table
🍴 couteau couverts faim fourchette manger nourriture repas restaurant
🥄 couvert cuillère manger
🔪 arme chef couteau cuisine outil
🫙 bocal condiments conserver pot rien récipient sauce vide
🏺 amphore astrologie cuisine grec grèce horoscope vase verseau zodiaque
🌍 afrique espace europe globe monde planète présentant terre tourné
🌎 amérique amériques espace globe monde planète présentant terre tourné
🌏 asie australie espace globe monde planète présentant terre tourné
🌐 globe internet monde méridiens net terrestre toile
🗺️ carte monde planisphère voyage
🗾 carte japon voyage
🧭 boussole compas direction magnétique navigation orientation
🏔️ enneigée froid montagne neige sommet voyage
⛰ montagne nature sommet voyage
🌋 lave nature volcan éruption
🗻 fuji mont montagne nature sommet voyage
🏕️ camping nature sapin tente voyage
⛱️ parasol plage voyage
🏜️ désert voyage
🏝️ cocotier déserte palmier voyage île
🏞️ national nature parc voyage
🏟️ stade
🏛️ classique colonnes monument voyage banque
🏗️ bâtiment chantier construction un grue
🧱 3/4 9 argile brique briques mortier mur the voie wall
🪨 caillou dur lourd pierre roc roche rocher solide
🪵 arbre bois bûche bûcheron rondins tronc
🛖 abri case hutte maison maisonnette yourte
🏘️ bâtiment bâtiments maison maisons pavillons
🏚️ abandonnée maison
🏠 bâtiment foyer maison pavillon résidentiel simple
🏡 foyer jardin maison pavillon résidentiel
🏢 bureaux immeuble ville
🏣 bureau bâtiment japon japonais japonaise poste voyage
🏤 bureau bâtiment européen poste
🏥 bâtiment docteur hôpital médecin urgences
🏦 banque bâtiment
🏨 bâtiment hôtel voyage
🏩 amour bâtiment cœur coeur hotel hôtel love voyage
🏪 24h/24 bâtiment magasin supermarché supérette épicerie
🏫 bâtiment école
🏬 bâtiment centre commercial grand magasin
🏭 bâtiment usine
🏯 bâtiment château japonais voyage
🏰 bâtiment château européen voyage
💒 amour chapelle cœur coeur mariage église
🗼 japon tokyo tour voyage
🗽 liberté new statue voyage york
⛪ bâtiment chapelle chrétien croix religion voyage église
🕌 islam mosquée musulman musulmane religion voyage
🛕 bouddhisme bouddhiste hindou pagode religion stūpa temple
🕍 judaïsme juif juive religion synagogue temple voyage
⛩️ religion sanctuaire shinto voyage
🕋 islam kaaba musulman musulmane religion voyage
⛲ eau fontaine
⛺ camping nature tente voyage
🌁 brouillard brume voyage
🌃 nuit ville voyage étoiles étoilée
🏙️ bâtiment ville voyage immeubles
🌄 derrière levant lever matin montagnes nature soleil voyage
🌅 levant lever matin nature soleil voyage
🌆 coucher crépuscule immeubles nuit soir soleil tombée ville voyage
🌇 coucher crépuscule nuit soir soleil tombée ville voyage
🌉 nuit pont
♨️ chaud chaudes source sources vapeur
🎠 cheval manège
🛝 aire glissade jeu jouer toboggan
🎡 attractions grande parc roue
🎢 attractions montagnes parc russes
💈 barbier coiffeur coiffure enseigne salon
🎪 chapiteau cirque
🚂 chemin fer locomotive machine moyen rail tchou train transport vapeur voyage
🚃 chemin fer moyen rail train tram tramway transport voiture voyage wagon
🚄 chemin fer grande moyen rail rapide tgv train transport vitesse voyage
🚅 chemin fer grande moyen rail rapide tgv train transport vitesse voyage
🚆 arrivée chemin fer moyen rail train transport voyage
🚇 moyen métro transport
🚈 léger monorail moyen métro rail rer transport
🚉 chemin fer gare moyen rail rer train transport
🚊 moyen rer tram tramway transport trolley trolleybus
🚝 monorail moyen transport véhicule
🚞 chemin fer montagne moyen rail train transport voyage wagon
🚋 moyen tram tramway transport trolleybus voiture voyage wagon
🚌 bus moyen transport véhicule école
🚍 arrive bus car face moyen transport
🚎 bus moyen tram tramway transport trolley trolleybus
🚐 bus minibus moyen navette transport véhicule
🚑 ambulance urgences véhicule
🚒 camion pin-pon pompier
🚓 flic patrouille police voiture véhicule
🚔 arrive face police voiture véhicule
🚕 jaune moyen taxi transport uber véhicule
🚖 face jaune new taxi uber voiture york
🚗 automobile conduire moyen transport voiture voyage véhicule
🚘 arrive automobile conduire face moyen transport voiture voyage véhicule
🚙 automobile conduire loisirs moyen sport transport utilitaire voiture voyage véhicule
🛻 auto benne camion camionnette lourd pick-up pickup plateau poids transports véhicule
🚚 camion camionnette livraison moyen transport véhicule
🚛 camion lourd moyen poids semi semi-remorque transport véhicule
🚜 moyen tracteur transport véhicule
🏎 1 automobile course formule voiture
🏍 course moto
🛵 scooter
🦽 accessibilité fauteuil handicap manuel roulant
🦼 accessibilité fauteuil handicap motorisé roulant
🛺 rickshaw taxi thaï tricycle tuk
🚲 bicyclette cyclisme moyen transport voyage vélo
🛴 trottinette
🛹 glisse longboard planche roulettes skate skateboard
🛼 derby patin roller roulette roulettes sport
🚏 arrêt bus
🛣️ autoroute route voyage
🛤️ chemin fer ferrée rail train voie voyage
🛢️ baril pétrole
⛽ diesel essence gazole pompe station
🛞 cercle pneu roue tourner voiture véhicule
🚨 alarme alerte gyrophare lumière police sirène urgences voiture
🚥 carrefour circulation croisement feu horizontal tricolore
🚦 carrefour circulation croisement feu tricolore vertical
🛑 octogonal panneau signe stop
🚧 barrière travaux
⚓ ancre bateau outil voyage
🛟 bouée flotter sauver sauvetage sauveteur secours sécurité
⛵ bateau mer moyen plaisance transport voilier voyage yacht
🛶 bateau canoë rame ramer
🚤 bateau hors-bord luxe moyen transport vedette voyage été
🛳️ bateau croisière paquebot voyage
⛴ bateau ferry moyen transport voyage
🛥️ bateau moteur
🚢 bateau croisière moyen navire paquebot titanic transport voyage
✈️ avion jet moyen transport vol voyage véhicule
🛩 avion moyen petit transport voyage
🛫 avion décollage départ moyen transport voyage
🛬 arrivée atterrissage avion moyen transport voyage
🪂 ascensionnel chute fortes libre parachute parapente sensations
💺 chaise fauteuil place siège
🚁 hélico hélicoptère moyen transport véhicule
🚟 moyen suspendu train transport voyage
🚠 montagne moyen ski transport télécabine téléphérique
🚡 aérien moyen tramway transport télécabine
🛰️ espace satellite
🚀 décollage espace fusée moyen transport voyage
🛸 alien extraterrestre ovni soucoupe volante
🛎️ cloche clochette comptoir hôtel réception sonnette
🧳 bagage valise voyage
⌛ chronomètre minuteur sable sablier temps
⏳ attendre chronomètre coule minuteur sable sablier temps
⌚ heure montre
⏰ alarme attendre dring heure matin retard réveil sonnerie
⏱️ chronomètre heure temps
⏲️ heure horloge minuteur temps
🕰️ horloge pendule posée
🕛 0 12 h heure horloge midi midi/minuit minuit pile
🕧 00 12 30 demi demie h heure horloge midi midi/minuit minuit
🕐 1 13 h heure heures horloge treize
🕜 1 13 30 demie h heure heures horloge treize trente
🕑 14 2 deux h heure heures horloge quatorze
🕝 14 2 30 demie deux h heure heures horloge quatorze trente
🕒 15 3 h heure heures horloge quinze trois
🕞 15 3 30 demie h heure heures horloge quinze trente trois
🕓 16 4 h heures quatre seize
🕟 16 30 4 demie h heure heures horloge quatre seize trente
🕔 17 5 cinq dix-sept h heure heures horloge
🕠 17 30 5 cinq demie dix-sept h heure heures horloge trente
🕕 18 6 dix-huit h heure heures horloge six
🕡 18 30 6 demie dix-huit h heure heures horloge six trente
🕖 19 7 dix-neuf h heure heures horloge sept
🕢 19 30 7 demie dix-neuf h heure heures horloge sept trente
🕗 20 8 h heure heures horloge huit vingt
🕣 20 30 8 demie h heure heures horloge huit trente vingt
🕘 21 9 h heures neuf
🕤 21 30 9 demie h heure heures horloge neuf trente vingt
🕙 10 22 dix h heure heures horloge vingt-deux
🕥 10 22 30 demie dix h heure heures horloge trente vingt-deux
🕚 11 23 h heure heures horloge onze vingt-trois
🕦 11 23 30 demie h heure heures horloge onze trente vingt-trois
🌑 lune nouvelle sombre nuit espace
🌒 lune croissante nuit espace
🌓 lune nuit premier quartier espace
🌔 lune croissant croissante gibbeuse gibbeux nuit espace
🌕 lune nuit pleine espace
🌖 lune décroissant décroissante gibbeuse gibbeux nuit espace
🌗 lune dernier quartier nuit espace
🌘 lune croissant descendante décroissante nuit espace
🌙 lune croissant nuit ramadan espace
🌚 lune nouvelle nuit espace
🌛 lune croissant nuit premier quartier espace
🌜 lune croissant nuit dernier quartier espace
🌡️ météo thermomètre
☀️ beau brillant espace grand météo rayons soleil temps
🌝 lune nuit pleine sourire
🌞 chaleur chaud ensoleillé jour lumière météo plage rayon soleil éclat éclatant
🪐 anneaux planète saturne saturnien saturnienne
⭐ astronomie nuit étoile
🌟 brillante nuit succès éclat étincelant étincelle étoile étoilée
🌠 espace filante nuit étoile
🌌 espace lactée voie
☁️ nuage gris météo
⛅ nuage caché derrière météo nuageux soleil
⛈️ nuage météo orage pluie éclair
🌤️ nuage caché derrière météo petit soleil
🌥️ nuage caché derrière gros météo soleil
🌦️ nuage caché derrière gouttes météo pluie soleil
🌧️ nuage averse gouttes mauvais météo pluie temps
🌨️ flocons froid hiver météo neige nuage
🌩️ nuage orage orageux temps éclair météo
🌪️ cyclone météo nuage tornade tourbillon
🌫️ brouillard brume fog météo nuage
🌬️ météo nuage souffle vent
🌀 cyclone spirale tourbillon typhon vertige météo
🌈 arc-en-ciel bisexuel bisexuelle gay homosexuel homosexuelle lesbienne lgbtqia météo nature pluie pride transgenre
🌂 fermé météo parapluie pluie
☂️ ouvert parapluie pluie météo
☔ gouttes météo parapluie pluie
🏖️ météo parapluie parasol plage pluie sol soleil voyage
⚡ courant danger haute nature orage symbole tension vitesse éclair électricité
❄️ flocon froid météo neige
☃️ bonhomme flocons neige
⛄ bonhomme flocons froid neige
☄️ comète espace météore
🔥 allumer brûler chaud feu flamme fournaise incendie
💧 bande bd eau dessinée froid froides goutte larme météo nature pluie sueur sueurs tristesse
🌊 eau kanagawa lame large marée mer nature océan remous rouleau surf vague
🎃 citrouille halloween lanterne
🎄 arbre fête fêtes guirlandes noël sapin
🎆 14 artifice feu fête juillet
🎇 14 artifice cierge feu fête juillet magique étincelle étincelles
🧨 artifice dynamite explosif explosive feu pétard tnt étincelle
✨ * magie nuit scintiller étincelles étoile étoiles étoilée
🎈 anniversaire ballon baudruche fête gonflable
🎉 anniversaire cotillons fête super
🎊 anniversaire confettis fête
🎋 arbre fête japon prières tanabata vœux
🎍 bambou décoratif fête japonais plante
🎎 festival japon japonaises poupées
🎏 carpe fête koinobori
🎐 carillon clochette fête vent éolien
🎑 cérémonie lune
🧧 argent bonne cadeau chance enveloppe hóngbāo lai rouge see
🎀 fête nœud rose ruban
🎁 anniversaire cadeau emballé fête noël nœud surprise
🎗️ mémoire ruban souvenir
🎟️ billet entrée place spectacle
🎫 billet place spectacle
🎖️ militaire médaille
🏆 champion championne coupe gagner prix trophée victoire
🏅 champion championne or médaille sport sportive vainqueur victoire
🥇 1er or médaille premier sport
🥈 2e argent deuxième médaille sport
🥉 3e bronze médaille troisième sport
⚽ balle ballon football sport
⚾ balle baseball sport
🥎 balle gant softball sport
🏀 ballon basket basket-ball panier sport
🏐 ballon jeu match sport volley volley-ball
🏈 américain ballon bowl football sport super
🏉 ballon rugby sport
🎾 balle sport tennis
🥏 discoplane disque disque-volant frisbee sport ultimate ultime-passe volant
🎳 boule bowling jeu partie quilles sport strike
🏏 balle batte cricket jeu match sport
🏑 balle crosse gazon hockey sport
🏒 crosse glace hockey palet sport
🥍 balle but crosse lacrosse raquette sport
🏓 balle jeu partie ping-pong raquette sport table tennis
🏸 badminton jeu match raquette sport volant
🥊 boxe gant sport
🥋 arts judo karaté kimono martiaux sport taekwondo tenue
🥅 but cage filet sport
⛳ drapeau golf sport trou
⛸ glace patin patiner patinoire sport
🎣 canne ligne pêche sport
🤿 apnée masque plonger plongée snorkeling tuba
🎽 athlétisme course jogging maillot pied running sport tee-shirt
🎿 neige ski sport
🛷 glisser luge neige traîneau
🥌 curling granit jeu match partie pierre sport
🎯 cible fléchettes jeu mille
🪀 descendre jouet monter osciller yoyo
🪁 cerf-volant planer voler
🔫 arme eau feu flingue pistolet revolver
🎱 8 billard boule huit jeu magique pool
🔮 avenir boule cristal magie voyant voyante
🪄 abracadabra baguette magicien magie magique sorcier sorcière sort tour
🎮 jeu joystick manette playstation vidéo xbox
🕹 jeu joystick manette vidéo
🎰 casino jeu machine sous
🎲 dé dés hasard jeu
🧩 assemblage indice interloqué manquante pièce puzzle énigme
🧸 jeu jouet nounours ours peluche
🪅 5 bonbons cinco confiseries fête mai mayo mexicain piñata
🪩 boule briller danse disco facettes fête soirée
🪆 emboîté empiler gigogne jouet matriochka poupée poupées russe russes russie
♠️ carte couleur jeu pique
♥️ cartes couleur cœur coeur jeu jouer rouge
♦️ carreau carreaux carte couleur jeu
♣️ cartes couleur jeu jouer noir trèfle
♟️ échec duper pion sacrifiable
🃏 carte cartes jeu joker jouer
🀄 dragon jeu mah-jong mahjong rouge
🎴 carte fleur fleurs japonais jeu jouer
🎭 acteur actrice art masque spectacle théâtre vivant
🖼 art cadre encadré image musée peinture tableau
🎨 art artiste couleurs musée palette peindre peintre peinture
🧵 aiguille bobine coudre couture ficelle fil
🪡 aiguille broderie coudre couture fil points suture tailleur
🧶 boule crochet fil laine pelote tricot
🪢 attacher corde entrelacer lien noué nœud tordre
👓 accessoire lunettes vue vêtements yeux œil
🕶️ lunettes noires soleil
🥽 chimiste labo lunettes masque natation piscine protection soudage soudure yeux
🥼 blanche blouse docteur expérience expérimentation laboratoire manteau médecin scientifique vêtements
🦺 chantier fluo gilet jaune orange sécurité sûreté visibilité
👔 chemise cravate travail vêtements
👕 bleu chemise courses décontracté polo shopping t-shirt tee-shirt vêtements week-end
👖 bleu courses denim jean pantalon shopping vêtements week-end
🧣 cou foulard froid glagla vêtements écharpe
🧤 gant gants main vêtements
🧥 froid glagla manteau veste vêtements
🧦 chaussettes pieds vêtements
👗 courses jolie robe shopping vêtements élégante
👘 kimono vêtements
🥻 inde mode robe sari traditionnel vêtement
🩱 bain maillot pièce
🩲 bain maillot pièce slip sous-vêtement
🩳 baignade bain caleçon maillot piscine plage short sous-vêtement
👙 bain bikini maillot nager piscine plage vêtements
👚 chemise chemisier courses femme shopping vêtements
🪭 agiter chaleur charmer chaud danse danser rafraîchir timide éventail éventer
👛 accessoire courses main monnaie porte-monnaie sac shopping vêtements
👜 accessoire courses main sac shopping vêtements
👝 accessoire main pochette sac trousse vêtements
🛍 achats courses sac sacs shopping
🎒 cartable dos sac école
🩴 claquettes mer plage sandales tatanes tong tongs été
👞 accessoire chaussures coup courses homme marron pied shopping vêtements
👟 accessoire athlétisme basket chaussures coup courir courses pied shopping sport tennis vite vêtements
🥾 camping chantier chaussures marche marron montagne rando randonnée sécurité vêtements
🥿 ballerine chaussure chaussures lacets mule plate plates vêtements
👠 accessoire aiguille chaussures courses femme haut mode shopping stilletto talon vêtements
👡 chaussures femme haut sandale talon vêtements
🩰 ballerines ballet chaussons chaussures classique danse
👢 accessoire botte chaussures courses femme shopping vêtements
🪮 afro cheveux démêler démêloir peigne peigner
👑 accessoire couronne famille monarchie monarque reine roi royale royauté succès vêtements
👒 chapeau femme vêtements
🎩 accessoire chapeau forme haut haut-de-forme magie vêtements élégant
🎓 accessoire chapeau diplôme toque universitaire université vêtements étudiant
🧢 américaine baseball cap casquette chapeau vêtements
🪖 armée casque guerre guerrier militaire protection soldat équipement
⛑ assistance blanche casque croix sauveteur secouriste secours
📿 accessoire chapelet collier perles prière religion vêtements
💄 cosmétiques lèvres maquillage rendez-vous rouge
💍 alliance amour bague brillant diamant fiançailles mariage solitaire étincelant
💎 argent bijou diamant fiançailles joyau mariage pierre précieuse romantique
🔇 barré chut enceinte haut-parleur muet silence son sourdine
🔈 bas enceinte enceintes faible haut-parleur son volume
🔉 enceinte enceintes haut-parleur moyen son volume
🔊 enceinte enceintes fort haut-parleur musique son volume élevé
📢 communication fort haut-parleur message mégaphone son
📣 encourager hourra manifestation mégaphone porte-voix
📯 cor facteur postal poste
🔔 cloche clochette sonner
🔕 alarme barrée cloche désactivée silence
🎼 musique note partition
🎵 musique note
🎶 musique note notes partition
🎙️ chant enregistrement micro microphone musique studio
🎚️ curseur musique niveau
🎛️ boutons commande contrôle musique réglage réglages
🎤 chanter karaoke karaoké micro microphone musique
🎧 casque musique son écouteur écouteurs
📻 actualités communication loisirs musique radio vidéo
🎷 instrument musique saxophone
🪗 accordéon bandonéon bretelles concert concertina instrument musique mélodie piano
🎸 guitare instrument musique électrique
🎹 clavier instrument musique piano touches
🎺 instrument musique trompette
🎻 instrument musique violon
🪕 banjo cordes instrument musique
🥁 baguette baguettes batterie musique tambour
🪘 battement conga djembé instrument musique percussions rythme tambour
🪇 cha danse danser fête hochet instrument maracas musique percussion secouer
🪈 bec bois fanfare fifre flûte flûtiste instrument musique orchestre piccolo
🪉 amour cupidon harpe instrument musique orchestre
📱 communication portable smartphone téléphone
📲 appel communication entrant flèche portable recevoir smartphone téléphone
☎️ rouge téléphone
📞 combiné communication téléphone téléphonique
📟 bip bipeur communication pager
📠 communication fax télécopieur
🔋 pile
🪫 batterie déchargé faible pile électronique énergie
🔌 branché câble fiche prise électricité électrique
💻 bureau ordinateur portable travail
🖥 bureau moniteur ordinateur
🖨️ imprimante imprimer ordinateur
⌨️ clavier informatique ordinateur
🖱️ ordinateur informatique souris
🖲️ boule commande informatique ordinateur souris trackball
💽 ordinateur disque minidisc
💾 disque disquette informatique ordinateur
💿 blu-ray cd disque dvd
📀 blu-ray cd disque dvd
🧮 abaque boulier calcul calculation math mathématiques
🎥 caméra cinéma film filmer réalisateur réalisatrice vidéo
🎞️ bande cinéma film pellicule
📽️ cinéma cinématographique film projecteur vidéo
🎬 action clap film tourne
📺 petit tv télé téléviseur télévision écran
📷 appareil photo selfie vidéo
📸 appareil flash photo
📹 caméra caméscope filmer vidéo
📼 cassette magnétoscope vhs vidéo vidéocassette vintage
🔍 agrandir chercher détective gauche loupe orientée recherche
🔎 agrandir chercher droite détective loupe orientée recherche
🕯️ bougie chandelle lumière
💡 allumer ampoule bande bd dessin dessinée idée lampe lumière
🔦 lampe lumière outil torche électrique
🏮 japonais lampion lanterne lumière restaurant rouge
🪔 beurre diwali diya fête huile inde lampe ārtī
📔 cahier carnet couverture livre école écrire
📕 apprendre enseignement fermé lire littérature livre manuel rouge savoir scolaire école
📖 apprendre bibliothèque enseignement lecture lire littérature livre manuel ouvert roman savoir scolaire école étudier
📗 apprendre bibliothèque enseignement lecture lire littérature livre manuel savoir scolaire vert école étudier
📘 apprendre bleu lecture lire littérature livre manuel roman scolaire école éducation
📙 apprendre lecture lire littérature livre manuel orange roman scolaire école éducation
📚 apprendre bibliothèque enseignement lecture lire littérature livres manuels roman savoir scolaires école étudier
📓 cahier carnet écrire
📒 cahier carnet classeur compte grand livre
📃 document enroulée page
📜 papier parchemin
📄 document page
📰 actualités communication gros journal presse titres
🗞️ actualités journal presse roulé
📑 marque marqueur onglets signet signets
🔖 marque-page marqueur signet
🏷️ étiquette
💰 argent avare banque dollar parier payer plein sac
🪙 argent euro fortune monnaie métal or pièce riche sou trésor
💴 argent banque billet payer yens
💵 argent banque billet dollar dollars payer
💶 argent banque billet euros payer
💷 argent banque billet livres payer
💸 ailes argent banque billet dollars payer
💳 argent bancaire banque carte crédit payer
🧾 caisse compta comptabilité comptable comptes facture faire justificatif preuve reçu ticket
💹 banque courbe croissance devise graphique hausse marché monnaie tendance yen
✉️ courrier e-mail enveloppe lettre message électronique
📧 courriel courrier e-mail lettre message électronique enveloppe
📨 courriel courrier e-mail enveloppe envoyer lettre message recevoir reçu électronique
📩 communication courriel courrier e-mail enveloppe envoi envoyer envoyé flèche message électronique
📤 boîte courriel courrier envoi e-mail envoyer flèche lettre message électronique
📥 boîte courriel courrier e-mail flèche lettre message recevoir réception électronique
📦 boîte colis livraison paquet
📫 boîte courrier drapeau fermée lettres levé
📪 baissé boîte courrier drapeau fermée lettres
📬 boîte courrier drapeau lettres levé ouverte
📭 baissé boîte courrier drapeau lettres ouverte
📮 boîte courrier lettres poste
🗳️ bulletin urne vote voter voté électorale
✏️ crayon gomme mine papier
✒️ noir plume stylo écrire
🖋️ plume stylo écrire
🖊️ bille stylo stylo-bille écrire
🖌️ peinture pinceau
🖍️ crayon pastel rouge
📝 bloc-notes crayon mémo écrire
💼 accessoire bureau cartable porte-documents
📁 dossier fichier répertoire
📂 dossier ouvert ouvrir répertoire
🗂 classement classeur index intercalaire intercalaires
📅 calendrier date
🗓️ agenda calendrier date planning éphéméride
🗒️ bloc-notes cahier notes spirale spirales
🗓 bloc-notes calendrier spirale spirales
📇 carnet carte adresses fiche index rolodex vintage
📈 croissance données graphique hausse haut tendance
📉 baisse bas chute données graphique négatif tendance
📊 barres données graphique graphiques
📋 fournitures liste porte-bloc presse-papiers
📌 fournitures punaise
📍 carte emplacement fournitures punaise ronde épingle
📎 fournitures trombone
🖇 fournitures trombones
📏 fournitures mathématiques plate règle
📐 fournitures mathématiques équerre
✂️ ciseaux couper découper fournitures papier
🗃️ boîte classeur dossier dossiers
🗄️ classement classer classeur dossier dossiers meuble
🗑️ corbeille papiers poubelle
🔒 cadenas fermé privé verrouiller verrouillé
🔓 cadenas déverrouiller ouvert ouvrir
🔏 cadenas confidentiel fermé plume privé stylo verrouillé
🔐 cadenas clé fermé privé sécurisé verrouillé
🔑 clé mot ouvrir passe serrure
🗝️ ancienne clé fermer indice serrure verrouiller
🔨 marteau outil réparer travaux
🪓 bois bûcheron fendre hache hachette
⛏️ mine outil pioche
⚒ burin marteau outil outils pioche
🛠 clé marteau molette outil outils
🗡 arme couteau dague poignard
⚔ arme armes croisées épées
💣 bande bd bombe boum danger dessin dessinée explosion
🪃 aborigène australie boomerang jeu outil retour répercussion
🏹 arc archer astrologie flèche horoscope sagittaire sport tir zodiaque
🛡 arme bouclier
🪚 bois outil scie scier égoïne
🔧 clé molette outil travaux
🪛 outil outillage tournevis vis
🔩 boulon outil travaux vis écrou
⚙️ dentée engrenage outil roue
🗜 compresser comprimer outil serre-joint serre-joints
⚖️ astrologie balance horoscope justice poids zodiaque
🦯 accessibilité aveugle blanche canne déficient malvoyant visuel
🔗 chaîne chaînons maillons mousqueton
⛓‍💥 brisée cassée chaîne liberté rompue
⛓️ chaîne chaînes
🪝 accrocher appâter attraper capitaine crochet ferrer hameçon hameçonner
🧰 boîte caisse coffre mécanique mécano outil outils
🧲 aimant aimanter attirer attraction cheval fer magnet magnétique négatif positif
🪜 ascension barreau escabeau grimper monter échelle échelon
🪏 bêche creuser pelle trou
⚗️ alambic chimie outil
🧪 chimie chimiste essai expérience expérimentation laboratoire réaction science sciences tube
🧫 bactérie bactériologie biologie biologiste boîte culture laboratoire micro-organismes microbiologie petri pétri science
🧬 adn biologie biologiste gène génétique science vie évolution
🔬 expérience laboratoire microscope outil science
🔭 astronomie espace outil planètes science télescope
📡 antenne parabole parabolique satellite science
💉 aiguille docteur malade médecine piqûre seringue vaccin vaccination
🩸 don goutte menstruation menstruations médecine règles sang
💊 docteur gélule malade médecine médicament pilule vitamines
🩹 bandage bobo médecine pansement premiers secours sparadrap
🩼 accident aide blessé boiter béquille canne handicap
🩺 cœur coeur diagnostic docteur médecin médecine poumons stéthoscope
🩻 cage docteur médical os radiographie rayons squelette thoracique x
🚪 entrée placard porte
🛗 accessibilité ascenseur descente monte-charge monte-personnes montée
🪞 beauté glace image maquillage miroir psyché reflet
🪟 air cadre carreaux fenêtre frais ouverture transparent vitre vue
🛋️ canapé lampe sofa
🪑 assis chaise siège
🚽 cabinets toilettes wc
🪠 bouché déboucheur dégorgement outil plombier succion toilettes ventouse
🚿 douche eau pommeau
🛁 baignoire bain mousse
🪤 appât apât fromage leurre piège rat souris tapette
🪒 coupant lame raser rasoir tranchant
🧴 bouteille corps crème flacon hydratant hydratante lotion shampooing solaire
🧷 couche imperdable lange nourrice punk rock sûreté épingle
🧹 balai balais balayage ménage nettoie nettoyage nettoyer nettoyé sorcière
🧺 agriculture cueillette lessive linge panier pique-nique
🧻 essuie-tout hygiénique papier pq rouleau toilette
🪣 conteneur plage seau
🧼 bain bulles lavage lave laver me mousse pain porte-savon savon
🫧 bulles eau propre savon
🪥 bain brosse brosser dentaire dents hygiène laver salle
🧽 absorbante absorbe laver nettoyage nettoyer poreuse savonner éponge
🧯 chaud extincteur feu fire incendie éteindre
🛒 caddie chariot courses panier shopping supermarché
🚬 allumée cigarette fumer fumeur signe
⚰ cercueil enterrement mort obsèques vampire
🪦 cimetière enterrement funérailles mort mémorial pierre rip stèle sépulture tombale tombe
⚱ cendres funéraire mort obsèques urne
🧿 amulette bleu boncuk oeil mauvais nazar nazarboncuk perle superstition talisman turc œil
🪬 amulette chance fatma hamsa khamsa main myriam protection
🗿 moai moaï monolithe pâques statue voyage île
🪧 affiche grève manifestation pancarte panneau protestation signe écriteau
🪪 carte conduire identité justificatif papiers permis pièce sécurité
🏧 argent automatique automatiques banque billets dab distributeur guichet retrait
🚮 corbeille déchets icône jeter poubelle
🚰 eau potable robinet
♿ accès fauteuil handicapés mobilité roulant réduite symbole
🚹 homme hommes symbole toilettes wc
🚺 femme femmes symbole toilettes wc
🚻 panneau toilettes wc
🚼 bébé change espace symbole
🚾 toilettes wc
🛂 contrôle passeport passeports
🛃 douane douanes
🛄 arrivée avion aéroport bagages retrait valise voyage
🛅 bagages casier clé consigne valise
⚠️ attention avertissement symbole
🚸 circulation enfants piétons traversée école
⛔ circulation entrée interdiction interdit interdite panneau sens
🚫 interdiction entrée interdit interdite symbole
🚳 bicyclette interdiction interdit interdits vélo vélos
🚭 barrée cigarette fumer interdiction interdit
🚯 ordures déchets dépôt interdiction interdit jeter pas
🚱 boire eau imbuvable interdiction interdit pas potable
🚷 interdiction interdit piétons
📵 interdiction interdit interdits portable portables téléphone téléphones
🔞 18 ans âge dix-huit interdiction interdit limite majorité mineur mineurs moins
☢️ radioactif radioactivité symbole
☣️ biologique danger symbole
⬆️ direction flèche haut nord sens
↗️ direction droite flèche haut nord-est sens
➡️ direction droite est flèche sens
↘️ bas direction droite flèche sens sud-est
⬇️ bas direction flèche sens sud
↙️ bas direction flèche gauche sens sud-ouest
⬅️ direction flèche gauche ouest sens
↖️ direction flèche gauche haut nord-ouest sens
↕️ bas deux flèche haut sens
↔️ droite flèche gauche
↩️ courbe flèche gauche
↪️ courbe droite flèche
⤴️ courbe droite flèche haut vers
⤵️ bas courbe flèche
🔃 actualiser aiguilles une flèche flèches horaire montre recharger sens symbole
🔄 actualiser aiguilles antihoraire contraire une flèche flèches horaire inverse montre retour sens
🔙 flèche gauche retour vers
🔚 fin flèche gauche vers
🔛 activé deux droite flèche gauche sens
🔜 bientôt flèche
🔝 flèche haut vers
🛐 culte lieu prier religion
⚛️ athée atome symbole
🕉 hindou om religion
✡️ david judaïsme juif juive religion étoile
☸️ bouddhisme bouddhiste dharma religion roue
☯️ complémentaire religion tao taoïsme yin yang
✝️ chrétien chrétienne croix latine religion
☦️ chrétien chrétienne croix orthodoxe religion
☪️ islam lune musulman musulmane ramadan religion étoile
☮️ amour and love paix peace symbole
🕎 branches candélabre chandelier hanoucca hanoukka judaïsme juif juive menora menorah religion sept
🔯 6 branches chance judaïsme juif juive étoile
🪯 deg fateh foi khalsa khanda religion sikh sikhisme tegh
♈ astrologie bélier horoscope zodiaque
♉ astrologie horoscope taureau zodiaque
♊ astrologie gémeaux horoscope zodiaque
♋ astrologie cancer crabe horoscope zodiaque
♌ astrologie horoscope lion zodiaque
♍ astrologie horoscope vierge zodiaque
♎ astrologie balance horoscope justice zodiaque
♏ astrologie horoscope scorpion zodiaque
♐ astrologie horoscope sagittaire zodiaque
♑ astrologie capricorne chèvre horoscope zodiaque
♒ astrologie eau horoscope verseau zodiaque
♓ astrologie horoscope poissons zodiaque
⛎ ophiuchus serpent serpentaire zodiaque
🔀 aléatoire bouton croisées flèche flèches lecture
🔁 aiguilles bouton cercle une flèche flèches horaire montre répéter répétition sens
🔂 aiguilles bouton cercle une flèche flèches fois horaire montre n°1 piste répéter répétition sens
▶️ bouton droite flèche lecture lire triangle
⏩ avance bouton double flèche rapide
⏭️ bouton double flèche piste scène suivant suivante triangle
⏯️ bouton flèche lecture pause triangle
◀️ bouton flèche gauche retour triangle
⏪ bouton double flèche rapide retour
⏮️ bouton flèche piste précédent précédente scène triangle
🔼 bouton flèche haut petit triangle
⏫ double flèche haut rapide vers
🔽 bas bouton flèche petit triangle
⏬ bas double flèche rapide vers
⏸️ bouton pause
⏹️ bouton carré stop
⏺️ blanc bouton cercle enregistrement enregistrer point
⏏️ bouton éjecter
🎦 caméra cinéma film
🔅 brillance faible luminosité lumière soleil
🔆 brillance luminosité lumière soleil élevée
📶 barres communication couverture portable réception réseau téléphone
🛜 connexion débit fil haut hotspot internet ordinateur routeur réseau smartphone wi-fi wifi wlan
📳 communication mode portable téléphone vibreur
📴 portable téléphone éteindre éteint
♀️ femme symbole féminin
♂️ homme symbole masculin
⚧️ communauté symbole transgenre
✖️ * annuler croix multiplication multiplier noire signe x ×
➕ + addition ajouter arithmétique mathématiques signe somme
➖ - arithmétique mathématiques moins signe soustraction soustraire −
➗ algèbre diviser division math mathématique mathématiques signe ÷
🟰 gras mathématiques réponse signe égal égalité
♾️ illimité infini universel éternité
‼️ ! !! exclamation double point ponctuation surprise
⁉️ ! !? ? exclamation interrogation point points ponctuation question surprise
❓ ? interrogation point ponctuation question rouge
❔ ? blanc interrogation point ponctuation question
❕ ! blanc exclamation point ponctuation surprise
❗ ! exclamation point ponctuation rouge
〰️ union ligne ondulé ondulée ponctuation tiret trait vague
💱 argent banque change conversion devise
💲 argent devise dollar espèces payer symbole
⚕️ caducée docteur esculape médecine personnel
♻️ recyclage symbole
⚜️ blason fleur française lis lys reine roi royauté
🔱 ancre bateau fourche mer poséidon trident
📛 badge nom nominatif
🔰 chevron débutant japonais jaune symbole vert
⭕ 0 anneau cercle gros o rouge
✅ bouton carré case coche coché marque ok oui sélection terminé voilà ✓
☑️ bouton carré case coche cochée ok oui sélection terminé voilà ✓
✔️ valider coche noire ok oui sélection terminé voilà ✓
❌ annuler croix multiplication multiplier rouge x ×
❎ bouton croix multiplier vert x ×
➰ boucle bouclette
➿ boucle double
〽 alternance symbole
©️ c copyright auteur droits intellectuelle propriété symbole ©
®️ commerciale déposée marque r ®
™️ commerciale déposée marque tm
🫟 holi peinture tâche éclaboussure
🔠 abcd alphabet latin latines lettres majuscules saisie
🔡 abcd alphabet latin latines lettre lettres minuscules saisie
🔢 1234 chiffres saisie
🔣 saisie symboles
🔤 abc alphabet latin lettres saisie
#️⃣ hashtag dièse diese
*️⃣ * étoile astérisque
0️⃣ chiffre 0 zéro
1️⃣ chiffre 1 un
2️⃣ chiffre 2 deux
3️⃣ chiffre 3 trois
4️⃣ chiffre 4 quatre
5️⃣ chiffre 5 cinq
6️⃣ chiffre 6 six
7️⃣ chiffre 7 sept
8️⃣ chiffre 8 huit
9️⃣ chiffre 9 neuf
🅰️ groupe sanguin a
🆎 groupe sanguin ab
🅱️ groupe sanguin b
🅾️ groupe sanguin o
🆑 bouton cl effacer icône
🆒 bouton cool icône
🆓 bouton gratuit icône
ℹ️ informations guichet i source
🆔 bouton icône id identifiant
Ⓜ️ cercle encerclé m
🆕 bouton icône nouveau nouveauté
🆖 bien bouton interdit mauvais ng pas
🆗 bouton icône ok
🅿️ bouton p panneau parking
🆘 bouton icône aide secours sos
🆙 bouton haut icône nouveau nouveauté up vers
🆚 bouton contre icône versus vs
🈁 bouton ici idéogramme japonais katakana
🈂 bouton frais idéogramme japonais katakana service
🈷 bouton idéogramme japonais mensuel montant
🈶 bouton gratuit idéogramme japonais pas payant
🈯 bouton idéogramme japonais réservé
🉐 affaire avantage bonne bouton idéogramme japonais
🈹 bouton idéogramme japonais rabais réduction
🈚 bouton gratuit idéogramme japonais
🈲 bouton idéogramme interdit japonais
🉑 acceptable accepter bouton idéogramme japonais
🈸 application appliquer bouton idéogramme japonais
🈴 bouton idéogramme japonais note passage réussir
🈳 bouton chambres disponibles idéogramme japonais vide
㊗ bouton félicitations idéogramme japonais
㊙ bouton idéogramme japonais secret
🈺 affaires bouton idéogramme japonais ouvert
🈵 bouton complet idéogramme japonais plénitude
🔴 cercle disque forme géométrie géométrique rond rouge
🟠 cercle disque forme géométrie géométrique orange rond
🟡 cercle disque forme géométrie géométrique jaune rond
🟢 cercle disque forme géométrie géométrique rond vert
🔵 bleu cercle disque forme géométrie géométrique rond
🟣 cercle disque forme géométrie géométrique rond violet
🟤 brun cercle disque forme géométrie géométrique marron rond
⚫ cercle disque forme géométrie géométrique noir rond
⚪ blanc cercle disque forme géométrie géométrique rond
🟥 carré forme géométrie géométrique rouge
🟧 carré forme géométrie géométrique orange
🟨 carré forme géométrie géométrique jaune
🟩 carré forme géométrie géométrique vert
🟦 carré forme géométrie géométrique bleu
🟪 carré forme géométrie géométrique violet
🟫 carré forme géométrie géométrique marron brun
⬛ carré forme grand géométrie géométrique noir
⬜ carré forme grand géométrie blanc
◼️ carré forme géométrie géométrique moyen noir
◻️ carré forme géométrie géométrique moyen blanc
▪️ carré forme géométrie moyen petit noir
▫️ carré forme géométrie moyen petit blanc
🔶 forme grand géométrie géométrique losange orange
🔷 bleu forme grand géométrie géométrique losange orange
🔸 forme géométrie géométrique losange orange petit
🔹 bleu forme géométrie géométrique losange petit
🔺 haut flèche forme géométrie géométrique pointant pointé rouge triangle vers
🔻 bas flèche forme géométrie pointant pointé rouge triangle vers
💠 bande bd dessin dessinée diamant géométrie géométrique intérieur point
🔘 bouton forme géométrie géométrique radio rond
🔳 blanc bouton carré forme géométrie
🔲 bouton carré forme géométrie noir
🏁 drapeau automobile course arrivée damier formule 1 ligne sport vainqueur
🚩 drapeau fanion golf rouge triangulaire
🎌 drapeaux croisés japonais
🏴 drapeau flotte noir vent
🏳️ drapeau blanc flotte vent
🏳️‍🌈 drapeau arc-en-ciel lgbt
🏳️‍⚧️ drapeau blanc bleu clair rose transgenre
🏴‍☠️ drapeau pillage piller pirate trésor
🇦🇨 drapeau ascension island
🇦🇩 drapeau andorra ad nation pays
🇦🇪 drapeau united arab emirates nation pays
🇦🇫 drapeau afghanistan af nation pays
🇦🇬 drapeau antigua barbuda nation pays
🇦🇮 drapeau anguilla ai nation pays
🇦🇱 drapeau albania al nation pays
🇦🇲 drapeau armenia am nation pays
🇦🇴 drapeau angola ao nation pays
🇦🇶 drapeau antarctica aq nation pays
🇦🇷 drapeau argentina ar nation pays
🇦🇸 drapeau american samoa ws nation pays
🇦🇹 drapeau austria at nation pays
🇦🇺 drapeau australia au nation pays
🇦🇼 drapeau aruba aw nation pays
🇦🇽 drapeau aland islands Åland nation pays
🇦🇿 drapeau azerbaijan az nation pays
🇧🇦 drapeau bosnia herzegovina nation pays
🇧🇧 drapeau barbados bb nation pays
🇧🇩 drapeau bangladesh bd nation pays
🇧🇪 drapeau belgium be nation pays
🇧🇫 drapeau burkina faso nation pays
🇧🇬 drapeau bulgaria bg nation pays
🇧🇭 drapeau bahrain bh nation pays
🇧🇮 drapeau burundi bi nation pays
🇧🇯 drapeau benin bj nation pays
🇧🇱 drapeau st barthelemy saint barthélemy nation pays
🇧🇲 drapeau bermuda bm nation pays
🇧🇳 drapeau brunei bn darussalam nation pays
🇧🇴 drapeau bolivia bo nation pays
🇧🇶 drapeau caribbean netherlands bonaire nation pays
🇧🇷 drapeau brazil br nation pays
🇧🇸 drapeau bahamas bs nation pays
🇧🇹 drapeau bhutan bt nation pays
🇧🇻 drapeau bouvet island norway
🇧🇼 drapeau botswana bw nation pays
🇧🇾 drapeau belarus by nation pays
🇧🇿 drapeau belize bz nation pays
🇨🇦 drapeau canada ca nation pays
🇨🇨 drapeau cocos islands keeling nation pays
🇨🇩 drapeau congo kinshasa democratic republic nation pays
🇨🇫 drapeau central african republic nation pays
🇨🇬 drapeau congo brazzaville nation pays
🇨🇭 drapeau switzerland ch nation pays
🇨🇮 drapeau cote d ivoire ivory coast nation pays
🇨🇰 drapeau cook islands nation pays
🇨🇱 drapeau chile nation pays
🇨🇲 drapeau cameroon cm nation pays
🇨🇳 drapeau china chinese prc pays nation
🇨🇴 drapeau colombia co nation pays
🇨🇵 drapeau clipperton island
🇨🇷 drapeau costa rica nation pays
🇨🇺 drapeau cuba cu nation pays
🇨🇻 drapeau cape verde cabo nation pays
🇨🇼 drapeau curacao curaçao nation pays
🇨🇽 drapeau christmas island nation pays
🇨🇾 drapeau cyprus cy nation pays
🇨🇿 drapeau czechia cz nation pays
🇩🇪 drapeau germany german nation pays
🇩🇬 drapeau diego garcia
🇩🇯 drapeau djibouti dj nation pays
🇩🇰 drapeau denmark dk nation pays
🇩🇲 drapeau dominica dm nation pays
🇩🇴 drapeau dominican republic nation pays
🇩🇿 drapeau algeria dz nation pays
🇪🇦 drapeau ceuta melilla
🇪🇨 drapeau ecuador ec nation pays
🇪🇪 drapeau estonia ee nation pays
🇪🇬 drapeau egypt eg nation pays
🇪🇭 drapeau western sahara nation pays
🇪🇷 drapeau eritrea er nation pays
🇪🇸 drapeau spain nation pays
🇪🇹 drapeau ethiopia et nation pays
🇪🇺 drapeau european union
🇫🇮 drapeau finland fi nation pays
🇫🇯 drapeau fiji fj nation pays
🇫🇰 drapeau falkland islands malvinas nation pays
🇫🇲 drapeau micronesia federated states nation pays
🇫🇴 drapeau faroe islands nation pays
🇫🇷 drapeau france nation french pays
🇬🇦 drapeau gabon ga nation pays
🇬🇧 drapeau united kingdom great britain northern ireland nation pays british UK english england union jack
🇬🇩 drapeau grenada gd nation pays
🇬🇪 drapeau georgia ge nation pays
🇬🇫 drapeau french guiana nation pays
🇬🇬 drapeau guernsey gg nation pays
🇬🇭 drapeau ghana gh nation pays
🇬🇮 drapeau gibraltar gi nation pays
🇬🇱 drapeau greenland gl nation pays
🇬🇲 drapeau gambia gm nation pays
🇬🇳 drapeau guinea gn nation pays
🇬🇵 drapeau guadeloupe gp nation pays
🇬🇶 drapeau equatorial guinea gn nation pays
🇬🇷 drapeau greece gr nation pays
🇬🇸 drapeau south georgia islands nation pays sandwich
🇬🇹 drapeau guatemala gt nation pays
🇬🇺 drapeau guam gu nation pays
🇬🇼 drapeau guinea bissau gw nation pays
🇬🇾 drapeau guyana gy nation pays
🇭🇰 drapeau hong kong sar china nation pays
🇭🇲 drapeau heard mcdonald islands
🇭🇳 drapeau honduras hn nation pays
🇭🇷 drapeau croatia hr nation pays
🇭🇹 drapeau haiti ht nation pays
🇭🇺 drapeau hungary hu nation pays
🇮🇨 drapeau canary islands nation pays
🇮🇩 drapeau indonesia nation pays
🇮🇪 drapeau ireland ie nation pays
🇮🇱 drapeau israel il nation pays
🇮🇲 drapeau isle of man nation pays
🇮🇳 drapeau india in nation pays
🇮🇴 drapeau british nation pays indian ocean territory
🇮🇶 drapeau iraq iq nation pays
🇮🇷 drapeau iran islamic republic nation pays
🇮🇸 drapeau iceland is nation pays
🇮🇹 drapeau italy nation pays
🇯🇪 drapeau jersey je nation pays
🇯🇲 drapeau jamaica jm nation pays
🇯🇴 drapeau jordan jo nation pays
🇯🇵 drapeau japan japanese nation pays
🇰🇪 drapeau kenya ke nation pays
🇰🇬 drapeau kyrgyzstan kg nation pays
🇰🇭 drapeau cambodia kh nation pays
🇰🇮 drapeau kiribati ki nation pays
🇰🇲 drapeau comoros km nation pays
🇰🇳 drapeau st kitts nevis saint nation pays
🇰🇵 drapeau north korea nation pays
🇰🇷 drapeau south korea nation pays
🇰🇼 drapeau kuwait kw nation pays
🇰🇾 drapeau cayman islands nation pays
🇰🇿 drapeau kazakhstan kz nation pays
🇱🇦 drapeau laos lao democratic republic nation pays
🇱🇧 drapeau lebanon lb nation pays
🇱🇨 drapeau st lucia saint nation pays
🇱🇮 drapeau liechtenstein li nation pays
🇱🇰 drapeau sri lanka nation pays
🇱🇷 drapeau liberia lr nation pays
🇱🇸 drapeau lesotho ls nation pays
🇱🇹 drapeau lithuania lt nation pays
🇱🇺 drapeau luxembourg lu nation pays
🇱🇻 drapeau latvia lv nation pays
🇱🇾 drapeau libya ly nation pays
🇲🇦 drapeau morocco ma nation pays
🇲🇨 drapeau monaco mc nation pays
🇲🇩 drapeau moldova republic nation pays
🇲🇪 drapeau montenegro me nation pays
🇲🇫 drapeau saint martin
🇲🇬 drapeau madagascar mg nation pays
🇲🇭 drapeau marshall islands nation pays
🇲🇰 drapeau north macedonia nation pays
🇲🇱 drapeau mali ml nation pays
🇲🇲 drapeau myanmar mm nation pays
🇲🇳 drapeau mongolia mn nation pays
🇲🇴 drapeau macao sar china nation pays
🇲🇵 drapeau northern mariana islands nation pays
🇲🇶 drapeau martinique mq nation pays
🇲🇷 drapeau mauritania mr nation pays
🇲🇸 drapeau montserrat ms nation pays
🇲🇹 drapeau malta mt nation pays
🇲🇺 drapeau mauritius mu nation pays
🇲🇻 drapeau maldives mv nation pays
🇲🇼 drapeau malawi mw nation pays
🇲🇽 drapeau mexico mx nation pays
🇲🇾 drapeau malaysia my nation pays
🇲🇿 drapeau mozambique mz nation pays
🇳🇦 drapeau namibia na nation pays
🇳🇨 drapeau new caledonia nation pays
🇳🇪 drapeau niger ne nation pays
🇳🇫 drapeau norfolk island nation pays
🇳🇬 drapeau nigeria nation pays
🇳🇮 drapeau nicaragua ni nation pays
🇳🇱 drapeau netherlands nl nation pays
🇳🇴 drapeau norway no nation pays
🇳🇵 drapeau nepal np nation pays
🇳🇷 drapeau nauru nr nation pays
🇳🇺 drapeau niue nu nation pays
🇳🇿 drapeau new zealand nation pays
🇴🇲 drapeau oman om symbol nation pays
🇵🇦 drapeau panama pa nation pays
🇵🇪 drapeau peru pe nation pays
🇵🇫 drapeau french polynesia nation pays
🇵🇬 drapeau papua new guinea nation pays
🇵🇭 drapeau philippines ph nation pays
🇵🇰 drapeau pakistan pk nation pays
🇵🇱 drapeau poland pl nation pays
🇵🇲 drapeau st pierre miquelon saint nation pays
🇵🇳 drapeau pitcairn islands nation pays
🇵🇷 drapeau puerto rico nation pays
🇵🇸 drapeau palestinian territories palestine nation pays
🇵🇹 drapeau portugal pt nation pays
🇵🇼 drapeau palau pw nation pays
🇵🇾 drapeau paraguay py nation pays
🇶🇦 drapeau qatar qa nation pays
🇷🇪 drapeau reunion réunion nation pays
🇷🇴 drapeau romania ro nation pays
🇷🇸 drapeau serbia rs nation pays
🇷🇺 drapeau russia russian federation nation pays
🇷🇼 drapeau rwanda rw nation pays
🇸🇦 drapeau saudi arabia nation pays
🇸🇧 drapeau solomon islands nation pays
🇸🇨 drapeau seychelles sc nation pays
🇸🇩 drapeau sudan sd nation pays
🇸🇪 drapeau sweden se nation pays
🇸🇬 drapeau singapore sg nation pays
🇸🇭 drapeau st helena saint ascension tristan cunha nation pays
🇸🇮 drapeau slovenia si nation pays
🇸🇯 drapeau svalbard jan mayen
🇸🇰 drapeau slovakia sk nation pays
🇸🇱 drapeau sierra leone nation pays
🇸🇲 drapeau san marino nation pays
🇸🇳 drapeau senegal sn nation pays
🇸🇴 drapeau somalia so nation pays
🇸🇷 drapeau suriname sr nation pays
🇸🇸 drapeau south sudan sd nation pays
🇸🇹 drapeau sao tome principe nation pays
🇸🇻 drapeau el salvador nation pays
🇸🇽 drapeau sint maarten dutch nation pays
🇸🇾 drapeau syria syrian arab republic nation pays
🇸🇿 drapeau eswatini sz nation pays
🇹🇦 drapeau tristan da cunha
🇹🇨 drapeau turks caicos islands nation pays
🇹🇩 drapeau chad td nation pays
🇹🇫 drapeau french southern territories nation pays
🇹🇬 drapeau togo tg nation pays
🇹🇭 drapeau thailand th nation pays
🇹🇯 drapeau tajikistan tj nation pays
🇹🇰 drapeau tokelau tk nation pays
🇹🇱 drapeau timor leste nation pays
🇹🇲 drapeau turkmenistan nation pays
🇹🇳 drapeau tunisia tn nation pays
🇹🇴 drapeau tonga to nation pays
🇹🇷 drapeau turkey nation pays
🇹🇹 drapeau trinidad tobago nation pays
🇹🇻 drapeau tuvalu nation pays
🇹🇼 drapeau taiwan tw nation pays
🇹🇿 drapeau tanzania united republic nation pays
🇺🇦 drapeau ukraine ua nation pays
🇺🇬 drapeau uganda ug nation pays
🇺🇲 drapeau u s outlying islands
🇺🇳 drapeau united nations un onu
🇺🇸 drapeau united states america nation pays
🇺🇾 drapeau uruguay uy nation pays
🇺🇿 drapeau uzbekistan uz nation pays
🇻🇦 drapeau vatican city nation pays
🇻🇨 drapeau st vincent grenadines saint nation pays
🇻🇪 drapeau venezuela ve bolivarian republic nation pays
🇻🇬 drapeau british virgin islands bvi nation pays
🇻🇮 drapeau u s virgin islands us nation pays
🇻🇳 drapeau vietnam viet nam nation pays
🇻🇺 drapeau vanuatu vu nation pays
🇼🇫 drapeau wallis futuna nation pays
🇼🇸 drapeau samoa ws nation pays
🇽🇰 drapeau kosovo xk nation pays
🇾🇪 drapeau yemen ye nation pays
🇾🇹 drapeau mayotte yt nation pays
🇿🇦 drapeau south africa nation pays
🇿🇲 drapeau zambia zm nation pays
🇿🇼 drapeau zimbabwe zw nation pays
🏴󠁧󠁢󠁥󠁮󠁧󠁿 drapeau england english
🏴󠁧󠁢󠁳󠁣󠁴󠁿 drapeau scotland scottish
🏴󠁧󠁢󠁷󠁬󠁳󠁿 drapeau wales welsh

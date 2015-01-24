# libretro-dat-pull
This is/was just a little script to do a POC create of libretodb dat files (they are used to create the actual database)
I will add new features to fit the conditions

Ok this is a first test version:
Here is an example how to use this.
We'll try to generate https://github.com/libretro/libretro-database/blob/master/dat/Sony%20-%20PlayStation.dat
First we have to analyze the database
Just select a console and you will get the first game for it from the db
First we select a system
~~~
    [thomas@HackBox libretro-dat-pull]$ python2 analyze.py openvgdb.sqlite
    1 3DO Interactive Multiplayer
    2 Arcade
    3 Atari 2600
    4 Atari 5200
    5 Atari 7800
    6 Atari Lynx
    7 Atari Jaguar
    8 Atari Jaguar CD
    9 Bandai WonderSwan
    10 Bandai WonderSwan Color
    11 Coleco ColecoVision
    12 GCE Vectrex
    13 Intellivision
    14 NEC PC Engine/TurboGrafx-16
    15 NEC PC Engine CD/TurboGrafx-CD
    16 NEC PC-FX
    17 NEC SuperGrafx
    18 Nintendo Famicom Disk System
    19 Nintendo Game Boy
    20 Nintendo Game Boy Advance
    21 Nintendo Game Boy Color
    22 Nintendo GameCube
    23 Nintendo 64
    24 Nintendo DS
    25 Nintendo Entertainment System
    26 Nintendo Super Nintendo Entertainment System
    27 Nintendo Virtual Boy
    28 Nintendo Wii
    29 Sega 32X
    30 Sega Game Gear
    31 Sega Master System
    32 Sega CD/Mega-CD
    33 Sega Genesis/Mega Drive
    34 Sega Saturn
    35 Sega SG-1000
    36 SNK Neo Geo Pocket
    37 SNK Neo Geo Pocket Color
    38 Sony PlayStation
    39 Sony PlayStation Portable
    40 Magnavox Odyssey2
~~~
As an example I choose Playstation 1 (38)
~~~
    [thomas@HackBox libretro-dat-pull]$ python2 analyze.py openvgdb.sqlite 38
    Fields you get:
    releaseCoverCart -> None
    releaseDeveloper -> Soft Machine
    romExtensionlessFileName -> ...Iru! (Japan)
    romDumpSource -> Redump
    romFileName -> ...Iru! (Japan).cue
    romID -> 63271
    releaseID -> 125238
    releaseReferenceImageURL -> http://www.gamefaqs.com/ps/572597-iru/images/box-10859
    TEMPromRegion -> Japan
    romHashMD5 -> 877BA8B62470C85149A9BA32B012D069
    regionID -> 13
    releasePublisher -> None
    romSize -> 200
    regionLocalizedID -> 13
    releaseTitleName -> ...Iru!
    romHeader -> None
    TEMPsystemName -> Sony PlayStation
    romLanguage -> Japanese
    systemID -> 38
    releaseDescription -> ...Iru! is an Adventure game, developed by Soft Machine and published by Takara,which was released in Japan in 1998.
    releaseDate -> Mar 26, 1998
    releaseCoverFront -> http://img.gamefaqs.net/box/3/5/1/307351_front.jpg
    romHashSHA1 -> B9FA0177FC63600EF97A341C1554DB0C4F493591
    TEMPsystemShortName -> PSX
    releaseReferenceURL -> http://www.gamefaqs.com/ps/572597-iru
    romSerial -> SLPS-00965
    romHashCRC -> 7D7F6E2E
    releaseCoverBack -> http://img.gamefaqs.net/box/3/5/1/307351_back.jpg
    TEMPregionLocalizedName -> Japan
    releaseGenre -> Adventure,General
    releaseCoverDisc -> None
~~~
We can see that the serial entry is saved under "romSerial".
The image is saved under "romFileName"
and for the description and name we can use "romExtensionlessFileName"

Now we just have to tell the script to generate the dat file (this will take around a minute)
For this example the command would be

~~~
    [thomas@HackBox libretro-dat-pull]$ python2 generate-libretrodat.py 38 '{"game":{"rom":{"serial":"romSerial","image":"romFileName"},"name":"romExtensionlessFileName","description":"romExtensionlessFileName"}}' ps.dat
~~~
You can even add multiple dictionaries the syntax is
~~~
python2 generate-libretrodat.py sqlite id string1 string1.dat string2 string2.dat
~~~

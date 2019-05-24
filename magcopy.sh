#!/bin/bash
echo "-------------------------"
echo " Magcopy 0.1 by yesimxev"
echo "........................."
command -v avrdude >/dev/null 2>&1 || { echo >&2 $'\n'"Magcopy requires avrdude, please install it!"$'\n'; exit 1; }
command -v arduino-cli >/dev/null 2>&1 || { echo >&2 $'\n'"Magcopy requires arduino-cli, please install it!"$'\n'; exit 1; }
if [ ! -f ~/Arduino/Magspoof/Magspoof.ino ]
then echo $'\n'"Creating the Arduino sketch.."$'\n' && arduino-cli sketch new Magspoof && cat Magspoof.ino.bak > ~/Arduino/Magspoof/Magspoof.ino
fi
read -r -s -p $'\n'"Please swipe your card"$'\n' magtracks
track1=$(cut -d ";" -f1 <<< $magtracks)
track2=$(cut -d ";" -f2 <<< $magtracks)
if [[ "$magtracks" == *%E* ]]
then
echo $'\n'"Magstripe read error, please try again!"$'\n'
exit 1
else
echo "Track 1: $track1"
echo "Track 2: $track2"
fi
read -r -p "Is it read succesfully? Y/n"$'\n' answer
if [[ "$answer" =~ ^([nN])+$ ]]
then
echo $'\n'"Please try again!"$'\n'
else
echo "$(date) $line "$magtracks"" >> log.txt
echo "Adding to magspoof source file.."$'\n'
sed -i "33s|.*|\""$track1"\\\0\"\, // Track 1|" ~/Arduino/Magspoof/Magspoof.ino
sed -i "34s|.*|\";"$track2"\\\0\" // Track 2|" ~/Arduino/Magspoof/Magspoof.ino
arduino-cli compile -b attiny:avr:ATtinyX5:cpu=attiny85,clock=internal8 ~/Arduino/Magspoof
echo $'\n'"Copying to the install folder.."$'\n'
cp ~/Arduino/Magspoof/Magspoof.attiny.avr.ATtinyX5.hex ~/magcopy/magspoof.hex
cd ~/magcopy
read -r -p "Ready to flash? Y/n"$'\n' answer
if [[ "$answer" =~ ^([nN])+$ ]]
then
echo $'\n'"Created magspoof.hex without flashing! You can flash with make install"$'\n'
else
make install
echo $'\n'"Done!"$'\n'
fi
echo "And remember, respect is everything!"
fi

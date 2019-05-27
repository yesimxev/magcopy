# Welcome to my Magcopy project!

This is a simple script for reading magstripe and flashing to ATtiny85 on your Magspoof device, using Raspberry GPIO.

Original credits to Samy Kamkar @samyk and Kirils Solovjovs @0ki for making this possible. Also for prb3333 for making the instructables for Raspberry. 

## Dependencies

A magstripe reader (I use MSR-100).
Raspberry Pi
Avrdude and arduino-cli installed with ATtiny85, and arduino core.
Add the ATtiny boards to your arduino-cli.yaml on your home folder
Install it along with arduino core

```
apt-get install avrdude arduino-cli
echo "board_manager:" > ~/arduino-cli.yaml
echo "additional_urls:" >> ~/arduino-cli.yaml
echo "- https://raw.githubusercontent.com/damellis/attiny/ide-1.6.x-boards-manager/package_damellis_attiny_index.json" >> ~/arduino-cli.yaml
arduino-cli core update-index
arduino-cli core install attiny:avr
arduino-cli core install arduino:avr

```

If you don't have a Raspberry Pi, this script is still enough make a flashable .hex file.

Prepare your Raspberry Pi and connect the ATtiny, using these instructions:

https://www.instructables.com/id/Programming-the-ATtiny85-from-Raspberry-Pi/

## Usage

`./magcopy.sh`

## Comaptibility

I have tested this on Kali Linux, can't guarantee if it works on other distros.

# Welcome to my Magcopy project!

This is a simple script for reading magstripe and flashing to ATtiny85 on your Magspoof device, using Raspberry GPIO.

Original credits to Samy Kamkar @samyk and Kirils Solovjovs @0ki for making this possible. Also for prb3333 for making the instructables for Raspberry. 

## Dependencies

```
apt-get install avrdude arduino-cli
```

If you don't have a Raspberry Pi, this script won't work. But still enough to make a flashable .hex file.

Prepare your Raspberry Pi and connect the ATtiny, using these instructions:

https://www.instructables.com/id/Programming-the-ATtiny85-from-Raspberry-Pi/

## Usage

`./magcopy.sh`

## Comaptibility

I have tested this on Kali Linux, can't guarantee if it works on other distros.

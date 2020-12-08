#!/usr/bin/env bash


echo -e " \n-==Erase chip==-"
#Erase
pk2cmd -PPIC16F628A -E -X

echo -e "\n-==Blank check==-"
#blank check
pk2cmd -PPIC16F628A -C


echo -e "\n-==Programming==-"
#program
pk2cmd -PPIC16F628A  -F/home/$USER/MPLABXProjects/Exhaust-hood_PIC16F628_asm/dist/default/production/Exhaust-hood_PIC16F628_asm.production.hex  -M -I -J -X -Y -R

echo -e "\n-==Power up from PikIt2==-"
pk2cmd -PPIC16F628A -A5 -R -T


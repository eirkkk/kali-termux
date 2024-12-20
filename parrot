#!/bin/bash
if [ $# -eq 0 ]
then
        echo "Empty argument, use --help to see available arguments"
elif [ $1 = "--start" ]
then
	unset LD_PRELOAD
	su -c "settings put global settings_enable_monitor_phantom_procs false"
	export ROOTFSPATH=/data/local/parrot
	sudo mount -o remount,dev,suid /data
	sudo mount proc -t proc $ROOTFSPATH/proc
	sudo mount sys -t sysfs $ROOTFSPATH/sys
	sudo mount --bind /dev $ROOTFSPATH/dev
        sudo mount --bind /dev $ROOTFSPATH/data
        sudo mount --bind /dev $ROOTFSPATH/system
	sudo mount --bind /dev/pts $ROOTFSPATH/dev/pts
	sudo mount --bind /sdcard $ROOTFSPATH/sdcard
        echo "Starting Termux-x11..."
	termux-x11 :0 &>/dev/null & pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 &>/dev/null & sleep 1
	echo ""
        echo -e "Termux-x11 started"
	echo ""
	sudo mount --bind $PREFIX/tmp/ $ROOTFSPATH/tmp/
	echo "Starting Droidbox..."
        echo ""
	sudo chroot $ROOTFSPATH /bin/su -
	sudo umount $ROOTFSPATH/proc
	sudo umount $ROOTFSPATH/sys
	sudo umount $ROOTFSPATH/dev/pts
	sudo umount $ROOTFSPATH/dev
        sudo umount $ROOTFSPATH/data
        sudo umount $ROOTFSPATH/system 
	sudo umount $ROOTFSPATH/sdcard
	sudo umount $ROOTFSPATH/tmp/
	pkill -f "app_process / com.termux.x11"
elif [ $1 = "--update" ]
then
	cd ~/
        curl -o setup.sh https://raw.githubusercontent.com/eirkkk/Droidbox/main/setup.sh && chmod +x setup.sh && ./setup.sh && rm setup.sh
elif [ $1 = "--uninstall" ]
then
        echo "Uninstalling Parrot..."
	if [ -c  /data/local/.kali/dev/urandom ]
	then
            for end_point in  /data/local/.kali/{proc,sys,dev{/pts,},sdcard}
            do
              	sudo umount "${end_point}" &>/dev/null
                if [[ $? != 0 ]]
        	then echo umount failed for "${end_point}"
                     exit 1
                fi
            done
	fi
        sudo rm -r  /data/local/parrot
        rm $PREFIX/bin/parrot
	echo "Done!"
elif [ $1 = "--version" ]
then
        echo "07.01.24"
elif [ $1 = "--help" ]
then
        echo "Parrot (Root version) - preconfigured Linux rootfs for Android"
        echo "Usage:  Parrot {argument}"
 	echo "Available arguments:"
        echo "--start - start Parrot"
        echo "--update - update Parrot"
        echo "--uninstall - uninstall Parrot (all data in rootfs will be clear)"
        echo "--version - show current version of Parrot"
        echo "--help - see available arguments"
else
        echo "Invalid argument, use --help to see available arguments"
fi
 

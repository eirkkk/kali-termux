# Install nethunter on Termux Android

This installs nethunter with xfce4 desktop on Termux. All scripts are from Andronix, I just compose and edit them to make the installer easier and smoother. It includes:

- [x] kali nethunter 
- [x] XFCE4 Desktop
- [x] TigerVNC Server
- [x] Non-root Account Creation
- [x] Audio Support
- [x] Chromium Browser

## Installation

Copy and paste this command to Termux:

### nethunter With XFCE4

```bash
pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/eirkkk/kali-termux/main/kali.sh && chmod +x kali.sh && bash kali.sh
```

### Start nethunter
After installation, on Termux, you can execute this command to run nethunter:

```bash
./kalis.sh
```


### Start VNC Server

On nethunter, run this command to start VNC Server:

```bash
vncserver :1
```

Then you can use VNC Client to connect to `localhost:1` 

### Stop VNC Server

On nethunter, run this command to stop VNC Server:

```bash
vncserver -kill :1
```

## VNC  For Android

VNC Viewer (from RealVNC) is the best when you use your phone. Unfortunately, it does not does not support Samsung DEX.

[AVNC](https://f-droid.org/en/packages/com.gaurav.avnc/index.html) is another good VNC client. In my opinion it is the best when you use your tablet or Samsung Dex.


### Install FireFox

On nethunter, run this command to install FireFox

```
sudo apt install firefox
```

Follow this url to fix firefox crash https://github.com/termux/proot/issues/139#issuecomment-751988264

### Install Theme & Icons

-  is the best for me. You can download it here: https://www.gnome-look.org/p/1334420/

- Vimix icon is nice. You can download it here: https://www.gnome-look.org/p/1273372/

- After download \*.tar.xz files you can extract them and copy to themes/icons folders:

```

mkdir -p ~/.local/share/icons ~/.local/share/themes
cd ~/Downloads
tar -xf "Prof--XFCE- 2.1.tar.gz"
mv "Prof--XFCE- 2.1" ~/.local/share/themes/
tar -xf Vimix.tar.xz
mv Vimix ~/.local/share/icons/

```

### Intall Oh My Zsh

```
cp ~/.profile ~/.zprofile
sudo apt install git curl zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

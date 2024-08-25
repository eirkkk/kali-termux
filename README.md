# Install nethunter on Termux Android

This installs nethunter with xfce4 desktop on Termux. All scripts are from Andronix, I just compose and edit them to make the installer easier and smoother. It includes:

- [x] kali nethunter 
- [x] XFCE4 Desktop
- [x] Termux X11
- [x] Non-root Account Creation
- [x] Audio Support

## Installation

Copy and paste this command to Termux:

### nethunter 

```bash
pkg install wget curl proot tar -y && wget https://raw.githubusercontent.com/eirkkk/kali-termux/main/kali.sh && chmod +x kali.sh && bash kali.sh
```

### Start nethunter
After installation, on Termux, you can execute this command to run nethunter:

```bash
kali --start
```



# Install nethunter on Termux Android

This installs nethunter with xfce4 desktop on Termux. All scripts are from Andronix, I just compose and edit them to make the installer easier and smoother. It includes:

- [x] Kali NetHnuter 
- [x] XFCE4 Desktop
- [x] Termux X11
- [x] Proot And Chroot
- [x] Audio Support

## Installation

Copy and paste this command to Termux:

### NetHnuter 

```bash
curl -o setup https://raw.githubusercontent.com/eirkkk/kali-termux/main/setup && chmod +x setup && ./setup && rm setup
```

### Start NetHnuter
After installation, on Termux, you can execute this command to run nethunter:

```bash
kali --start
```



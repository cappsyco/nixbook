**This is a fork of the original nixbook to add my own cusom COSMIC desktop config, specifically to provide out of box wifi support for older Macbooks. Thanks to the [original project](https://github.com/mkellyxp/nixbook) and [cosmix-saigon](https://github.com/thesaigoneer/cosmix-saigon).**

![nixbook os logo](https://github.com/user-attachments/assets/8511e040-ebf0-4090-b920-c051b23fcc9c)

**Convert your old computer (even chromebook) to a user friendly, lightweight, durable, and auto updating operating system build on top of NixOS.**

The goal is to create a "chromebook like" unbreakable computer to give to basic users who know nothing about Linux and won't need to ever worry about updates / upgrades.

---

## Step 1:  Install NixOS, choose the No Desktop option, and Enable unfree software

---

## Step 2:  Reboot, login, and connect to wifi, then hit ESC

```
nmtui
```

## Step 3:  Switch to unstable
```
nix-channel --add https://channels.nixos.org/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade
```

## Step 4:  Go to /etc and nix-shell git
```
cd /etc/
nix-shell -p git
```

## Step 5:  Clone the nixbook repo  (make sure you run as sudo and you're in /etc!)
```
sudo git clone https://github.com/cappsyco/nixbook
```

## Step 6:  Run the install script (run this with NO sudo)
```
cd nixbook
./install_cosmic.sh
```

## Step 8:  Enjoy nixbook!

You can always manually run updates by running **Update and Reboot** in the menu.

If you want to completely reset this nixbook, wipe off your personal data to give it to someone else, or start fresh, run **Powerwash** from the menu.

---

Notes:
- The Nix channel will be updated from this git config once tested, and will auto apply to your machine within a week
- Simply reboot for OS updates to apply.
- Don't modify the .nix files in this repo, as they'll get overwritten on update.  If you want to customize, put your nix changes directly into /etc/nixos/configuration.nix

---

If at any point you're having issues with your nixbook not updating, check the auto-update-config service by running 

```
sudo systemctl status auto-update-config
```

If it shows any errors, go directly to /etc/nixbook and run

```
sudo git pull --rebase
```

Then you can start the autoupdate service again by running

```
sudo systemctl restart auto-update-config
```

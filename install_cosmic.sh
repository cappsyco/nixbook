echo "This will delete ALL local files and convert this machine to a Nixbook!";
read -p "Do you want to continue? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo "Installing NixBook..."

  # Set up local files
  rm -rf ~/
  mkdir ~/Desktop
  mkdir ~/Documents
  mkdir ~/Downloads
  mkdir ~/Pictures
  mkdir ~/.local
  mkdir ~/.local/share
  cp -R /etc/nixbook/config/applications ~/.local/share/applications

  # The rest of the install should be hands off
  # Add Nixbook config and rebuild
  sudo sed -i '/hardware-configuration\.nix/a\      /etc/nixbook/base.nix' /etc/nixos/configuration.nix

  # Set up flathub repos while we have sudo
  nix-shell -p flatpak --run 'flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
  nix-shell -p flatpak --run 'flatpak remote-add --if-not-exists --user cosmic https://apt.pop-os.org/cosmic/cosmic.flatpakrepo'

  sudo nixos-rebuild switch

  reboot
else
  echo "Nixbook Install Cancelled!"
fi

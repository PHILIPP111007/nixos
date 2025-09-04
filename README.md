# NixOS

Installation:

```bash
sudo cp -r . /etc/nixos/

cp -r ./.config ~/.config/

sudo nixos-generate-config --show-hardware-config > /etc/nixos/hardware-configuration.nix

reboot
```

Collect garbage:

```bash
sudo nix-collect-garbage -d 
```

Update system:

```bash
sudo nixos-rebuild switch --upgrade
```

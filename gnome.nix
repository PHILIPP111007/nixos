{ pkgs, ... }:

{
  services.xserver.desktopManager.gnome.enable = false;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.blur-my-shell
  ];
}

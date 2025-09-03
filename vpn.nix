{ pkgs, ... }:

{
  # Enable Mullvad VPN
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn; # `pkgs.mullvad` only provides the CLI tool, use `pkgs.mullvad-vpn` instead if you want to use the CLI and the GUI.

  environment.systemPackages = with pkgs; [
    mullvad-closest

    mullvad-browser
    tor-browser
  ];
}

{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phil = {
    isNormalUser = true;
    description = "Phil";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      micromamba
      vscode
      lokinet
      fastfetch
      glxinfo
      libgcc
      python313
      go
      docker_28
      amnezia-vpn
      chromium
      zoom-us
    ];
  };
}

{ pkgs, ... }:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprlock.enable = false;
  services.hypridle.enable = false;

  environment.systemPackages = with pkgs; [
    hyprland
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    hyprpolkitagent
    waybar
    wofi
    dunst
    kdePackages.dolphin
    kdePackages.qtsvg
    fish
    wlogout
    pavucontrol
    figlet
    brightnessctl
    starship
    helix
    qutebrowser
    zathura
    mpv
    imv
    rofi-wayland
    grimblast
  ];
}

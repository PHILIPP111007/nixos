{
  # Hyprland
  programs.hyprland = {
   enable = true;
   withUWSM = true;
   xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.waybar.enable = true;
}

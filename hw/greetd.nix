{ pkgs, myuser, ... }:

{
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = myuser;
        # TODO: parameterize
        # sway Hyprland
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd sway";
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
  ];
}

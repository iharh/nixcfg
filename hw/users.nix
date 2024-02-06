{ ... }:

{
  users.users.iharh = {
    initialPassword = "pwd";
    isNormalUser = true;
    extraGroups = [ 
      "wheel"
      "networkmanager"
      "video"
    ];
    # packages = with pkgs; [
    #  firefox
    #];
  };
}

{ ... }:

{
  users.users.iharh = {
    initialPassword = "pwd";
    isNormalUser = true;
    extraGroups = [ 
      "wheel"
      "networkmanager"
    ];
    # packages = with pkgs; [
    #  firefox
    #];
  };
}

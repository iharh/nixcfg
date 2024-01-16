{ ... }:

{
  users.users.iharh = {
    initialPassword = "pwd";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}

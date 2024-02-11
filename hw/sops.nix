{ config, myuser, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
  
    age.keyFile = "/home/${myuser}/.config/sops/age/keys.txt";

    secrets = {
      gh_token = {
        # TODO: parameterize
        owner = config.users.users.iharh.name; 
      };
      "myservice/my_subdir/my_secret" = {
        owner = "config.users.users.${myuser}.name";
      };
    };
  };
}

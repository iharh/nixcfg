{ config, ... }:

{
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
  
    # TODO: parameterize
    age.keyFile = "/home/user/iharh/.config/sops/age/keys.txt";

    secrets = {
      example-key = { };
      "myservice/my_subdir/my_secret" = {
        # TODO: parameterize
        owner = config.users.users.iharh.name; 
      };
    };
  };
}

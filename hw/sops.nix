{ config, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
  
    # TODO: parameterize
    age.keyFile = "/home/iharh/.config/sops/age/keys.txt";

    secrets = {
      example_key = { };
      "myservice/my_subdir/my_secret" = {
        # TODO: parameterize
        owner = config.users.users.iharh.name; 
      };
    };
  };
}

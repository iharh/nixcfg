{ config, myuser, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
  
    age.keyFile = "/home/${myuser}/.config/sops/age/keys.txt";

    secrets = {
      gh_token = { };
      "myservice/my_subdir/my_secret" = {
        # TODO: parameterize
        owner = config.users.users.iharh.name; 
      };
    };
  };

    export GITHUB_TOKEN=$(cat /$XDG_RUNTIME_DIR/secrets/gh_token)

}

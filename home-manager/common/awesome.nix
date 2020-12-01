{ pkgs, ... } :
{
  # home.file

  xdg.configFile = {
    "awesome" = {
      source = ../config/awesome;
      recursive = true;
    };
  };
}

# stateVersion passed throught the specialArgs
{ stateVersion, ... }:

{
  system.stateVersion = stateVersion;
}

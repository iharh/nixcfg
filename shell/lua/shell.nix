with import <nixpkgs> {};
with lua52Packages;

# lua5_2.withPackages (ps: with ps; [ lgi ])

let
  libs = [lua cjson luasocket luasec lgi];
in
stdenv.mkDerivation rec {
  name = "lua-env";
  buildInputs = libs;

  shellHook = ''
    export LUA_CPATH="${lib.concatStringsSep ";" (map getLuaCPath libs)}"
    export LUA_PATH="${lib.concatStringsSep ";" (map getLuaPath libs)}"
  '';
}

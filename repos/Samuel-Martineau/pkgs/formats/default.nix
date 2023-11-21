{ lib, pkgs }:
rec {
  plist = {}: {

    generate = name: value: pkgs.callPackage ({ runCommand, libplist }: runCommand name {
      nativeBuildInputs = [ libplist ];
      value = builtins.toJSON value;
      passAsFile = [ "value" ];
    } ''
      plistutil -f xml -i "$valuePath" -o "$out"
    '') { };

    type = with lib.types; let
      valueType = nullOr
        (oneOf [
          bool
          int
          float
          str
          path
          (attrsOf valueType)
          (listOf valueType)
        ]) // {
        description = "Property list value";
      };
    in valueType;

  };
}

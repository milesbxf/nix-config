{ lib, ... }:

with lib;
{
  options = {
    theme = {
      deltaSyntaxTheme = mkOption { type = types.str; };

      hexCodes = {};
    };
  };
}
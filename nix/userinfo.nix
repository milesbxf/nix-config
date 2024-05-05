{lib, ...}:
with lib; {
  options = {
    userinfo = {
      username = mkOption {type = types.str;};
      name = mkOption {type = types.str;};
      email = mkOption {type = types.str;};
      uid = mkOption {type = types.int;};
      gpgKeyName = mkOption {
        type = types.str;
        default = "";
      };
    };
  };
}

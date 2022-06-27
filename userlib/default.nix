{...}:
let
  # lsFiles lists files (not directories) in the given path, returning the full, absolute path
  lsFiles = dir:
    map (f: builtins.toPath dir + ("/" + f))
      (let
        contents=builtins.readDir(dir);
       in
       # only return files
       builtins.filter(f: builtins.getAttr f contents == "regular") (builtins.attrNames contents)
      );
  # lsDirs lists directories in the given path, returning the full, absolute path
  lsDirs = dir:
    map (f: builtins.toPath dir + ("/" + f))
      (let
        contents=builtins.readDir(dir);
       in
       # only return directories
       builtins.filter(f: builtins.getAttr f contents == "directory") (builtins.attrNames contents)
      );
  concatFiles = files: builtins.concatStringsSep "\n" (map (f: builtins.readFile f) files);
in
{
  inherit lsFiles lsDirs concatFiles;
}


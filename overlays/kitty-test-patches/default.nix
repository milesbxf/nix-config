self: super: {
  kitty = super.kitty.overrideAttrs(old: {
    patches = old.patches ++ [
    ];
  });
}

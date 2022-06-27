self: super: {
  kitty = super.kitty.overrideAttrs(old: {
    patches = old.patches ++ [
      ./0001-Skip-failing-tests-for-now.patch
    ];
  });
}

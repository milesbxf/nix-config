let userlib = import ../userlib {}; in
(
  map (f: import f) (userlib.lsDirs ./.)
)
with builtins;
rec {
  defaultSystems = [
    "aarch64-linux"
    "aarch64-darwin"
    "i686-linux"
    "x86_64-darwin"
    "x86_64-linux"
  ];

  withDefaultSystems = withSystems defaultSystems;

  # What does this do?
  withSystems = systems: f: foldl' (cur: nxt:
  let
    ret = {
        "${nxt}" = f nxt;
    };
    in cur // ret) {} systems;
}

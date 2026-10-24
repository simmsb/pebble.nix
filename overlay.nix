final: prev: {
  python3 =
    let
      packageOverrides = final': prev': {
        libpebble2 = final'.callPackage ./derivations/libpebble2.nix { };
        websockify = prev'.websockify.overridePythonAttrs {
          doCheck = false;
        };
      };
    in
    (prev.python3.override {
      inherit packageOverrides;
      self = final.python3;
    });
  python3Packages = final.python3.pkgs;

  pdc-sequencer = final.callPackage ./derivations/pdc-sequencer.nix { };
  pdc_tool = final.callPackage ./derivations/pdc_tool.nix { };
  pebble-qemu = final.callPackage ./derivations/pebble-qemu { };
  pebble-tool = final.callPackage ./derivations/pebble-tool.nix { };
  pebble-toolchain-bin = final.callPackage ./derivations/pebble-toolchain-bin.nix { };
  pypkjs = final.callPackage ./derivations/pypkjs.nix { };
  pyv8 = final.callPackage ./derivations/pyv8 { };
}

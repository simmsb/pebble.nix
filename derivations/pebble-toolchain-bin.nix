{
  stdenv,
  lib,
  fetchzip,
  autoPatchelfHook,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "pebble-toolchain-bin";
  version = "4.44";

  src =
    ({
      x86_64-linux = fetchzip {
        url = "https://sdk.repebble.com/releases/${finalAttrs.version}/toolchain-linux-x86_64.tar.gz";
        hash = "sha256-DCbQ4sNJ42FMi9/WZvM9K5kdrF455rZ2DWTikBVjbSE=";
        stripRoot = false;
      };
      aarch64-darwin = fetchzip {
        url = "https://sdk.repebble.com/releases/${finalAttrs.version}/toolchain-mac-arm64.tar.gz";
        hash = "sha256-x5fupP5k8baGjdVqRlgJB1KbD0rtfcAWR/ebpHyrC7w=";
        stripRoot = false;
      };
    }).${stdenv.hostPlatform.system};

  nativeBuildInputs = lib.optional stdenv.hostPlatform.isLinux autoPatchelfHook;

  installPhase = ''
    mv toolchain-*/arm-none-eabi $out
  '';

  dontStrip = true;
})

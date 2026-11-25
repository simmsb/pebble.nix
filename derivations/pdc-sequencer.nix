{
  buildGoModule,
  lib,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "pdc-sequencer";
  version = "1";

  src = fetchFromGitHub {
    owner = "pebble-dev";
    repo = "bobby-assistant";
    rev = "4cb60f79deb133f36fbdba641100978490a7fc51";
    hash = "sha256-7b8s0xeqOKSwFi4Im73u1ExK1NtQ7fjK+yMkHpKSUdw=";
  };
  sourceRoot = "source/tools/pdc-sequencer";

  vendorHash = null;

  meta = {
    description = "Tool for constructing PDC sequences";
    homepage = "https://github.com/pebble-dev/bobby-assistant/blob/main/tools/pdc-sequencer";
    license = lib.licenses.asl20;
  };
}

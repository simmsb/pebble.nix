{
  buildPythonPackage,
  fetchFromGitHub,
  pyserial,
  setuptools,
  six,
  websocket-client,
}:

buildPythonPackage rec {
  pname = "libpebble2";
  version = "0.0.36";
  src = fetchFromGitHub {
    owner = "pebble-dev";
    repo = "libpebble2";
    tag = "v${version}";
    hash = "sha256-0KWHkI0/mG9GathROhuOVN5/vrUN9i4WJlQEaIVcqoI=";
  };

  propagatedBuildInputs = [
    pyserial
    six
    websocket-client
  ];

  pyproject = true;
  build-system = [ setuptools ];
}

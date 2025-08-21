{
  lib,
  python3Packages,
  fetchFromGitHub,
  gitUpdater,
}:

python3Packages.buildPythonPackage rec {
  pname = "python3-otr";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AGProjects";
    repo = "python3-otr";
    tag = version;
    hash = "sha256-jCyPEdWDEW1x0Id//yM67SvKvYpdyIfPmcCWiRgwvb0=";
  };

  build-system = with python3Packages; [
    setuptools
  ];

  dependencies = with python3Packages; [
    cryptography
    gmpy2
    python3-application
  ];

  pythonImportsCheck = [ "otr" ];

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Off-The-Record Messaging protocol implementation for Python";
    homepage = "https://github.com/AGProjects/python3-otr";
    license = lib.licenses.lgpl21Plus;
    teams = [
      lib.teams.ngi
    ];
  };
}

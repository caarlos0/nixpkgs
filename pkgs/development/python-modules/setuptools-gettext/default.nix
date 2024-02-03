{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, setuptools
}:

buildPythonPackage rec {
  pname = "setuptools-gettext";
  version = "0.1.7";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "breezy-team";
    repo = "setuptools-gettext";
    rev = "refs/tags/v${version}";
    hash = "sha256-R1zgE1Ai2r23bve+sKo27XkUcIAmlWSreHZNt5yh2DY=";
  };

  propagatedBuildInputs = [
    setuptools
  ];

  pythonImportsCheck = [
    "setuptools_gettext"
  ];

  meta = with lib; {
    changelog = "https://github.com/breezy-team/setuptools-gettext/releases/tag/v${version}";
    description = "setuptools plugin for building mo files";
    homepage = "https://github.com/breezy-team/setuptools-gettext";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ ];
  };
}

{ lib
, buildPythonPackage
, coverage
, fetchFromGitHub
, poetry-core
, pytest
, pythonOlder
, setuptools
}:

buildPythonPackage rec {
  pname = "pytest-testmon";
  version = "2.1.1";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "tarpas";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-zbMX9r9lftdm9hzXMZRZZ/GEDViGk9QiYYUhO9ZcEAc=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  buildInputs = [
    pytest
  ];

  propagatedBuildInputs = [
    coverage
  ];

  # The project does not include tests since version 1.3.0
  doCheck = false;

  pythonImportsCheck = [
    "testmon"
  ];

  meta = with lib; {
    description = "Pytest plug-in which automatically selects and re-executes only tests affected by recent changes";
    homepage = "https://github.com/tarpas/pytest-testmon/";
    changelog = "https://github.com/tarpas/pytest-testmon/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ dmvianna ];
  };
}

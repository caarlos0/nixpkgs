{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
, mkdocs
, wcmatch
}:

buildPythonPackage rec {
  pname = "mkdocs-include-markdown-plugin";
  version = "6.0.4";

  src = fetchFromGitHub {
    owner = "mondeja";
    repo = "mkdocs-include-markdown-plugin";
    rev = "v${version}";
    sha256 = "sha256-wHaDvF+QsEa3G5+q1ZUQQpVmwy+oRsSEq2qeJIJjFeY=";
  };

  pyproject = true;
  doCheck = false;

  nativeBuildInputs = [ hatchling mkdocs wcmatch ];

  meta = with lib; {
    description = "Mkdocs Markdown includer plugin.";
    homepage = "https://github.com/mondeja/mkdocs-include-markdown-plugin";
    license = licenses.asl20;
    maintainers = with maintainers; [ caarlos0 ];
  };
}

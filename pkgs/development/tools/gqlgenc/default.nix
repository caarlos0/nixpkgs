{ buildGoModule, fetchFromGitHub, lib }:

buildGoModule rec {
  pname = "gqlgenc";
  version = "0.17.0";

  src = fetchFromGitHub {
    owner = "yamashou";
    repo = "gqlgenc";
    rev = "v${version}";
    sha256 = "sha256-CkVPbMepkBpCeyRv30S6RTvBSe6BsJuit87x1S9GPMU=";
  };

  excludedPackages = [ "example" ];

  vendorHash = "sha256-6iwNykvW1m+hl6FzMNbvvPpBNp8OQn2/vfJLmAj60Mw=";

  meta = with lib; {
    description = "Go tool for building GraphQL client with gqlgen";
    homepage = "https://github.com/Yamashou/gqlgenc";
    license = licenses.mit;
    maintainers = with maintainers; [ milran ];
  };
}

{ lib, fetchFromGitHub, rustPlatform, makeWrapper, openssh, nix-serve }:

rustPlatform.buildRustPackage rec {
  pname = "nix-simple-deploy";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "misuzu";
    repo = pname;
    rev = version;
    sha256 = "1qq4fbsd2mvxblsggwbnh88mj18f3vrfzv1kgc7a92pfiwxznq8r";
  };

  cargoHash = "sha256-HVVE9m+BOCa9NeoXvj8OL1gqubI+0dGY3N6vG/GhzeQ=";

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram "$out/bin/nix-simple-deploy" \
      --prefix PATH : "${lib.makeBinPath [ openssh nix-serve ]}"
  '';

  meta = with lib; {
    description = "Deploy software or an entire NixOS system configuration to another NixOS system";
    homepage = "https://github.com/misuzu/nix-simple-deploy";
    platforms = platforms.unix;
    license = with licenses; [ asl20 /* OR */ mit ];
    maintainers = with maintainers; [ misuzu ];
    mainProgram = "nix-simple-deploy";
  };
}

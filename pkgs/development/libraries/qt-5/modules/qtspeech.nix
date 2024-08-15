{ lib, qtModule, stdenv, speechd-minimal, pkg-config }:

qtModule {
  pname = "qtspeech";
  propagatedBuildInputs = [ ];
  buildInputs = lib.optionals stdenv.isLinux [ speechd-minimal ];
  nativeBuildInputs = [ pkg-config ];
  outputs = [ "out" "dev" ];
}

{ boost
, cairo
, cmake
, cups
, fetchurl
, fontconfig
, freetype
, harfbuzzFull
, hunspell
, lcms2
, libjpeg
, libtiff
, libxml2
, pixman
, pkg-config
, podofo
, poppler
, poppler_data
, python3
, lib
, stdenv
, qt5
}:

let
  pythonEnv = python3.withPackages (
    ps: [
      ps.pillow
      ps.tkinter
    ]
  );
in
stdenv.mkDerivation (finalAttrs: {
  pname = "scribus";

  version = "1.6.2";

  src = fetchurl {
    url = "mirror://sourceforge/scribus/scribus-devel/scribus-${finalAttrs.version}.tar.xz";
    hash = "sha256-fv+bH0fjcuVrs2nx2+GP5JEBeJtea8/beJDgNGtkE4M=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    boost
    cairo
    cups
    fontconfig
    freetype
    harfbuzzFull
    hunspell
    lcms2
    libjpeg
    libtiff
    libxml2
    pixman
    podofo
    poppler
    poppler_data
    pythonEnv
    qt5.qtbase
    qt5.qtimageformats
    qt5.qttools
  ];

  meta = with lib; {
    maintainers = with maintainers; [
      arthsmn
    ];
    description = "Desktop Publishing (DTP) and Layout program";
    mainProgram = "scribus";
    homepage = "https://www.scribus.net";
    # There are a lot of licenses...
    # https://github.com/scribusproject/scribus/blob/20508d69ca4fc7030477db8dee79fd1e012b52d2/COPYING#L15-L19
    license = with licenses; [
      bsd3
      gpl2Plus
      mit
      publicDomain
    ];
    broken = stdenv.isDarwin;
  };
})

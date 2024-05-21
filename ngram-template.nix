{ stdenvNoCC,
  fetchzip,
  lang ? "fail",
  version ? "00000000",
  hash ? "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=",
  urlPrefix ? ""
}: stdenvNoCC.mkDerivation {
  pname = "languagetool-ngram-${lang}";
  inherit version;

  src = fetchzip {
    url = "https://languagetool.org/download/ngram-data${urlPrefix}-${lang}-${version}.zip";
    inherit hash;
  };

  dontBuild = true;
  dontConfigure = true;
  dontFixup = true;

  installPhase = ''
    mkdir -p $out/share/languagetool/ngrams
    ln -s $src $out/share/languagetool/ngrams/${lang}
  '';
}

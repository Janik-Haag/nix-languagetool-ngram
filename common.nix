{ pkgs }:
let
  testedLangs = map (x: x // { urlPrefix = "/ngrams"; }) [
    {
      lang = "de";
      version = "20150819";
      hash = "sha256-b+dPqDhXZQpVOGwDJOO4bFTQ15hhOSG6WPCx8RApfNg=";
    }
    {
      lang = "en";
      version = "20150817";
      hash = "sha256-v3Ym6CBJftQCY5FuY6s5ziFvHKAyYD3fTHr99i6N8sE=";
    }
    {
      lang = "es";
      version = "20150915";
      hash = "sha256-z+JJe8MeI9YXE2wUA2acK9SuQrMZ330QZCF9e234FCk=";
    }
    {
      lang = "fr";
      version = "20150913";
      hash = "sha256-mA2dFEscDNr4tJQzQnpssNAmiSpd9vaDX8e+21OJUgQ=";
    }
    {
      lang = "nl";
      version = "20181229";
      hash = "sha256-bHOEdb2R7UYvXjqL7MT4yy3++hNMVwnG7TJvvd3Feg8=";
    }
  ];
  untestedLangs = map (x: x // { urlPrefix = "/untested/ngram"; }) [
    {
      lang = "he";
      version = "20150916";
      hash = "sha256-O/2H/u5Cv5HBMNI/rN47Rm9DF9J55Ogve1UuG7Hduxg=";
    }
    {
      lang = "it";
      version = "20150915";
      hash = "sha256-5VSIDy+AXKehXlY2ssBbJt84PYhDa3VcU8VeDdiUHJk=";
    }
    {
      lang = "ru";
      version = "20150914";
      hash = "sha256-X2/TLHJHSylIaHYLbuWxHZ8zVjawv5w35niaHBM7pOg=";
    }
    {
      lang = "zh";
      version = "20150916";
      hash = "sha256-4BaskFHg8ReM8+fauj+/Gd+JAr/w/oFYgQxl/cEfIW4=";
    }
  ];
  langs = testedLangs ++ untestedLangs;
  ngrams = pkgs.lib.foldr (r: l: l // { "ngrams-${r.lang}" = pkgs.callPackage ./ngram-template.nix r; } ) {} langs;
in ngrams

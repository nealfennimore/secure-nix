{ lib, ... }:
let
  rules = builtins.readFile (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Neo23x0/auditd/d4a373a81ce3ea1930aa007ee32aa2f68c0b4db0/audit.rules";
    sha256 = "sha256:0lj63zns55wk947xb47yak1sqzs21lm2bxzy8ncylzc546n20mh8";
  });
in
{
  security.auditd.enable = lib.mkDefault true;
  security.audit = {
    enable = lib.mkDefault true;
    rules =
      let
        lines = lib.strings.splitString "\n" rules;
      in
      builtins.filter (line: (!lib.strings.hasPrefix "#" line) && line != "") lines;
  };
}

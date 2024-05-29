{ lib, ... }:
let
  rules = builtins.readFile (builtins.fetchurl {
    url = "https://raw.githubusercontent.com/Neo23x0/auditd/8ba9a8397b221aed85c66d3f1c5c4e336dd78a57/audit.rules";
    sha256 = "sha256:1vq57h3j856kfxbq4mcflxlvxk3dvqa9vv5qhf2d6wzjqx6w357i";
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

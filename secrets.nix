let
  pwnwriter = "ssh-ed25519 aaaac3nzac1lzdi1nte5aaaailr9gkvky8ax9bbqv0tfwcpk31km7vuurnitttzpdfis agenix@pwnwriter";
in
{
  "secrets/ssh-key.age".publicKeys = [ pwnwriter ];
  "secrets/gpg-key.age".publicKeys = [ pwnwriter ];
}

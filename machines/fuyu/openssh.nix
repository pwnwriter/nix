{ ... }:
{

  # users.users.pwn.openssh.authorizedKeys.keys = [
  #
  # ];

  services.openssh = {
    enable = true;
    # ports = [ 666 ];

    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };
}

{config, ...}:

{
    services.openssh = {
        enable = true;
        passwordAuthentication = false;
    };
        # users.users.lk.openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBSpljbG2//f7ln7RMOuV++QOUdzr7duIVLXhE2zpahE lukasz.konieczny.lk@protonmail.com" ];
}
{ config, ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      permitRootLogin = "no";
      #passwordAuthentication = false;
    };
  };
  users.users.lk.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFQV1Lae+Dzf/6Ji7kbqojsC/UfC8wqaSdd/L8bqYEvt lukasz.konieczny.lk@protonmail.com"
  ];
}

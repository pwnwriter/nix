{ inputs }:
(import ../../lib { inherit inputs; }).mkHome {
  username = "eipi";
  homeDirectory = "/home/eipi";
}

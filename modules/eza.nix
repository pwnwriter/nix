{ ... }:
{
  programs.eza = {
   enable = true;
   enableZshIntegration = true;
   icons = true;    
   git = true;
   extraOptions = [ "-T" "-L" "1"];
  };
}

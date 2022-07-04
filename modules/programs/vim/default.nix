
{ pkgs, ... }:

# make pkgs avaliable in lexical scope of the following expression
with pkgs;

# set the entire package as a local variable to include in environment.systemPackages
let myVim = vim_configurable.customize {
  
  # whatever name you want to use vim by
  # vim recommened 
  name = "vim";
  
  vimrcConfig = {
    
    # import .vimrc
    customRC = builtins.readFile ./.vimrc;
    
      plug.plugins = with pkgs.vimPlugins;
      [
        nerdtree
      ];
    };
    # make plugins avaliable to vam
    # vam.knownPlugins = pkgs.vimPlugins;
    
    # declare plugins to use
    # vam.pluginDictonaries = [
    #   { 
    #     names = [
    #         "nerdtree"
    #         "vim-nerdtree-tabs"
    #         "vim-nerdtree-syntax-highlight"
    #         "nerdtree-git-plugin"
    #         "vim-commentary"
    #         "vim-fugitive"
    #         "vim-airline"
    #         "vim-airline-themes"
    #         "vim-gitgutter"
    #         "vim-grepper"
    #         "csapprox"
    #         "delimitMate"
    #         "tagbar"
    #         "ale"
    #         "indentLine"
    #         "vim-rhubarb"
            
    #         "fzf-vim"
            
    #         "vimproc-vim"
    #         "vim-misc"
            
    #         "emmet-vim"
    #         "vim-javascript-syntax"
    #         "jedi-vim"
    #         "typescript-vim"
    #         "yats-vim"
    #         "vim-nix"
    #       #...
    #     ];
    #   }
    # ];
  # };
};
# include our customized vim package in systemPackages
in { 
  environment.systemPackages = with pkgs; [ myVim ]; 
  # set vim as default editor
  #environment.variables = { EDITOR = "vim"; };
}

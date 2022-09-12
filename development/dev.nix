{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    clang
    bmake

    nodejs-18_x
    # deno

    http-prompt

    heroku

    hadolint # docker linter

    dotnet-sdk

    # (python310.withPackages (ps: with ps;
    # [
    # ptpython

    # pyls-isort
    # rope
    # autopep8
    # flake8

    # colorama
    # psutil
    # pip
    # pynvim
    # yapf
    # jedi
    # pylint
    #   # jupyter
    # ]))
  ];
}

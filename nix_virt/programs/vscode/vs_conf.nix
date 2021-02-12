{config, pkgs, ...}:
{
    vscode.user = "lk";
    vscode.homeDir = "/home/lk"; 
    vscode.extensions = with pkgs.vscode-extensions; [
        bbenoist.Nix
        james-yu.latex-workshop
        ms-azuretools.vscode-docker
        # ms-mssql.mssql-1.10.0
        
        ms-python.python
        # ms-toolsai.jupyter

        redhat.vscode-yaml
        vscodevim.vim
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
            name = "atlascode";
            publisher = "atlassian";
            version = "2.8.5";
            sha256 = "1a07xvjmyanmwdf4vfh2lwq9zarh15phzdni2i9xf970hsp1g2mr";
        }
        {
            name = "vscode-great-icons";
            publisher = "emmanuelbeziat";
            version = "2.1.64";
            sha256 = "1ynb4dsjy0vsrqg084g8391k8f6bynx4mkf0j2b8f0c4d2yzbhma";
        }
        {
            name = "code-spell-checker";
            publisher = "streetsidesoftware";
            version = "1.10.2";
            sha256 = "1ll046rf5dyc7294nbxqk5ya56g2bzqnmxyciqpz2w5x7j75rjib";
        }
        {
            name = "code-spell-checker-polish";
            publisher = "streetsidesoftware";
            version = "1.0.6";
            sha256 = "0c8qgl879cxshjmjx2cyjspr2f8zzp2z4y7mp66rb3zwn5y4fr3k";
        }
        # {
        #     name = "mssql";
        #     publisher = "ms-mssql";
        #     version = "1.10.1";
        #     sha256 = "17vsw7rnzqzy5bcqa46l0cghs237vmlzvbnqhdyapc74d7v8g2gx";
        # }
        # {
        #     name = "vscode-postgres";
        #     publisher = "ckolkman";
        #     version = "1.1.16";
        #     sha256 = "031kgdsl9kw0jdycs65wvbrmqhsm65lcnmbp0rb9yf86638f6mw0";
        # }
        {
            name = "vscode-python-test-adapter";
            publisher = "littlefoxteam";
            version = "0.6.6";
            sha256 = "01y1r5jvrv0rgc2fd4f7d5qhnc4jdp1dyj6kcmlzayyd7sbk3aqg";
        }
        {
            name = "vscode-test-explorer";
            publisher = "hbenl";
            version = "2.19.5";
            sha256 = "1daawrjdyhqzwhjp7smrn6ww29kzyr82f139vljmjahln5mamj2r";
        }
        {
            name = "jupyter";
            publisher = "ms-toolsai";
            version = "2020.12.414227025";
            sha256 = "1zv5p37qsmp2ycdaizb987b3jw45604vakasrggqk36wkhb4bn1v";
        }
    ];
}
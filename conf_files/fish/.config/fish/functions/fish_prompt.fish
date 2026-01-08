function fish_prompt --description 'Gruvbox Dark one-line prompt'
    # Gruvbox Dark colors
    set normal (set_color normal)
    set bold (set_color --bold)
    set fg0  (set_color fb4934)  # Red
    set fg1  (set_color b8bb26)  # Green  
    set fg2  (set_color fabd2f)  # Yellow
    set fg3  (set_color 83a598)  # Aqua
    set fg4  (set_color d3869b)  # Purple
    set fg5  (set_color 8ec07c)  # Green2
    set fg6  (set_color fe8019)  # Orange
    set fg9  (set_color ebddb2)  # Light fg

    # Czas (FreeBSD)
    # printf '%s' $fg3(date "+%H:%M:%S") $normal ' '
    
    # User@Host - POPRAWIONE
    printf '%s' $bold$fg9$USER$normal '@' $fg5(hostname | cut -d. -f1) ' '
    
    # SSH IP
    if set -q SSH_CONNECTION
        set ssh_ip (echo $SSH_CONNECTION | awk '{print $3}')
        printf '%s' $fg3"[$ssh_ip] "
    end
    
    # Exit status
    if test $status -ne 0
        printf '%s' $fg0"✘$status "
    else
        printf '%s' $fg1'✔ '
    end
    
    # Katalog + Git
    printf '%s' $fg2(prompt_pwd)
    if git rev-parse --git-dir > /dev/null 2>&1
        set git_branch (git symbolic-ref --short HEAD 2>/dev/null; or git rev-parse --short HEAD)
        set git_status (git status --porcelain 2>/dev/null | wc -l)
        printf ' ' $fg4"git:" $fg3"($git_branch)"
        test $git_status -gt 0 && printf ' ' $fg6"●"
    end
    
    # CMD duration
    if test "$CMD_DURATION -gt 2000"
        printf '%s%s%.1fs' $fg0 '⏱' (math "$CMD_DURATION / 1000")
    end
    
    printf '%s' $normal ' > '
end

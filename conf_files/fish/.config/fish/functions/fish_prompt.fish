function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)
    set -l bold (set_color --bold)
    set -l fg0 (set_color fb4934) # Red
    set -l fg1 (set_color b8bb26) # Green  
    set -l fg2 (set_color fabd2f) # Yellow
    set -l fg3 (set_color 83a598) # Aqua
    set -l fg4 (set_color d3869b) # Purple
    set -l fg5 (set_color 8ec07c) # Green2
    set -l fg6 (set_color fe8019) # Orange
    set -l fg9 (set_color ebddb2) # Light fg

    set -l delim $fg6" > "$normal
    fish_is_root_user; and set delim $fg0" # "$normal

    set -l prompt_status #$fg5" ok"
    # test $last_status -ne 0; and set prompt_status $fg0" [$last_status]"$normal
    test $last_status -ne 0; and set prompt_status $bold$fg0" X"$normal

    # SSH IP
    if set -q SSH_CONNECTION
        set ssh_ip $fg2"|"(echo $SSH_CONNECTION | awk '{print $3}')"|"
    end

    set user $bold$fg9$USER$normal
    fish_is_root_user; and set user $bold$fg0$USER$normal

    set prompt_host $user$fg4@$fg5$hostname$normal

    # Shorten pwd if prompt is too long
    # set -l pwd " "$fg6(prompt_pwd)
    set -l pwd $bold$fg6" ("(basename $PWD)")"

    echo -n -s $prompt_host $ssh_ip $pwd $normal $prompt_status $delim
end

function fish_right_prompt
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

        set -g __fish_git_prompt_showdirtystate 1
        set -g __fish_git_prompt_showuntrackedfiles 1
        set -g __fish_git_prompt_showupstream informative
        set -g __fish_git_prompt_showcolorhints 1
        set -g __fish_git_prompt_use_informative_chars 1

        # Unfortunately this only works if we have a sensible locale
        string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
        and set -g __fish_git_prompt_char_dirtystate "dirty"
        set -g __fish_git_prompt_char_untrackedfiles "?"
    
        # The git prompt's default format is ' (%s)'.
        # We don't want the leading space.
        set -l vcs (fish_vcs_prompt '(%s)' 2>/dev/null)" "
    
        set -l time $fg1(date "+%R")$normal
    
        set -l duration "$cmd_duration$CMD_DURATION"
        if test $duration -gt 100
                set duration $fg0(math $duration / 1000)s$normal" "
        else
                set duration
        end
    
        set -q VIRTUAL_ENV_DISABLE_PROMPT
        or set -g VIRTUAL_ENV_DISABLE_PROMPT true
        set -q VIRTUAL_ENV
        and set -l venv $fg4(string replace -r '.*/' '' -- "$VIRTUAL_ENV")$normal

        echo -n -s $duration $venv $vcs $time
end

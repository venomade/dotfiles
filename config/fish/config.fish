if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose "Rosé Pine"
    fzf_configure_bindings --directory=\cf

    # set fish_greeting $(fastfetch)
    function fish_greeting
       fastfetch
    end
    set BROWSER firefox-esr
    set PATH "$PATH:$HOME/.local/bin"
    set EDITOR nvim

    function ls
        command eza $argv
    end

    abbr y yazi
    abbr v nvim
    abbr ec emacsclient -t
    abbr sudo doas

end

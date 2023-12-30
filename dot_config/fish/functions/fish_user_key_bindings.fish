function fish_user_key_bindings
    if test $TERM_PROGRAM = "iTerm.app"
        # Execute this once per mode that emacs bindings should be used in
        fish_default_key_bindings -M insert
    end

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
    # bind -s --preset Y kill-whole-line yank
    bind -s --preset Y kill-line yank
end
# fix fish_variables's fish_key_bindings = fish_default_key_bindings
# fix startship character vim_symbol not work
set fish_key_bindings fish_vi_key_bindings

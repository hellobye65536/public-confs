if status is-interactive
	# theme
	set --global fish_color_autosuggestion 949494
	set --global fish_color_cancel --reverse
	set --global fish_color_command 00ff87
	set --global fish_color_comment 00d700
	set --global fish_color_cwd green
	set --global fish_color_cwd_root red
	set --global fish_color_end ff5f00
	set --global fish_color_error brred
	set --global fish_color_escape brcyan
	set --global fish_color_history_current --bold
	set --global fish_color_host normal
	set --global fish_color_host_remote yellow
	set --global fish_color_normal normal
	set --global fish_color_operator brcyan
	set --global fish_color_param ffffff
	set --global fish_color_quote ff8700
	set --global fish_color_redirection 00afff --bold
	set --global fish_color_search_match --background=111
	set --global fish_color_selection white --bold --background=brblack
	set --global fish_color_status red
	set --global fish_color_user brgreen
	set --global fish_color_valid_path --underline
	set --global fish_pager_color_completion normal
	set --global fish_pager_color_description B3A06D --italics
	set --global fish_pager_color_prefix cyan --bold --underline
	set --global fish_pager_color_progress brwhite --background=cyan
	set --global fish_pager_color_selected_background --reverse

	# keybindings
	set --global fish_key_bindings fish_vi_key_bindings

	# abbrs
	abbr --add -- cls clear
	abbr --add -- echon 'printf "%s\n"'
	abbr --add -- hd 'hexdump -e \'"%08_ax " 16/1 "%02x "\' -e \'" " 16/1 "%_p" "\\n"\''
	abbr --add -- l 'ls -lF'
	abbr --add -- ll 'ls -alF'
	abbr --add -- v nvim

	abbr --add -- py python
	abbr --add -- pip 'python -m pip'

	abbr --add -- gg 'git status'
	abbr --add -- gga 'git add'
	abbr --add -- ggc 'git checkout'
	abbr --add -- ggd 'git diff'
	abbr --add -- ggdd 'git diff --staged'
	abbr --add -- ggl 'git log'
	abbr --add -- gglg 'git log --oneline --graph'
	abbr --add -- ggs 'git show'
	abbr --add -- ggp 'git pull'
	abbr --add -- ggpp 'git push'
	abbr --add -- ggcc 'git commit'
end

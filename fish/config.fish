if status is-interactive
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

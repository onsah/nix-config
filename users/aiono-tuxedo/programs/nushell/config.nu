# See: https://www.nushell.sh/book/configuration.html

# cd on quit for nnn
export def --env ncd [
	...args : string # Extra flags to launch nnn with.
	--selective = false # Change directory only when exiting via ^G.
]: nothing -> nothing {

	# The behaviour is set to cd on quit (nnn checks if $env.NNN_TMPFILE is set).
	# Hard-coded to its respective behaviour in `nnn` source-code.
	let nnn_tmpfile = $env
		| default '~/.config/' 'XDG_CONFIG_HOME'
		| get 'XDG_CONFIG_HOME'
		| path join 'nnn/.lastd'
		| path expand

	# Launch nnn. Add desired flags after `^nnn`, ex: `^nnn -eda ...$args`,
	# or make an alias `alias n = n -eda`.
	if $selective {
		^nnn ...$args
	} else {
		NNN_TMPFILE=$nnn_tmpfile ^nnn ...$args
	}

	if ($nnn_tmpfile | path exists) {
		# Remove <cd '> from the first part of the string and the last single quote <'>.
		# Fix post-processing of nnn's given path that escapes its single quotes with POSIX syntax.
		let path = open $nnn_tmpfile
			| str replace --all --regex `^cd '|'$` ``
			| str replace --all `'\''` `'`

		^rm -- $nnn_tmpfile

		cd $path
	}
}

$env.config.show_banner = false

# direnv integration
$env.config.hooks.env_change = { 
	PWD: { ||
		if (which direnv | is-empty) {
			return
		}

		direnv export json | from json | default {} | load-env
		# Direnv outputs $PATH as a string, but nushell silently breaks if isn't a list-like table.
		# The following behemoth of Nu code turns this into nu's format while following the standards of how to handle quotes, use it if you need quote handling instead of the line below it:
		# $env.PATH = $env.PATH | parse --regex ('' + `((?:(?:"(?:(?:\\[\\"])|.)*?")|(?:'.*?')|[^` + (char env_sep) + `]*)*)`) | each {|x| $x.capture0 | parse --regex `(?:"((?:(?:\\"|.))*?)")|(?:'(.*?)')|([^'"]*)` | each {|y| if ($y.capture0 != "") { $y.capture0 | str replace -ar `\\([\\"])` `$1` } else if ($y.capture1 != "") { $y.capture1 } else $y.capture2 } | str join }
		$env.PATH = $env.PATH | split row (char env_sep)
	}
}


# Misc aliases.
alias treeall="command tree -C -a -I .git"
alias tree="treeall --filelimit 50"
alias pyserver="python2 -m SimpleHTTPServer"
alias grip="grip --browser --user \"\$GITHUB_USER\" --pass \"\$GITHUB_PASSWORD\""
alias rerun="rerun --pattern '**/*' --no-notify"
alias diff='vimdiff'
alias sls='AWS_CLIENT_TIMEOUT=600000 serverless --aws-profile personal'
alias ipinfo='curl ipinfo.io | jq .'
alias etc='sudo etckeeper vcs'
alias etc_push='sudo $LIBEXEC/etc-push'
alias open='xdg-open'
alias m='make'
alias pacman='sudo pacman'
alias p='pacman'
alias y='yaourt'
alias psql='psql -U postgres'
alias jqless='jq . --color-output | less -R'
alias split_words="sed 's/\s/\n/g'"

# Make copy/paste-ing in commands from examples slightly more seamless.
alias '$'=''

# rsync="rsync -r --copy-links --delete --perms --human-readable --progress --exclude .git"
rsync="rsync -r --copy-links --delete --perms --human-readable --progress"
# shellcheck disable=SC2139
alias rsync="$rsync"
# shellcheck disable=SC2139
alias sync_dir="rerun --exit --pattern '**/*' -- $rsync ."
unset rsync

# List files installed on system by given package.
alias apt_files='dpkg-query --listfiles'

alias sz='source ~/.zshrc'
source_libs() {
    for file in "$ZSH_LIB/"* "$ZSH_PRIVATE_LIB"/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
}
alias sa="source_libs"

# XXX Don't work in Rescale session (or other Tmuxinator sessions?).
alias simple_prompt="SIMPLE_PROMPT=true sz"
alias simple_prompt_off="unset SIMPLE_PROMPT && sz"

which_edit() {
    # shellcheck disable=SC2230
    $EDITOR "$(which "$1")"
}

xrandr_off() {
    for arg in "$@"; do
        for output in $(xrandr | cut -d ' '  -f 1 | grep -i "$arg"); do
            xrandr --output "$output" --off
        done
    done
    conkywonky
}

# Ease transition between shell and vim.
alias :q="exit"
alias :qa="tmux kill-window"
alias :qa!="tmux kill-session"

# Copy/paste to/from system clipboard (xclip default is primary clipboard, i.e.
# middle-click clipboard).
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -out'

alias sys='sudo systemctl'
alias sS='sys status'

ss() {
    sys start "$@" && sleep 1 && sS "$@"
}

sr() {
    sys restart "$@" && sleep 1 && sS "$@"
}

du() {
    command du -h "$@" | sort -h
}
alias df='df --human-readable'

# Explain the current rustc error.
rustc_explain() {
    # Word splitting required here for this to work.
    # shellcheck disable=SC2046
    rustc --explain $( \
        cargo build 2>&1 | \
        awk -F 'rustc --explain' '{ print $2 }' | \
        cut -d '`' -f 1
    )
}

rgp() {
    rg --pretty "$@" | less
}

# Swap 2 filenames around, if they exist (from
# http://tldp.org/LDP/abs/html/sample-bashrc.html).
swap() {
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e "$1" ] && echo "swap: $1 does not exist" && return 1
    [ ! -e "$2" ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Pretty-print a YAML file as JSON.
yaml_to_json() {
    cat <<-RUBY | ruby | jq .
        require 'yaml'
        require 'json'
        puts YAML.load_file('$1').to_json
RUBY
}

alias sshaddbob='ssh-add ~/.ssh/id_rsa.bob'
alias sshaddaws='ssh-add ~/.ssh/aws_ireland.pem'

ssh_remove_last_key() {
    ssh-keygen \
        -f ~/.ssh/known_hosts \
        -R "$(history -n | tail -n 1 | cut -d@ -f2)"
}

absolute_path() {
    readlink --canonicalize --no-newline "$@"
}
alias path='absolute_path'

weather() {
    curl "wttr.in/$1"
}

# Create, output name of, and edit a temporary file, with optional extension
# and part of name from args.
scratch() {
    local extension name file

    extension="$1"
    name="$2"

    mkdir -p /tmp/scratch/
    file="$(mktemp "/tmp/scratch/${name}XXXXX.${extension}")"
    echo "$file"
    "$EDITOR" "$file"
}

# Echo to stderr.
echoerr() {
    echo "$@" >&2
}

alias urlencode='ruby -r cgi -e "puts CGI.escape(ARGV[0])"'
alias urldecode='ruby -r cgi -e "puts CGI.unescape(ARGV[0])"'

# Output commands from history in order from least to most used. Tweaked from
# https://dev.to/abhinav/which-is-the-most-used-command-in-your-shell-history-5ca1.
# Columns: usage rank | times used | percent usage | command.
most_used() {
    history 1 | \
        cat | \
        awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | \
        grep -v "./" | \
        column -c3 -s " " -t | \
        sort -n | \
        tac | \
        nl | \
        tac
}

# Compress and tar a directory.
# XXX Make this better:
# - check dir exists and use dir first
# - abort if no arg given
tar_dir() {
    tar -zcvf "$1".tar.gz "$1"
}

# Show output of `ps` for all processes matching `pgrep`.
pshow() {
    pgrep "$@" | xargs --no-run-if-empty ps -l
}

# Run https://github.com/joshuaclayton/unused via Docker, without needing to
# install locally.
unused_docker() {
    sudo systemctl start docker && \
        sudo docker run --rm -it -v "$(pwd)":/code joshuaclayton/unused unused "$@"
}



# Make VS Code accessible from terminal
# alias code="open -a 'Visual Studio Code.app'"

# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add AWS CLI to PATH
path+='/Users/onur/aws-cli/bin'

# Interactive cd (depends on lf)
lfcd() {
    dir=$(lf -print-last-dir "$@")
    while ! cd "$dir" 2> /dev/null
    do
        dir=$(dirname "$dir")
    done
}

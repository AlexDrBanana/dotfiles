#
# Loads local interactive shell setup.
#

# User paths.
typeset -gU path PATH
path=(
  "$HOME/.local/bin"
  /opt/{homebrew,local}/{,s}bin(N)
  $path
)
[[ -d "$HOME/.lmstudio/bin" ]] && path+=("$HOME/.lmstudio/bin")
export PATH

# User environment.
export EDITOR='code-insiders -w'

# Rustup/Cargo.
[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Node.js version management.
eval "$(fnm env --use-on-cd)"

# Prompt.
eval "$(starship init zsh)"

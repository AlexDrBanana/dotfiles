#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # OpenClaw Completion
# source <(openclaw completion --shell zsh)

export EDITOR='code-insiders -w'

if ! command -v rustc >/dev/null 2>&1 && ! command -v cargo >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  [[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
fi

if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/sguo/.lmstudio/bin"
# End of LM Studio CLI section


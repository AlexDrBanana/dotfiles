# Dotfiles

Personal shell configuration managed by chezmoi.

## Layout

- Chezmoi source directory: `~/.local/share/chezmoi`
- Managed Prezto config: `dot_zpreztorc` -> `~/.zpreztorc`
- Managed interactive Zsh config: `dot_zshrc.tmpl` -> `~/.zshrc`

Prezto itself is installed as an unmodified clone of
`https://github.com/sorin-ionescu/prezto.git` at `~/.zprezto`. `~/.zshrc` is
managed by chezmoi and sources Prezto with
`source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"`, which Prezto documents as the
supported way to keep existing Zsh configuration while loading Prezto.

`dot_zshrc.tmpl` uses `.chezmoi.os` for OS-specific setup:

- Universal: `~/.local/bin`, `EDITOR`, Cargo/Rustup, fnm, and Starship.
- macOS only: Homebrew/MacPorts search paths and LM Studio CLI.

## Common commands

```sh
chezmoi edit ~/.zpreztorc
chezmoi edit ~/.zshrc
chezmoi diff
chezmoi apply -v
chezmoi cd
```

Historical note: the first commit in this repository also captured older
`zshrc` and `zshenv` edits from the previous forked Prezto checkout. NVM setup
and startup-time installers were intentionally not migrated.

# Dotfiles

Personal shell configuration managed by chezmoi.

## Layout

- Chezmoi source directory: `~/.local/share/chezmoi`
- Managed Prezto config: `dot_zpreztorc` -> `~/.zpreztorc`
- Managed interactive Zsh config: `dot_zshrc` -> `~/.zshrc`

Prezto itself is installed as an unmodified clone of
`https://github.com/sorin-ionescu/prezto.git` at `~/.zprezto`. The managed
`~/.zshrc` sources Prezto's official `runcoms/zshrc` before applying local
interactive shell setup. The other standard runcoms remain Prezto-managed
symlinks.

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

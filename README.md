# Dotfiles

Personal shell configuration managed by chezmoi.

## Layout

- Chezmoi source directory: `~/.local/share/chezmoi`
- Managed Prezto config: `dot_zpreztorc` -> `~/.zpreztorc`
- Managed local Prezto module:
  `dot_zprezto-contrib/local/init.zsh` -> `~/.zprezto-contrib/local/init.zsh`

Prezto itself is installed as an unmodified clone of
`https://github.com/sorin-ionescu/prezto.git` at `~/.zprezto`. The standard
runcoms remain Prezto-managed symlinks. Local interactive shell setup is loaded
as an external Prezto module via `pmodule-dirs` in `~/.zpreztorc`.

## Common commands

```sh
chezmoi edit ~/.zpreztorc
chezmoi edit ~/.zprezto-contrib/local/init.zsh
chezmoi diff
chezmoi apply -v
chezmoi cd
```

Historical note: the first commit in this repository also captured older
`zshrc` and `zshenv` edits from the previous forked Prezto checkout. NVM setup
and startup-time installers were intentionally not migrated.

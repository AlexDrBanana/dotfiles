# Dotfiles

Personal shell configuration managed by chezmoi.

## Layout

- Chezmoi source directory: `~/.local/share/chezmoi`
- Managed Prezto config: `dot_zpreztorc` -> `~/.zpreztorc`
- Managed Prezto runcom links: `symlink_dot_zshrc.tmpl`,
  `symlink_dot_zshenv.tmpl`, `symlink_dot_zprofile.tmpl`,
  `symlink_dot_zlogin.tmpl`, and `symlink_dot_zlogout.tmpl`

Prezto itself is installed as an unmodified clone of
`https://github.com/sorin-ionescu/prezto.git` at `~/.zprezto`. The standard
runcoms such as `~/.zshrc` and `~/.zshenv` point back to
`~/.zprezto/runcoms/` through chezmoi-managed symlink source-state files.

## Common commands

```sh
chezmoi edit ~/.zpreztorc
chezmoi diff
chezmoi apply -v
chezmoi cd
```

Historical note: the first commit in this repository also captured older
`zshrc` and `zshenv` edits from the previous forked Prezto checkout. They were
removed from the active dotfiles layout so the framework files can stay
official.

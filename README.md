# Dotfiles

Personal shell configuration managed outside of the Prezto framework checkout.

Current managed links:

- `~/.zpreztorc` -> `~/dotfiles/zpreztorc`

Prezto itself is installed as an unmodified clone of
`https://github.com/sorin-ionescu/prezto.git` at `~/.zprezto`. The standard
runcoms such as `~/.zshrc` and `~/.zshenv` should point back to
`~/.zprezto/runcoms/`.

Historical note: the first commit in this repository also captured older
`zshrc` and `zshenv` edits from the previous forked Prezto checkout. They were
removed from the active dotfiles layout so the framework files can stay
official.

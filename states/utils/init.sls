fzf:
  cmd.run:
    - names:
      - brew install fzf
    - unless: brew list fzf

z:
  cmd.run:
    - names:
      - brew install z
    - unless: brew list z

ripgrep:
  cmd.run:
    - names:
      - brew install ripgrep
    - unless: brew list ripgrep

coreutils:
  cmd.run:
    - names:
      - brew install coreutils
    - unless: brew list coreutils

gpg:
  cmd.run:
    - names:
      - brew install gpg
    - unless: brew list gpg


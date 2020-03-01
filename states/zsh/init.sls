zsh-install:
  cmd.run:
    - names:
      - brew install zsh
    - unless: brew list zsh

zsh-completions-install:
  cmd.run:
    - names:
      - brew install zsh-completions
    - unless: brew list zsh-completions

zsh-syntax-highlighting:
  cmd.run:
    - names:
      - brew install zsh-syntax-highlighting
    - unless: brew list zsh-syntax-highlighting

zsh-autosuggestions:
  cmd.run:
    - names:
      - brew install zsh-autosuggestions
    - unless: brew list zsh-autosuggestions

zsh-link:
  file.symlink:
    - name: {{ grains.homedir }}/.zshrc
    - target: {{ grains.statesdir}}/zsh/files/zshrc
    - force: True

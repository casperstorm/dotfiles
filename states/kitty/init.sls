kitty-install:
  cmd.run:
    - names:
      - brew cask install kitty
    - unless: brew cask list tmux

kitty-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/kitty.conf
    - target: {{ grains.statesdir}}/kitty/files/kitty.conf
    - force: True

theme-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/nord.conf
    - target: {{ grains.statesdir}}/kitty/files/nord.conf
    - force: True

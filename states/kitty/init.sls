kitty-install:
  cmd.run:
    - names:
      - brew cask install kitty
    - unless: brew cask list kitty

kitty-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/kitty.conf
    - target: {{ grains.statesdir}}/kitty/files/kitty.conf
    - force: True
    - makedirs: True

theme-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/theme.conf
    - target: {{ grains.statesdir}}/kitty/files/theme.conf
    - force: True
    - makedirs: True

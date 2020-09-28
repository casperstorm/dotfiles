alacritty-install:
  cmd.run:
    - names:
      - brew cask install alacritty
    - unless: brew cask list alacritty


alacritty-folders:
  file.symlink:
    - name: {{ grains.configdir }}/alacritty
    - target: {{ grains.statesdir}}/alacritty/files
    - force: True
    - makedirs: True

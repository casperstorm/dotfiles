alacritty-install:
  cmd.run:
    - names:
      - brew cask install alacritty
    - unless: brew cask list alacritty

alacritty-link:
  file.symlink:
    - name: {{ grains.configdir }}/alacritty/alacritty.yml
    - target: {{ grains.statesdir}}/alacritty/files/alacritty.yml
    - force: True


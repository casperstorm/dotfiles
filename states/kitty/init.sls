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

nord-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/nord.conf
    - target: {{ grains.statesdir}}/kitty/files/nord.conf
    - force: True

yin-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/yin.conf
    - target: {{ grains.statesdir}}/kitty/files/yin.conf
    - force: True

meh-link:
  file.symlink:
    - name: {{ grains.configdir }}/kitty/meh.conf
    - target: {{ grains.statesdir}}/kitty/files/meh.conf
    - force: True


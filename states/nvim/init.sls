nvim-install:
  cmd.run:
    - names:
      - brew install nvim
    - unless: brew list nvim

nvim-folders:
  file.symlink:
    - name: {{ grains.configdir }}/nvim
    - target: {{ grains.statesdir}}/nvim/files
    - force: True

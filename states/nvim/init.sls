nvim-install:
  cmd.run:
    - names:
      - brew install nvim
    - unless: brew list nvim

init-link:
  file.symlink:
    - name: {{ grains.configdir }}/nvim/init.vim
    - target: {{ grains.statesdir}}/nvim/files/init.vim
    - force: True

plugins-link:
  file.symlink:
    - name: {{ grains.configdir }}/nvim/plugins.vim
    - target: {{ grains.statesdir}}/nvim/files/plugins.vim
    - force: True

coc-settings-link:
  file.symlink:
    - name: {{ grains.configdir }}/nvim/coc-settings.json
    - target: {{ grains.statesdir}}/nvim/files/coc-settings.json
    - force: True

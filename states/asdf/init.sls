asdf-install:
  git.cloned:
    - name: https://github.com/asdf-vm/asdf.git
    - target: {{ grains.homedir }}/.asdf

asdf-link:
  file.symlink:
    - name: {{ grains.configdir }}/asdf/asdfrc
    - target: {{ grains.statesdir}}/asdf/files/asdfrc
    - force: True

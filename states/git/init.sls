git-install:
  cmd.run:
    - names:
      - brew install git
    - unless: brew list git

git-link:
  file.symlink:
    - name: {{ grains.homedir }}/.gitconfig
    - target: {{ grains.statesdir}}/git/files/gitconfig
    - force: True

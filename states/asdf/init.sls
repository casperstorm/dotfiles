asdf-install:
  git.cloned:
    - name: https://github.com/asdf-vm/asdf.git
    - target: {{ grains.homedir }}/.asdf

asdf-yarn:
  cmd.run:
    - names:
      - asdf plugin-add yarn
      - asdf install yarn $(asdf latest yarn)
      - asdf global yarn $(asdf latest yarn)
    - unless:
      - asdf which yarn

asdf-nodejs:
  cmd.run:
    - names:
      - asdf plugin-add nodejs
      - bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
      - asdf install nodejs $(asdf latest nodejs)
      - asdf global nodejs $(asdf latest nodejs)
    - unless:
      - asdf which node

asdf-ruby:
  cmd.run:
    - names:
      - asdf plugin-add ruby
      - asdf install ruby $(asdf latest ruby)
      - asdf global ruby $(asdf latest ruby)
    - unless:
      - asdf which ruby

asdf-link:
  file.symlink:
    - name: {{ grains.configdir }}/asdf/asdfrc
    - target: {{ grains.statesdir}}/asdf/files/asdfrc
    - force: True
    - makedirs: True

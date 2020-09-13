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
      - asdf install yarn $(asdf latest nodejs)
      - asdf global yarn $(asdf latest nodejs)
    - unless:
      - asdf which nodejs

asdf-ruby:
  cmd.run:
    - names:
      - asdf plugin-add ruby
      - asdf install yarn $(asdf latest ruby)
      - asdf global yarn $(asdf latest ruby)
    - unless:
      - asdf which ruby

asdf-link:
  file.symlink:
    - name: {{ grains.configdir }}/asdf/asdfrc
    - target: {{ grains.statesdir}}/asdf/files/asdfrc
    - force: True
    - makedirs: True

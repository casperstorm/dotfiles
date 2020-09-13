tmux-install:
  cmd.run:
    - names:
      - brew install tmux
    - unless: brew list tmux

tmux-link:
  file.symlink:
    - name: {{ grains.configdir }}/tmux/.tmux.conf
    - target: {{ grains.statesdir}}/tmux/files/tmux.conf
    - force: True
    - makedirs: True

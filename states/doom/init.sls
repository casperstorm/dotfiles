emacs-install:
  cmd.run:
    - names:
      - brew tap d12frosted/emacs-plus
      - brew install emacs-plus
    - unless: brew list emacs-plus

doom-config-folder:
  cmd.run:
    - names:
      - mkdir {{ grains.configdir }}/doom

emacs-link:
  file.symlink:
    - name: /Applications/Emacs.app
    - target: /usr/local/opt/emacs-plus/Emacs.app
    - force: True

config-link:
  file.symlink:
    - name: {{ grains.configdir }}/doom/config.el
    - target: {{ grains.statesdir}}/doom/files/config.el
    - force: True

init-link:
  file.symlink:
    - name: {{ grains.configdir }}/doom/init.el
    - target: {{ grains.statesdir}}/doom/files/init.el
    - force: True

package-link:
  file.symlink:
    - name: {{ grains.configdir }}/doom/packages.el
    - target: {{ grains.statesdir}}/doom/files/packages.el
    - force: True

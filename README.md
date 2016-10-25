# meshdoxer

A Docker Container for Meshmixer.

Meshmixer does not work with current ubuntu distributions. _meshdoxer_ will install Docker or use an existing Docker installation and create a Container with a minimal Ubuntu 14.04 installation which will be used to run Meshmixer

Please execute `meshdoxer` only in its home folder.

Use `./meshdoxer.sh` install to setup the Container

Use `./meshdoxer.sh` to start Meshmixer

Since Meshmixer is running isolated in its Container _meshdoxer_ will mount the `exchange` folder which can be used to exchange files with the host system.

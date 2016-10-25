# meshdoxer
Docker Container for Meshmixer
Meshmixer does not work with current ubuntu distributions.
mesdoxer will install docker or use an existing docker installation and create a
container with a minimal ubuntu 14.04 installation which will be used to run
Meshmixer

use ./meshdoxer.sh install to setup the Container
use ./meshdoxer.sh to start Meshmixer

since Meshmixer is running isolated in its container meshdoxer will mount the
'exchange' folder in which can be used to exchange files with the host system.

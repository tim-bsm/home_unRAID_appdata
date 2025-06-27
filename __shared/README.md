# Shared module

This module contains any files or folders that are shared across containers. For instance, the [certificates](/shared/certs/) are being reused for `TLS` througout some containers.

For security reasons, the certificate and `.env`-files with my values have obviously not been pushed to the repository. Instead, I added template files so that the used environment variables are still visible. In fact, to use the containers the way I use them, you only have to insert your own values into the template files and the `_templ` part in the template files needs to be removed.  
The few already entered environment variables are either an advice of me to keep them like that or show that some things should be the same across multiple containers (e.g. `eghostname`).

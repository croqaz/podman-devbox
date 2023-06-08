# Devbox 🛠 📦

My attempt to create a DevBox.


## Usage

Build image like:

`$ podman build -t podman-devbox .`

Use it like:

`$ podman run -it --name devbox --net=host -v $HOME/.aws:/root/.aws -v $HOME/.config/gcloud:/root/.config/gcloud -v $HOME/Dev:/root/Dev -v $HOME/Dev/DEVBOX:/root -v `pwd`:/root/PWD podman-devbox`

This command will inject your host AWS config and Gcloud config, to be used in the container.
Also the current folder is mounted in `/root/PWD`, which is the container's work dir.

The `/root/Dev` could be a folder with local projects, that you may want to have available in the container.
The `/root/` folder is persisted outside the container, so you can safely remove/ rebuild/ update the image and still have all the .asdf, .config, .local folders next time you run it.


## License

MIT (C) Cristi Constantin.

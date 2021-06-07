# vagrant-rust-intellij
Vagrant box based on Debian 11 (Bullseye) including preinstalled Rust and JetBrains CLion (using Projector)

## Usage
To use this image, just clone the repository to a folder of your choice and run:
`vagrant up`

After a quick while, the image should be up and running. At that point, the Projector instance is reachable at the following URL (if you did not change the IP settings in the `Vagrantfile` that is):

`http://172.16.17.2:9999/`

## Notes
To have your files easily accessible outside the VM as well, place all your project files within the `/vagrant` directory. This directory is directly mapped to the __same__ folder the Vargantfile lies in.

## Screenshot
![image](https://user-images.githubusercontent.com/16503129/121055498-98215600-c7bd-11eb-9473-b76b7fedc175.png)

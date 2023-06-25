# development
code development image with preloaded software<br>

- terraform<br>
- azure cli<br>
- aws cli<br>

## BUILD
    git clone https://github.com/bhannigan/vaultwarden-manage.git
    cd vaultwarden-manage
    sudo docker build --tag vaultwarden-manage .

or in Portainer<br>
    images > build a new image
    name = **development**
    url = https://github.com/bhannigan/development.git
    build

# TODO
- add packer

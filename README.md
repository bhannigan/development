# development
code development image with preloaded software<br>

- terraform<br>
- azure cli<br>
- aws cli<br>

### shell build
    git clone https://github.com/bhannigan/development.git
    cd development
    sudo docker build --tag development .

### Portainer build
    images > build a new image
    name = development
    url = https://github.com/bhannigan/development.git
    build

## TODO
- add packer

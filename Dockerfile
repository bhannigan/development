<## set base image
#

  FROM phusion/baseimage-customizable

# Set correct environment variables.
  ENV HOME /root
  
# Use baseimage-docker's init process.
  CMD ["/sbin/my_init"]

  RUN /pd_build/python.sh
  
## install packages
#

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#  ARG DEBIAN_FRONTEND=noninteractive
#
#  RUN apt-get update               \
#   && apt-get upgrade -y           \
#   && apt-get install -y apt-utils \
#   && apt-get install -y           \
#        vim                        \
#        less                       \
#                lsb-release                \
#   && apt-get clean                \
#   && rm -rf /var/lib/apt/lists/*


## install terraform
#

  RUN wget -qO hashicorp.key https://apt.releases.hashicorp.com/gpg \
   && gpg --dearmor hashicorp.key \
   && mv hashicorp.key.gpg /usr/share/keyrings/hashicorp-archive-keyring.gpg \
   && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
   && apt-get update \
   && apt-get install terraform \
   && rm hashicorp.key


## install Azure CLI
#
  RUN curl -sL https://aka.ms/InstallAzureCLIDeb -o "azure_install.sh" \
   && bash azure_install.sh \
   && rm azure_install.sh


## install AWS CLI
#
  RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
   && unzip awscliv2.zip \
   && ./aws/install \
   && rm -rf aws awscliv2.zip


## add a user account
#
#  RUN useradd -ms /bin/bash user

# copy contents of local src directory to the working directory
# COPY ./src src

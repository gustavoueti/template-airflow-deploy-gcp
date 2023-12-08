# install required tools
sudo apt-get update -yq && apt-get install -yq \
     ca-certificates \
     curl \
     gnupg \
     lsb-release

# add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# set up the stable repository
echo \
 "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install Docker Engine
sudo apt-get update -yq && sudo apt-get install -yq \
     docker-ce \
     docker-ce-cli \
     containerd.io \
     docker-compose-plugin


# fetch airflow yaml
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.3/docker-compose.yaml'


# setting default airflow user
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env


############################################
#to run docker compose without sudo, need to add your user to docker user group
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
############################################

#initializing airflow
docker compose up airflow-init
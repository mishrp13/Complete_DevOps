Docker installation:

2️⃣ Install required prerequisites
sudo yum install -y yum-utils

3️⃣ Add Docker CE repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

4️⃣ Install Docker CE and Docker Compose
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


✅ docker-compose-plugin provides Docker Compose v2

5️⃣ Start Docker service
sudo systemctl start docker

6️⃣ Enable Docker to start on boot
sudo systemctl enable docker

7️⃣ Verify installation (important)
docker --version
docker compose version
systemctl status docker


You should see:

Docker version output

Docker service active (running)
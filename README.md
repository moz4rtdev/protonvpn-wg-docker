# protonvpn-wg-docker
This repository contains the configuration to run protonvpn with wireguard and even turn it into a proxy accessible on the host machine.

# Build
```bash
docker build -t protonvpn-wireguard .
```

# USAGE
> [!NOTE]
> I recommend that you create a folder and put your wg settings in it and then mount it along with the docker containe, after that you must pass two variables along with the docker command CONF and PORT.
```bash
docker run -d -v $(pwd)/configs:/root/configs --cap-add=NET_ADMIN -e CONF=wg0 -e PORT=9001 -p 9001:9001 --name proton-proxy protonvpn-wireguard
```
# TEST IP
```bash
curl -x http://localhost:9001 ifconfig.me
```

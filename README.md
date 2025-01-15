# Preload Docker Registry

Load container images into registry:v2 and build a new image containing those images

## Getting Started

```bash
git clone https://github.com/taemon1337/preload-registry.git
cd preload-registry

# build preloaded registry image
make build

# start preloaded registry image
make start

# exec into preloaded registry image
make exec

# download chart from preloaded registry (oci helm chart)
> helm pull oci://localhost:5000/traefik/traefik --version 34.0.0 --plain-http

# download image from preloaded registry (container image)
crane pull localhost:5000/traefik:2.10.4 traefik.img
```


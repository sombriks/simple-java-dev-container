# Simple java dev container

Dead simple podman/docker image to have a full-featured java development
environment with no special permissions.

## How to run this

First build the image

```bash
podman build .
```

Then check the image name with `podman images`

Using the correct image name, create a container from it:

```bash
 podman run -it -v .:/app:z -p 8080:8080 --name simple-java-dev dad314ea5038
```

Pay attention to use the
correct [selinux label](https://docs.docker.com/storage/bind-mounts/#configure-the-selinux-label)
so your container can share data with host machine.

Remember the general rule for volumes and ports: you define what to share on
Dockerfile, but only when creating/running is possible to define the bindings
for them. This is why more sophisticated things
like [docker-compose](https://docs.docker.com/compose/compose-file/) exists.

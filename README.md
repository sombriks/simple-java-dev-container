# Simple java dev container

Dead simple podman/docker image to have a full-featured java development
environment with no special permissions.

## How to run this

First build the image

```bash
podman build -t simple-java-dev-image:latest . 
```

Then check the image name with `podman images`

Using the correct image name, create a container from it:

```bash
podman run -it -v ${PWD}:/app:z -p 8080:8080 --name simple-java-dev simple-java-dev-image
```

If using windows with PowerShell try this:

```PowerShell
docker run -it -v ${pwd.Path}:/app:z -p 8080:8080 --name simple-java-dev simple-java-dev-image
```

**TODO**: it won't work due to a odd issue with line terminators. Working on a
future possible solution.

Pay attention to use the
correct [selinux label](https://docs.docker.com/storage/bind-mounts/#configure-the-selinux-label)
so your container can share data with host machine.

Remember the general rule for volumes and ports: you define what to share on
Dockerfile, but only when creating/running is possible to define the bindings
for them. This is why more sophisticated things
like [docker-compose](https://docs.docker.com/compose/compose-file/) exists.

## Caveats

When using docker instead of podman, the `-v .:/app:z` must be replaced
by `-v ${PWD}:/app:z`. Since it works for podman too, it's easier to keep the
second one as the default volume mount option.

Mac m1 machines have trouble if the base image does not offer a m1-enabled
image, and it will fail to build a usable image container.

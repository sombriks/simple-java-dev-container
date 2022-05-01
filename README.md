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

Volumes doesn't merge content, they override.

## Publishing

One lone container isn't that useful, so publish it might make the difference.

In order to proper publish, start by tagging it correctly:

```bash
podman build -t docker.io/<your docker hub username>/simple-java-dev-image:v1 . 
```

Then login into the registry and push the image:

```bash
$ podman login docker.io
Username: <your docker hub username>
Password: 
Login Succeeded!
[sombriks@ignis simple-java-dev-container]$ podman push <your docker hub username>/simple-java-dev-image
Getting image source signatures
Copying blob db5b424264fd done  
Copying blob da55b45d310b skipped: already exists  
Copying blob c7a419b33b89 skipped: already exists  
Copying blob 5bc4bcca545a skipped: already exists  
Copying blob 14fbd8039ba4 skipped: already exists  
Copying config 2c6c9a3ef6 done  
Writing manifest to image destination
Storing signatures
```

Now your image is available over the internet, no need to rebuild it. Very
useful when this one image should be used along others with a docker-compose.yml
file.

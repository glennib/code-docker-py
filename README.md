# code-docker-py

Docker image and compose file that creates a container that lets you develop using VS code.

Starting the container:
```bash
docker-compose up -d --build
```

After first start of container you should change ownership of the contents in the `config` directory from the host computer:
```bash
sudo chown -R $USER config
```

I've created a ssh target in `~/.ssh/config` on my host computer:
```
Host pydev
    HostName <localhost or the IP of the machine that runs Docker>
    User user
    Port 2222
```
Also, I've set up my ssh key on that target from host:
```bash
ssh-copy-id pydev
```
The password is `password`, as seen in the Dockerfile.

Now you can open a remote target from VS Code and select the `pydev` target.
The current setup expects your source code to be in the `dev` directory, but this is easily configurable.
You can also ssh in of course:
```bash
ssh pydev
```

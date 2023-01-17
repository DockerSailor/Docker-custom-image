# Docker-custom-image

Hello guys, today we´ll learn how to create our custom Docker images and how we can use them.


![alt text](https://github.com/DockerSailor/Docker-custom-image/blob/main/dockerlogo.png?raw=true)


First of all remember we can use precreated Docker images from [DockerHub](https://hub.docker.com/), like nginx, apache, mysql, etc. And we could skip all "hard work", but today were not here for that, we're here to learn about the importance of using custom images in Docker, and how to create them securely. Using custom images allows you to have full control over the environment in which your applications are running, and ensures that only the necessary components are included in the image. This can greatly reduce the attack surface of your system and increase security. In this tutorial, we will go over the steps to create a custom image and discuss best practices for securing it. By the end of this tutorial, you will have a better understanding of how to use custom images in Docker for enhanced security.

**Step 1**: *Download the root file system*

On this step we´ll download the root file system for Alpine linux, but why Alpine linux?

  - Alpine Linux is a popular choice for creating custom images for use in Docker containers because of its small footprint and minimalism. Some of the main reasons why Alpine Linux is a good image for Docker containers include:

  - Small size: Alpine Linux has a small footprint, which means that the images created using it are also smaller in size. This means that the images take up less space on the host machine, and can be transferred and stored more efficiently.

  - Minimalism: Alpine Linux is designed to be minimal and lightweight, which means that it only includes the essential packages and dependencies needed to run. This reduces the attack surface of the container, and makes it more secure.

  - Security: Alpine Linux is designed with security in mind, and uses a read-only root file system by default. This helps to prevent unauthorized changes to the image and can be used to protect the integrity of the container.

  - Package Management: Alpine Linux uses the apk package manager, which is simple and efficient, it allows you to easily add and remove packages from the image, and also provides the ability to roll back to previous versions of packages.

  - Compatibility: Alpine Linux is compatible with a wide range of architectures, including x86 and ARM, making it a versatile choice for different environments.

  - Community Support: Alpine Linux has a large and active community, which means that there are many resources available for troubleshooting and learning about the system.
  
In summary, Alpine Linux is a good image for Docker containers because it is small, minimal, secure, efficient, flexible and has community support. This makes it an ideal choice for creating custom images that are lightweight, secure, and easy to manage. To download the Alpine linux root file system we need to go to [Alpine linux website](https://alpinelinux.org/downloads/) and download the version that best suits our needs.

**Step 2**: *Create the Dockerfile*

Once we have downloaded the root file system we need to create a Dockerfile and follow this steps.

```
FROM scratch
ADD alpine-minirootfs-3.16.2-x86_64.tar.gz /
RUN apk update
RUN apk add nano
CMD ["/bin/sh"]
```

The explanation about the Dockerfile is the next:

  - The first line specifies the base image as scratch. This means that the image will be built from scratch and will not include any libraries, system tools, or runtime.
  - The ADD command is used to copy the alpine-minirootfs-3.16.2-x86_64.tar.gz file to the image. This file contains the minimal root file system for Alpine Linux.
  - The RUN command is used to update the package index by running apk update. This ensures that the latest packages are available for installation (If we don´t run this line we won´t be able to add packages because we´ll get an error).
  - The RUN command is used again to install the nano text editor by running apk add nano. This installs the nano package, which allows you to edit text files from the command line.
  - The CMD command is used to specify the command that will run when the container starts. In this case, it is /bin/sh, which starts a shell.

And that's all folks!

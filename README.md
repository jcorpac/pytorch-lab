# pytorch-lab

This project provides a pre-configured PyTorch environment within a Docker container, making it easy to start experimenting with PyTorch.

## Requirements

* Docker
* Docker Compose (optional, but recommended)
* Nvidia GPU drivers (optional, but recommended)

## Getting Started

### 1. Using the Pre-Built Image

Pull the latest jcorpac/pytorch-lab image from Docker Hub:

```docker pull jcorpac/pytorch-lab:latest```

### 2. Building the Image

If you'd like to customize the image, follow these steps:

1. Clone this repository:

    ``` git clone https://github.com/jcorpac/pytorch-lab.git ```

2. Navigate into the cloned directory:

    ```cd pytorch-lab```

3. Build the Docker image:

    ```docker build -t pytorch-lab .```

## Running the Container

### Using Docker Compose (Recommended)

``` docker compose up -d ```

* The docker-compose file included with this repository will set up all of the resources included in the docker run command below.
* The -d flag will run the container in the background.

### Using Docker

``` docker run -d --rm --gpus all -p 8888:8888 -v pytorch:/torch/notebooks -v jupyter-config:/root/.jupyter --name pytorch-lab jcorpac/pytorch-lab:latest ```

* This will map port 8888 (or whichever port your Jupyter environment is configured for) on your host machine to the container.
* The -d flag will run the container in the background.
* The --rm flag will remove the container when it is stopped.
* The --gpus all tag will allow for passthrough of the Nvidia GPU drivers on your machine.
* The first -v tag will attach, a volume called "pytorch" to your container in the /torch/notebooks directory. This volume will be used to store your Jupyter notebooks between instances of the container. If no volume named "pytorch" exists, it will be created. If you have an existing folder with Jupyter notebooks, you can mount that folder here in place of "pytorch".
* The second -v tag will attach, a volume called "jupyter-config" to your container to store Jupyter configuration files. This volume will be used to store your Jupyter configuration between instances of the container. If no volume named "jupyter-config" exists, it will be created.
* The --name tag will set the name of the container to "pytorch-lab". This is optional, but recommended.
* jcorpac/pytorch-lab:latest is the name of the Docker image to use. This will be the latest version of the image stored on my Docker Hub account. If you built a custom image, feel free to use that here instead.

## Accessing pytorch Lab

Once the container is running, open your web browser and go to:

``` http://localhost:8888 ```

You should now have access to your Jupyter Lab environment, fully equipped with PyTorch!

## Cleanup

Using either command will stop and remove the container. Any volumes attached to the container will remain to be used in the future.

### Using Docker Compose (Recommended)

 ``` docker-compose down ```

### Using Docker

 ``` docker stop pytorch-lab ```

## Author

[Jeff Corpac](https://github.com/jcorpac)

# Slate with Docker

Docker image to generate static API documentation using [Slate.](https://github.com/lord/slate)

## Getting Started

The idea is to use this Docker image like an application. Running the docker image will generate a folder with compiled html, javascipt and css for the documentation.

### Building the image

```
docker build -t slate
```

### Developing the doc

When writing the markdown documentation we would want to edit our markdown and then live preview the result. Assuming we have `docs` folder in current directory (example docs from Slate is attached in this repo):

```
docker run --rm -v $PWD/docs:/slate/source -p 4567:4567 -it slate dev
```

Then, the preview of the published html can be viewed at [127.0.0.1:5467](http://127.0.0.1:5467)

### Publishing the doc

```
docker run --rm -v $PWD/docs:/slate/source slate
```

The generated static html will appear in `docs/build/` folder in the host machine  
(Because of the volume mounting, you may need to reset the owner/group of `docs/build/`)
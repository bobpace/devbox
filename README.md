# devbox

## Installation

```
make
```

Run a volume container for the dotfiles:

    docker run --name home bobpace/devbox-home

Run one of the other dev boxes with --volumes-from home

    docker run -it --rm --volumes-from home bobpace/devbox-node

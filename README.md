# devbox

## Installation

```
make
```

Run a volume container for the dotfiles:

    docker run --name dotfiles bobpace/devbox-dotfiles

Run one of the other dev boxes with --volumes-from dotfiles

    docker run -it --rm --volumes-from dotfiles bobpace/devbox-node

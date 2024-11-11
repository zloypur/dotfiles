# NeoVim config

## Setup

1. Install NeoVim >= 10
2. Link this directory to `~/.config/nvim`
3. Install [packer](https://github.com/wbthomason/packer.nvim)
4. Install all packages via `:PackerInstall`
5. Install required LS and other packages via `:Mason`

## Java

To use as java install following packages via mason:

1. `jdtls`
2. `java-test`
3. `java-debug-adapter`

All java LS configurations is located in `ftplugin/java.lua`. 

To configure runtime for project create file `.nvim/java_runtime.json` with following content in project root

```json
[
  {
      "name": "JavaSE-17",
      "path": "path/to/java/17/home",
      "default": true
  },
  {
      "name": "JavaSE-21",
      "path": "path/to/java/21/home",
  }
]
```

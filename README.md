# Dotfiles

## Nvim

### Required binaries

#### FZF plugin

**fzf**

[sources](https://github.com/junegunn/fzf)

Install on MacOS:

```sh
$ brew install fzf
```

Install on Ubuntu/Debial:

```sh
$ sudo apt install fzf
```

Install on Fedora:

```sh
$ sudo dnf install fzf
```

Install on Arch:

```sh
$ sudo pacman -S fzf
```

**rg (RipGrep)**

[sources](https://github.com/BurntSushi/ripgrep)

Install on MacOS:

```sh
$ brew install ripgrep
```

Install on Arch:

```sh
$ sudo pacman -S ripgrep
```

Install on Fedora:

```sh
$ sudo dnf install ripgrep
```

Install on Ubuntu/Debian:

```sh
$ sudo apt-get install ripgrep
```

#### JSON

**jq**

[sources](https://github.com/jqlang/jq)

Install on MacOS:

```sh
$ brew install jq
```

Install on Arch:

```sh
$ sudo pacman -S jq
```

Install on Fedora:

```sh
$ sudo dnf install jq
```

Install on Ubuntu/Debian:

```sh
$ sudo apt install jq
```

#### Lua tools

**luals**

[sources](https://github.com/LuaLS/lua-language-server)

Install on MacOS:
```sh
$ brew install lua-language-server
```

Download from [GitHub](https://github.com/LuaLS/lua-language-server/releases).

**stylua**

[sources](https://github.com/JohnnyMorganz/StyLua)

Install on MacOS:
```sh
$ brew install stylua
```

Install via PiP/UV:
```sh
$ pip install git+https://github.com/johnnymorganz/stylua
$ uv tool install git+https://github.com/johnnymorganz/stylua
```

#### Go tools

**gopls**

[sources](https://cs.opensource.google/go/x/tools)

```sh
$ go install golang.org/x/tools/gopls@latest
```

**goimports**

[sources](https://cs.opensource.google/go/x/tools)

```sh
$ go install golang.org/x/tools/cmd/goimports@latest
```

**gofumpt**

[sources](https://github.com/mvdan/gofumpt)

```sh
$ go install mvdan.cc/gofumpt@latest
```

**delve**

[sources](https://github.com/go-delve/delve)

```sh
$ go install github.com/go-delve/delve/cmd/dlv@latest
```

#### Java tools

**jdtls**

> [!NOTE]
> The language server requires a runtime environment of Java 21 (at a minimum) to run. This should either be set in the JAVA_HOME environment variable, or on the user's path.

[sources](https://github.com/eclipse-jdtls/eclipse.jdt.ls)

Install MacOS:

```sh
$ brew install jdtls
```

Install from [tar](https://download.eclipse.org/jdtls/milestones/?d)

**java-debug**

[sources](https://github.com/microsoft/vscode-java-debug)

Download from [OpenVSX](https://open-vsx.org/extension/vscjava/vscode-java-debug) or build from source. Unpack to `~/.local/share/nvim/packages`.

**java-test**

[sources](https://github.com/microsoft/vscode-java-test)

Download from [OpenVSX](https://open-vsx.org/extension/vscjava/vscode-java-test) or build from source. Unpack to `~/.local/share/nvim/packages`.

**lombok**

[sources](https://github.com/projectlombok/lombok)

Download from [site](https://https://projectlombok.org/download). Place a jar to `~/.local/share/nvim/packages/lombok/lombok.jar`.

#### Python tools

**pyright**

[sources](https://github.com/microsoft/pyright)

Install MacOS:

```sh
$ brew install pyright
```

Install from NPM:
```sh
$ npm install -g pyright
```

**black**

[sources](https://github.com/psf/black)

Install MacOS:

```sh
$ brew install black
```

Install from [GitHub](https://github.com/psf/black/releases).

**isort**

[sources](https://github.com/PyCQA/isort)

Install MacOS:

```sh
$ brew install isort
```

Install via PiP (or other):

```sh
$ pip3 install isort
```

#### C/C++ tools

**clangd & clang-format**

[sources](https://github.com/llvm/llvm-project/tree/main/clang-tools-extra/clangd)

Install on MacOS:

```sh
$ brew install llvm
```

Install of Fedora:

```sh
$ sudo dnf install clang-tools-extra
```

Download from [LLVM](https://releases.llvm.org/download.html)

**codelldb**

[sources](https://github.com/vadimcn/codelldb)

Download from [GitHub](https://github.com/vadimcn/codelldb/releases)

#### Terraform tools

**terraform-ls**

Install on MacOS:

```sh
$ brew install hashicorp/tap/terraform-ls
```

Download from [Hashicorp](https://releases.hashicorp.com/terraform-ls/)

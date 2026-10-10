# Emacs Configuration
## Features
- Syntax highlighting: R (ESS), C/C++, CUDA (`.cu` / `.cuh` in C++ mode), JSON, Markdown and Dockerfile.
- Diagnostics: C/C++ through Eglot/clangd/Flymake when clangd is installed; R through Flycheck and the R parser, without running the script. No automatic project builds.
- Code completion with Corfu/Cape; search and selection with Vertico, Orderless, Marginalia and Consult.
- Modus Vivendi dark theme in graphical Emacs, line numbers, matching and colored parentheses, indentation using spaces (tab width: 4).
- Persistent history, cursor positions and backups; temporary files stored in `var/`, protection against corrupted history. Which-key displays available shortcuts.

CUDA uses C++ highlighting. OpenMP/CUDA analysis depends on the flags and SDK; clangd runs in a separate process.

## Installation on a New PC
Use **Emacs 30 or newer** (built-in which-key). Check with `emacs --version`: some Debian/Ubuntu releases ship an older version.

### Arch Linux

```sh
sudo pacman -Syu --needed emacs clang gcc r ripgrep

# Optional: OpenMP and MPI headers
sudo pacman -S --needed openmp openmpi
```

[clang provides clangd](https://archlinux.org/packages/extra/x86_64/clang/files/), GCC provides standard C/C++ headers, and ripgrep provides project search.

### Debian / Ubuntu (apt)

```sh
sudo apt update
sudo apt install --no-install-recommends emacs-gtk clangd g++ r-base-core ripgrep

# Optional: OpenMP and MPI headers
sudo apt install --no-install-recommends libomp-dev libopenmpi-dev
```

For terminal use only, replace `emacs-gtk` with `emacs-nox`. [Debian 13 provides Emacs 30](https://packages.debian.org/trixie/emacs-gtk). Diagnostics/header packages: [clangd](https://packages.debian.org/trixie/clangd), [OpenMP](https://packages.debian.org/trixie/libomp-dev), [MPI](https://packages.debian.org/trixie/libopenmpi-dev).

### CUDA, Only If Needed Locally

```sh
# Arch
sudo pacman -S --needed cuda

# Debian / Ubuntu
sudo apt install --no-install-recommends nvidia-cuda-toolkit
```

The toolkit is large and optional for editing/highlighting. Available on [Arch](https://archlinux.org/packages/extra/x86_64/cuda/), or with [non-free on Debian](https://packages.debian.org/trixie/nvidia-cuda-toolkit) or [multiverse on Ubuntu](https://packages.ubuntu.com/noble/nvidia-cuda-toolkit) enabled.

### Copy the Configuration

From the directory containing this README, on the new PC:

```sh
mkdir -p ~/.emacs.d/lisp
cp init.el early-init.el README.md ~/.emacs.d/
cp lisp/my-*.el ~/.emacs.d/lisp/
emacs
```

Emacs packages are installed automatically on first startup with an Internet connection. Let Emacs recreate `elpa/`, `eln-cache/`, `etc/` and `var/`. `custom.el` is optional: review its settings before copying it.

## Project Headers

Create `compile_flags.txt` yourself at the project root: one flag per line, with paths adjusted to your system.

```text
-I/path/to/mpi/include
-I/path/to/my-library/include
```

clangd finds it in the source files’ parent directories, regardless of where you launch Emacs. `compile_commands.json` takes precedence. `-I` resolves headers; full OpenMP/CUDA analysis may require additional flags. [clangd documentation](https://clangd.llvm.org/installation.html#compile_flagstxt).

## Useful Keyboard Shortcuts

`C` = Ctrl, `M` = Alt. `C-x C-f` means Ctrl+x, then Ctrl+f.

| Shortcut | Action |
| --- | --- |
| `C-x C-f` / `C-x C-s` | Open / save a file |
| `C-x C-c` | Quit Emacs |
| `C-g` | Cancel the current command |
| `C-/` | Undo an edit |
| `C-s` | Search the current file with Consult |
| `C-c r` | Search the project with ripgrep |
| `C-x b` | Switch buffers |
| `M-g g` | Go to a line |
| `M-i` | Select a function or file section |
| `M-.` / `M-,` | Go to definition / return (with Eglot in C/C++) |
| `C-M-i` | Trigger completion manually |
| `C-x 2` / `C-x 3` | Split the window above/below or side by side |
| `M-←` / `M-→` / `M-↑` / `M-↓` | Move to the neighboring window |
| `C-x 0` / `C-x 1` | Close the current window / keep only this window |
| `C-c` / `C-x` / `C-v` | Copy / cut / paste with CUA; copy/cut require an active selection |
| `M-x` | Run a command by name |
| `C-h k` / `C-h m` | Describe a shortcut / show mode help |

Diagnostics: `M-x flymake-show-buffer-diagnostics` for C/C++; `M-x flycheck-list-errors` for R. After `C-x` or `C-c`, wait about 0.5 seconds for which-key help; without an active selection, these keys remain command prefixes.

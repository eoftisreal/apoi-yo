# VLC Media Player - Custom Remake

## Project Overview
This repository hosts a custom modification/remake of the VLC media player, based on the **VLC 4.0.0-dev ("Otto Chriek")** branch. It serves as a modern interpretation or customized distribution of the renowned open-source media engine, capable of playing most multimedia files, discs, streams, and devices.

## Repository Verification Status
During the verification of this repository, the following observations were made regarding the build environment and integrity:

- **Source Integrity**: The codebase is clean of merge conflicts and binary bloat.
- **Build System**: The project supports both **Autotools** and **Meson** build systems.
- **Dependencies**: A successful build requires a complete development environment. In standard verifications, the absence of tools like `flex`, `bison`, and `gettext` will cause the bootstrap process to fail.

## Getting Started

### Prerequisites
To build this project from source, you must ensure your system has the following core dependencies installed:

*   **Build Tools**: `automake`, `autoconf`, `libtool`, `pkg-config`, `make`, `ninja-build` (for Meson)
*   **Parsers & Lexers**: `flex`, `bison`
*   **Localization**: `gettext` (autopoint)
*   **Compilers**: GCC or Clang (C11/C++17 support required)

**Ubuntu/Debian Example:**
```bash
sudo apt-get install git build-essential pkg-config autoconf automake libtool bison flex gettext
```

### Build Instructions

#### Option 1: Autotools (Traditional)
1.  **Bootstrap**: Generate the configuration scripts.
    ```bash
    ./bootstrap
    ```
2.  **Configure**: Prepare the build.
    ```bash
    ./configure
    ```
    *Tip: Use `./configure --disable-qt` if you wish to build without the GUI.*
3.  **Build**:
    ```bash
    make
    ```

#### Option 2: Meson (Modern)
1.  **Setup**:
    ```bash
    meson setup build
    ```
2.  **Compile**:
    ```bash
    ninja -C build
    ```

## Project Structure
- `src/`: Core libvlccore source code.
- `lib/`: LibVLC engine source code.
- `modules/`: VLC plugins and modules (codecs, access, outputs).
- `extras/`: Build system extras and packaging tools.
- `bootstrap`: The initial script to set up the build system.

## License
This project is based on VLC and retains its licensing:
- **VLC**: GPLv2 (or later)
- **libVLC**: LGPLv2 (or later)

Please refer to the `COPYING` and `COPYING.LIB` files for full legal text.

## Disclaimer
This is a custom remake. For the official VLC media player project and support, please visit [VideoLAN.org](https://www.videolan.org).

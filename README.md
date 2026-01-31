# VLC Media Player - Custom Remake

## Project Overview
This repository hosts a custom modification/remake of the VLC media player, based on the **VLC 4.0.0-dev ("Otto Chriek")** branch. It serves as a modern interpretation or customized distribution of the renowned open-source media engine, capable of playing most multimedia files, discs, streams, and devices.

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

### Windows Build (Cross-Compilation / WSL)
The recommended way to build for Windows is using **WSL (Windows Subsystem for Linux)** or a Linux VM, cross-compiling with MinGW-w64.

1.  **Install Dependencies (Ubuntu/WSL)**:
    ```bash
    sudo apt-get install git wget bzip2 file libwine-dev unzip libtool libtool-bin libltdl-dev pkg-config ant \
        build-essential automake texinfo yasm p7zip-full autopoint \
        gettext cmake zip wine nsis g++-mingw-w64-i686 curl gperf flex bison \
        libcurl4-gnutls-dev python3 python3-setuptools python3-mako python3-requests \
        gcc make procps ca-certificates openjdk-11-jdk-headless nasm jq gnupg \
        meson autoconf
    ```

2.  **Build using the Helper Script**:
    VLC provides a dedicated script to handle contribs and configuration for Windows.
    ```bash
    mkdir build
    cd build
    ../extras/package/win32/build.sh -a x86_64
    ```
    *Note: This script will download and build necessary precompiled dependencies (contribs).*

For detailed instructions, including **MSYS2** setup and debugging, refer to [doc/BUILD-win32.md](doc/BUILD-win32.md).

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

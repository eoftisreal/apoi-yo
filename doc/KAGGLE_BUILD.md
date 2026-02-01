# Build VLC for Windows on Kaggle

This guide explains how to use a [Kaggle Notebook](https://www.kaggle.com/) to cross-compile this repository and generate a Windows Executable (`.exe`). This is useful if you do not have a powerful local machine or a Linux environment.

## Step 1: Create a New Notebook
1. Go to [Kaggle Kernels](https://www.kaggle.com/code).
2. Click **New Notebook**.
3. Ensure **Internet** access is enabled in the notebook settings (sidebar).

## Step 2: Paste and Run the Build Script
Copy the following code block into the first cell of your notebook and run it. This script will:
1. Install all necessary dependencies.
2. Clone this repository (if not already present).
3. Run the cross-compilation build script.
4. Compress the result for download.

```python
import os
import subprocess

# --- Configuration ---
REPO_URL = "https://github.com/videolan/vlc.git" # REPLACE WITH YOUR REPO URL IF DIFFERENT
BRANCH = "master" # or your specific branch
# ---------------------

def run_command(command):
    print(f"Running: {command}")
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    while True:
        output = process.stdout.readline()
        if output == '' and process.poll() is not None:
            break
        if output:
            print(output.strip())
    rc = process.poll()
    return rc

print(">>> Step 1: Installing Dependencies...")
# Update package list and install build tools + MinGW-w64
deps = "git wget bzip2 file libwine-dev unzip libtool libtool-bin libltdl-dev pkg-config ant " \
       "build-essential automake texinfo yasm p7zip-full autopoint gettext cmake zip wine nsis " \
       "g++-mingw-w64-x86-64 curl gperf flex bison libcurl4-gnutls-dev python3 python3-setuptools " \
       "python3-mako python3-requests gcc make procps ca-certificates openjdk-11-jdk-headless " \
       "nasm jq gnupg meson autoconf"

if run_command(f"apt-get update && apt-get install -y {deps}") != 0:
    raise Exception("Failed to install dependencies")

print("\n>>> Step 2: Cloning Repository...")
if not os.path.exists("vlc-repo"):
    if run_command(f"git clone {REPO_URL} vlc-repo") != 0:
        raise Exception("Failed to clone repository")
    os.chdir("vlc-repo")
    run_command(f"git checkout {BRANCH}")
else:
    os.chdir("vlc-repo")
    print("Repository already exists.")

print("\n>>> Step 3: Preparing Build Directory...")
if not os.path.exists("build"):
    os.mkdir("build")
os.chdir("build")

print("\n>>> Step 4: Starting Build (This may take 1-2 hours)...")
# Run the build script for Windows x86_64, creating an unsigned installer (-i u)
# We use 'bash' explicitly to avoid permission issues if the script lacks +x in the clone
build_cmd = "bash ../extras/package/win32/build.sh -a x86_64 -i u"

if run_command(build_cmd) != 0:
    raise Exception("Build failed! Check logs above.")

print("\n>>> Step 5: Packaging Output...")
# Find the EXE
exe_files = [f for f in os.listdir('.') if f.endswith('.exe')]
if not exe_files:
    print("Warning: No .exe file found in build directory. Checking subdirectories...")
else:
    print(f"Success! Found: {exe_files}")

# Zip the build directory contents or just the exe to make it downloadable via Kaggle UI
os.chdir("..")
run_command("zip -r vlc-windows-build.zip build/*.exe build/vlc-*-dev*")

print("\n>>> DONE! Download 'vlc-windows-build.zip' from the Output tab.")
```

## Step 3: Download the Executable
Once the script finishes:
1. Look at the **Output** section of the notebook (right sidebar or below the cell).
2. Download `vlc-windows-build.zip`.
3. Extract it on your Windows machine to find the installer.

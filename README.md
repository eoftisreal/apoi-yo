# apoi media player

**apoi** is a libre and open source **media player** and **multimedia engine**,
focused on **playing everything**, and **running everywhere**.

**apoi** can play most multimedia files, discs, streams, devices and is also able to
convert, encode, **stream** and manipulate streams into numerous formats.

apoi is used by many over the world, on numerous platforms, for very different use cases.

The **engine of apoi** can be embedded into 3rd party applications, and is called *libapoi*.

**apoi** is part of the [VideoLAN project](https://videolan.org) and
is developed and supported by a community of volunteers.

# Platforms

apoi is available for the following platforms:
- [Windows] *(from 7 and later, including UWP platforms and all versions of Windows 10)*
- [macOS] *(10.10 and later)*
- [GNU/Linux] and affiliated
- [BSD] and affiliated
- [Android] *(4.2 and later)*, including Android TV and Android Auto
- [iOS] *(9 and later)*, including AppleTV and iPadOS
- Haiku, OS/2 and a few others.

[Windows]: https://www.videolan.org/apoi/download-windows.html
[macOS]: https://www.videolan.org/apoi/download-macosx.html
[GNU/Linux]: https://www.videolan.org/apoi/#download
[BSD]: https://www.videolan.org/apoi/download-freebsd.html
[Android]: https://www.videolan.org/apoi/download-android.html
[iOS]: https://www.videolan.org/apoi/download-ios.html

Not all platforms receive the same amount of care, due to our limited resources.

**Nota Bene**: The [Android app](https://code.videolan.org/videolan/apoi-android/) and
the [iOS app](https://code.videolan.org/videolan/apoi-ios/) are located in different repositories
than the main one.

# Contributing & Community

**apoi** is maintained by a community of people, and VideoLAN is not paying any of them.\
The community is composed of developers, helpers, maintainers, designers and writers that want
this open source project to thrive.

The main development of apoi is done in the C language, but this repository also contains
plenty of C++, Obj-C, asm and Rust.

Other repositories linked to apoi are done in languages including Kotlin/Java [(Android)](https://code.videolan.org/videolan/apoi-android/),
Swift [(iOS)](https://code.videolan.org/videolan/apoi-ios/), and C# [(libapoiSharp)](https://code.videolan.org/videolan/libapoisharp/).

We need help with the following tasks:
- Coding
- Packaging for Windows, macOS and Linux distributions
- Technical writing for the documentation
- Design
- Support
- Community management and communication.

Please contribute :)

We are on IRC. You can find us on the **#videolan** channel on *[Libera.chat]*.

[Libera.chat]: https://libera.chat

## Contributions

Contributions are now done through Merge Requests on our [GitLab repository](https://code.videolan.org/videolan/apoi/).

CI and discussions should be resolved before a Merge Request can be merged.

# libapoi

**libapoi** is an embeddable engine for 3rd party applications and frameworks.

It runs on the same platforms as apoi *(and sometimes on more)* and can provide playback,
streaming and conversion of multimedia files and streams.


**libapoi** has numerous bindings for other languages, such as C++, Python and C#.

# Support

## Links

Some useful links that might help you:

- [apoi web site](https://www.videolan.org/apoi/)
- [Support](https://www.videolan.org/support/)
- [Forums](https://forum.videolan.org/)
- [Wiki](https://wiki.videolan.org/)
- [Developer's Corner](https://wiki.videolan.org/Developers_Corner)
- [apoi hacking guide](https://wiki.videolan.org/Hacker_Guide)
- [Bugtracker](https://code.videolan.org/videolan/apoi/-/issues)
- [VideoLAN web site](https://www.videolan.org/)

## Source Code sitemap
```
ABOUT-NLS          - Notes on the Free Translation Project.
AUTHORS            - apoi authors.
COPYING            - The GPL license.
COPYING.LIB        - The LGPL license.
INSTALL            - Installation and building instructions.
NEWS               - Important modifications between the releases.
README             - Project summary.
THANKS             - apoi contributors.

bin/               - apoi binaries.
bindings/          - libapoi bindings to other languages.
compat/            - compatibility library for operating systems missing
                     essential functionalities.
contrib/           - Facilities for retrieving external libraries and building
                     them for systems that don't have the right versions.
doc/               - Miscellaneous documentation.
extras/analyser    - Code analyser and editor specific files.
extras/buildsystem - Different build system specific files.
extras/misc        - Files that don't fit in the other extras/ categories.
extras/package     - apoi packaging specific files such as spec files.
extras/tools/      - Facilities for retrieving external building tools needed
                     for systems that don't have the right versions.
include/           - Header files.
lib/               - libapoi source code.
modules/           - apoi plugins and modules. Most of the code is here.
po/                - apoi translations.
share/             - Common resource files.
src/               - libapoicore source code.
test/              - Testing system.
```

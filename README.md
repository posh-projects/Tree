# Tree
[![Powershellgallery Badge][psgallery-badge]][psgallery-status]

List contents of directories in a tree-like format with colorization and lots of options.

![example 03](/Docs/Screenshots/03.png)

I frequently need a tree-style directory listing charts to include in my `GitHub` doc files. But the native windows `tree.com` implementation is far from perfect, and the Linux clone `Tree for Windows` renders the tree with legacy `ASCII` characters.
So I decided to spend a couple of hours to write this wrapper with color highlighting and proper leafs rendering support.

> This module uses [Tree for Windows](http://gnuwin32.sourceforge.net/packages/tree.htm) in order to get the initial directory structure and then colorizes its output and renders the unicode representation.

Make sure to download the [Tree for Windows](http://gnuwin32.sourceforge.net/packages/tree.htm) and make it accessible through your system `PATH` variable.

`Get-ChildItemTree` Understands all of its Linux `tree` counterpart, [command line switches](https://linux.die.net/man/1/tree). So, feel free to read the official [docs](https://linux.die.net/man/1/tree) for more info.

## Install
```powershell
PS> Install-Module Tree
```
> If you want the alias `tree` to work properly, add `Import-Module Tree` to your Powershell profile config.

Use `Get-ChildItemTree --help` for help.

- The path is optional
- Network paths supported `\\server.local\Path`

```powershell
# Generate the tree
# -a include hidden files
# -I exclude .git folder
PS>Get-ChildItemTree D:\Path -a -I .git
```
![example 01](/Docs/Screenshots/01.png)

```
.
├── FolderOne
│   ├── LICENSE
│   ├── archive.rar
│   └── text.txt
├── FolderThree
│   ├── FolderTwo
│   │   ├── SRC
│   │   │   ├── picture.png
│   │   │   └── unknown.yyy
│   │   ├── executable.ps1
│   │   └── unknown.yyy
│   └── text.md
└── FolderTwo
    ├── InnerFolder
    │   └── unknown.yyy
    ├── executable.ps1
    └── unknown.yyy
```

```Powershell
# -h Print the size of each file in a human readable way
# -p Print the file type and permissions for each file
Get-ChildItemTree D:\Path -a -h -p
```
![example 02](/Docs/Screenshots/02.png)

[psgallery-badge]: https://img.shields.io/badge/PowerShell_Gallery-1.0.1-green.svg
[psgallery-status]: https://www.powershellgallery.com/packages/Tree/1.0.1

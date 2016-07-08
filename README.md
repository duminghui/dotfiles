# dotfiles
base on [holman/dotfiles]

## my custom
add  `.dotfolder` and `.insymlink`

### .dotfolder
the folder postfix with .dotfolder will to create the folder that start with dot
this only work on top .dotfolder folder in .dotfiles

Example:
foo.dotfolder -> ~/.foo
foo.dotfolder/foo.dotfolder -> ~/.foo/.foo
foo/foo.dotfolder -> error

### .insymlink
the folder or file postfix with .insymlink whill to symlink folder or file
and this only work on top .dotfolder folder in .dotfiles

Example:
foo.dotfolder/foo.insymlink -> ~/.foo/foo
foo.dotfolder/foo.dotfolder/foo.insymlink -> ~/.foo/.foo/foo
foo.dotfolder/foo/foo.insymlink -> ~/.foo/foo/foo
foo/foo.dotfolder/foo.insymlink -> error

## conflict
there have same conflict config, now have no ideaer to fix

foo.dotfolder -> ~/.foo
foo/foo.symlink -> ~/.foo
there are the same target

[holman/dotfiles]:https://github.com/holman/dotfiles

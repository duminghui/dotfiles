# dotfiles
base on [holman/dotfiles]

## my custom
add  postfix `.dotfolder` and `.insymlink`

### .dotfolder
the folder postfix with .dotfolder will to create the folder that prefix with dot

this only work on top .dotfolder folder in .dotfiles

Example:
```
foo.dotfolder -> ~/.foo
foo.dotfolder/foo.dotfolder -> ~/.foo/.foo
foo/foo.dotfolder -> don’t processing
```

### .insymlink
the folder or file postfix with .insymlink whill to symlink folder or file

and this only work on top .dotfolder folder in .dotfiles

Example:
```
foo.dotfolder/foo.insymlink -> ~/.foo/foo
foo.dotfolder/foo.dotfolder/foo.insymlink -> ~/.foo/.foo/foo
foo.dotfolder/foo/foo.insymlink -> ~/.foo/foo/foo
foo/foo.dotfolder/foo.insymlink -> don’t processing
```

## conflict
there have same conflict config, now no idea to fix

```
foo.dotfolder -> ~/.foo
foo/foo.symlink -> ~/.foo
```
there are the same target

[holman/dotfiles]:https://github.com/holman/dotfiles

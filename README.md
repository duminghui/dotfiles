# now use dotter manager dotfiles

[SuperCuber/dotter]

[SuperCuber/dotter]:https://github.com/SuperCuber/dotter

# dotfiles (not use)
base on [holman/dotfiles]

## my custom
add  postfix `.dot` and `.symlink`

### .dot
the folder postfix with .dot will to create the folder that prefix with dot

this only work on top .dot folder in .dotfiles

Example:
```
foo.dot -> ~/.foo
foo.dot/foo.dot -> ~/.foo/.foo
foo/foo.dot -> don’t processing
```

### .symlink
the folder or file postfix with .symlink whill to symlink folder or file

and this only work on top .dot folder in .dotfiles

Example:
```
foo.dot/foo.symlink -> ~/.foo/foo
foo.dot/foo.dot/foo.symlink -> ~/.foo/.foo/foo
foo.dot/foo/foo.symlink -> ~/.foo/foo/foo
foo/foo.dot/foo.symlink -> don’t processing
```

## conflict
there have same conflict config, now no idea to fix

```
foo.dot -> ~/.foo
foo/foo.symlink -> ~/.foo
```
there are the same target

[holman/dotfiles]:https://github.com/holman/dotfiles

# Better Git Diff

This `gist` creates a better `git-diff` command. It includes created files and adds on the created lines into `git-diff`.

## Installing

To add it in, simply copy the `total.sh` file into the `~/` directory. Next, add in:

```bash
alias total="bash ~/total.sh"
```

Into the `.bashrc`. This assumes that `git` and `bash` are installed on your computer. As of now only supports Linux.

## Using

To use it, simply run `total` on the command line. Arguments passed in will be given straight to `git-diff`.

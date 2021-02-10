# GitHub Action to compare content of 2 folders

Use the [fiderent](https://github.com/carpentries/fiderent) R package to compare the md5sum hashes of the files in two separate folders. This GitHub Actions returns a text file that contains the list of the files (with their paths) that are different between the two compared folders.

Usage:

```yaml
- name: Identify files to invalidate
  uses: docker://fmichonneau/ga-compare-folders:latest
  env:
    FOLDER_1: _site_prev/
    FOLDER_2: _site/
    OUTPUT: changed_files.txt
    ADD_ROOTS: true
```

`FOLDER_1`, `FOLDER_2` and `OUTPUT` are required. `ADD_ROOTS` is optional. If `ADD_ROOTS` is `true`, then the folders that include `index.html` will be included in the list of files that are different.

If you compare 2 folders with the following layout:

```
- root_1/
  `-- index.html
README.md
```

and `index.html` is different in each folder but `README.md` is identical, when setting `ADD_ROOTS` to `true` the output will include `/root_1/` and `/root_1/index.html`, and when set to `false`, it will only include `/root_1/index.html`. If unspecified, the default is set to `true`.

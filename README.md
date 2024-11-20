# Tekabyte Website

Tech blogging site built with [Hugo](https://gohugo.io).

## Notes

### Creating a new site

Create a new site. Default configuration type is `toml`; set a different config file type wwith `-f`.

```shell
hugo new site <site-name> [-f {toml, yml}]
```

### Adding a theme

To add themes to hugo, add the theme repository as a submodule. For example, to add the `ananke` theme:

```shell
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

### Updating all themes

```shell
hugo mod get -u [github.com/user/theme-name]
```

### Removing a theme

To remove/uninstall a hugo theme, i.e. the `ananke` theme:

```shell
git submodule deinit -f -- themes/ananke
```

### Run hugo server

```shell
cd <hugo-site-dir>
hugo server
```

#### Specify host and/or port

```shell
hugo server --bind 0.0.0.0 --port 8000
```

#### Auto-load most recently changed page

```shell
hugo server --navigateToChanged
```

### Build Hugo server from a different path

If your `$CWD` is in a path other than the Hugo site, you can specify the path with `-s`:

```shell
hugo -s path/to/hugo/site
```

The `public/` directory will be created within the Hugo project regardless of where your terminal session is.


## Fixes

### Theme 'already exists in the index'

This often happens when installing, removing, then attempting to reinstall a theme with `git submodule add ...`.

Error: `fatal: 'quickstart/themes/til' already exists in the index`

**Fixes**

- Remove the theme, i.e. `rm -r <hugo-site>/themes/theme-name`
- If the theme you just removed was the theme you set in your config, change it to something else
- Run `git submodule deinit -f -- themes/theme-name`
- Search for references to the theme: `git ls-files --stage <theme-name>`
  - If you see output, like `160000 d00cf29f23627fc54eb992dde6a79112677cd86c 0   <theme-name>`, it means the repository was already added as a "gitlink."
  - Run `git submodule` to see if you see it there
  - Remove the theme from the cache with `git rm --cached <theme-name>`
- If this doesn't fix it, try running: `git rm -r --cached <theme-name>`
- If you see an error `fatal: please stage your changes to .gitmodules or stash them to proceed`, make sure to `git add .gitmodules` to commit your changes.
- If you are still seeing errors, or get a `fatal` error trying to re-add the repository, edit `.git/config`, search for `submodule "<theme-name>"`, and remove any references you find.

## Links

- [Hugo homepage](https://gohugo.io)
- [Hugo Github](https://github.com/gohugoio/hugo)
- [Hugo Themes](https://themes.gohugo.io)

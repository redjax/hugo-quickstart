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

## Links

- [Hugo homepage](https://gohugo.io)
- [Hugo Github](https://github.com/gohugoio/hugo)

# Tekabyte Website

Tech blogging site built with [Hugo](https://gohugo.io).

## Notes

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

## Links

- [Hugo homepage](https://gohugo.io)
- [Hugo Github](https://github.com/gohugoio/hugo)

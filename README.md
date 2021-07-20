# Docker for mdBook

## How to use in github actions?

```yaml
name: Pages

on:
  push:
    branches:
      - main
  release:
    types:
      - created
jobs:
  build:
    runs-on: ubuntu-20.04
    container:
      image: zitsen/mdbook
      options: --user root
    steps:
      - name: Checkout
        uses: actions/checkout@v1

      - name: Build
        run: mdbook build && cp ci/index.html book/ && touch book/.nojekyll && sed -i 's#\.\./\.\./en#../en#' book/zh/*.html

      - name: Publish
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./book
```

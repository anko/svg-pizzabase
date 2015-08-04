# visbuild

Script to help create SVG visualisations from JavaScript code.

## How

Pass client JavaScript on `stdin`.  In that script, append stuff to the `<svg
id='vis'` present on the page.  When that script finishes running, the SVG is
extracted, the proper doctype stuff added, and the finished SVG is printed on
`stdout`.

You might need [browserify][1] (or [webpack][2], or another bundler) to get
[D3][3] (or whatever other JS library you want to use) into the same file for
writing to stdin.

## Why

I often draw stuff to clarify [my Game Development SE answers][4].  Sometimes
it's convenient to draw with [D3][5] code.  This eases that.  Give it code and
it will give you the picture.

## Bonus tip: PNG conversion

To convert an SVG into a PNG image, I recommend [Inkscape][6]'s command line:

```sh
inkscape picture.svg --export-png=picture.png --export-area-drawing
```

I tried [ImageMagick][7]'s command line, but it tends to crop stuff all funky
and renders text badly.  YMMV.

[1]: https://www.npmjs.com/package/browserify
[2]: https://github.com/webpack/webpack
[3]: http://d3js.org/
[4]: http://gamedev.stackexchange.com/users/7804/anko?tab=answers
[5]: http://d3js.org/
[6]: https://inkscape.org/
[7]: http://www.imagemagick.org/

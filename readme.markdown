# svg-pizzabase

Script to help create SVG visualisations from JavaScript code headlessly and
server-side.  Like a ready-made pizza-base: add toppings and bake.

## How

Pass client JavaScript on `stdin`.  In that script, append stuff to the
`svg#vis` element present on the page.

When that script finishes running, the SVG element is extracted, the proper
doctype stuff added, and the finished SVG is printed on `stdout`.

For example:

```js
var vis = document.getElementById('vis')
var rect = vis.appendChild(document.createElement('rect'))
rect.setAttribute('width', 50)
rect.setAttribute('height', 50)
```

If you need the SVG element to be a particular size, just change select it and
change its `width` and `height` attributes it in your code.

Works brilliantly with [browserify][1] (or [webpack][2], or another bundler) to
get [D3][3] (or whatever other JS library you want to use) into the same file
for writing to stdin.

## Why

I often draw stuff to clarify [my Game Development SE answers][4].  Sometimes
it's convenient to draw with [D3][5] code.  This eases that.  Give it code and
it will give you a picture.

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

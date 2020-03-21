# svg-pizzabase [![](https://img.shields.io/npm/v/svg-pizzabase.svg?style=flat-square)][1] [![](https://img.shields.io/travis/anko/svg-pizzabase.svg?style=flat-square)][2] [![](https://img.shields.io/david/anko/svg-pizzabase.svg?style=flat-square)][3]

Script to help create SVG visualisations from JavaScript code; headlessly and
server-side.  Like a ready-made pizza-base: add toppings and bake.

    npm i -g svg-pizzabase

## How

Pass client JavaScript on `stdin`.  In that script, append stuff to the
`svg#vis` element present on the page.

When that script finishes running, the SVG element is extracted, the proper
doctype stuff added, and the finished SVG is printed on `stdout`.

For example:

<!-- !test program node ./index.js | head -c -1 -->

`vis.js`:

<!-- !test in example -->

```js
var vis = document.getElementById('vis')
var rect = vis.appendChild(document.createElement('rect'))
rect.setAttribute('width', 50)
rect.setAttribute('height', 50)
```

Run in a terminal:

    svg-pizzabase < vis.js > output.svg

<!-- !test out example -->

`output.svg`:

```svg
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg id="vis"><rect width="50" height="50"></rect></svg>
```

If you need the SVG element to be a particular size, just change select it and
change its `width` and `height` attributes it in your code.

Works brilliantly with [browserify][4] (or [webpack][5], or another bundler) to
get [D3][6] (or whatever other JS library you want to use) into the same file
for writing to stdin.

## Why

I often draw stuff to clarify [my Game Development SE answers][7].  Sometimes
it's convenient to draw with [D3][8] code.  This eases that.  Give it code and
it will give you a picture.

## Bonus tip: PNG conversion

To convert an SVG into a PNG image, I recommend [Inkscape][9]'s command line:

```sh
inkscape picture.svg --export-png=picture.png --export-area-drawing
```

I tried [ImageMagick][10]'s command line, but it tends to crop stuff all funky
and renders text badly.  YMMV.

[1]: https://www.npmjs.com/package/svg-pizzabase
[2]: https://travis-ci.org/anko/svg-pizzabase
[3]: https://david-dm.org/anko/svg-pizzabase
[4]: https://www.npmjs.com/package/browserify
[5]: https://github.com/webpack/webpack
[6]: http://d3js.org/
[7]: http://gamedev.stackexchange.com/users/7804/anko?tab=answers
[8]: http://d3js.org/
[9]: https://inkscape.org/
[10]: http://www.imagemagick.org/

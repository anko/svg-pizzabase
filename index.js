const jsdom = require('jsdom')
const concatStream = require('./concat-stream.js')

;(async () => {
  const clientScript = await concatStream(process.stdin)

  const window = new jsdom.JSDOM("<body><svg id='vis'></svg></body>",
    { runScripts: "outside-only" }
  ).window
  window.eval(clientScript)

  const svgDoctype = `<?xml version="1.0" standalone="no"?>\n` +
                     `<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"\n` +
                     `  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">`
  const svgBody = window.document.getElementsByTagName('body')[0].innerHTML
  console.log(svgDoctype)
  console.log(svgBody)

  process.exit()
})()
  .catch(e => {
    console.error(e)
    process.exit(1)
  })

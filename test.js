const spawn = require('child_process').spawn
const print = console.log
const concatStream = require('./concat-stream.js')

;(async () => {
  print("TAP version 13");
  const sub = spawn("node", [ "./index.js" ]);
  sub.stdin.end(`
    // Append a <rect> element to the vis
    var child = document.getElementById('vis').appendChild(document.createElement("rect"));
    child.setAttribute('width', 50);
    child.setAttribute('height', 50);`)

  const output = await concatStream(sub.stdout)

  const expected = '<?xml version="1.0" standalone="no"?>\n<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"\n  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n<svg id="vis"><rect width="50" height="50"></rect></svg>\n'
  if (output === expected) {
    print("ok")
  } else {
    print("not ok")
    print("  ---")
    print("  output: " + JSON.stringify(output))
    print("  expected: " + JSON.stringify(expected))
    print("  ---")
    process.exit(1)
  }
})().catch(e => { throw e })

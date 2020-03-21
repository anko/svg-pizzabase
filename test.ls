#!/usr/bin/env lsc

{ spawn } = require \child_process
require! \concat-stream

print = console.log

print "TAP version 13"

spawn "./index.js" #stdio : [ \pipe 1 2 ]
  ..stdin.end """
  // Append a <rect> element to the vis
  var child = document.getElementById('vis').appendChild(document.createElement("rect"));
  child.setAttribute('width', 50);
  child.setAttribute('height', 50);
  """
  ..stdout.pipe concat-stream (output) ->
    output .= to-string!
    expected = '<?xml version="1.0" standalone="no"?>\n<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" \n  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n<svg id="vis"><rect width="50" height="50"></rect></svg>\n'
    if output === expected
      print "ok"
    else
      print "not ok"
      print "  ---"
      print "  output: #{JSON.stringify output}"
      print "  expected: #{JSON.stringify expected}"
      print "  ---"
      process.exit 1

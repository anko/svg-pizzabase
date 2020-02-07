#!/usr/bin/env lsc

require! <[ jsdom concat-stream ]>

process.stdin.pipe concat-stream (client-script) ->
  { window } = new jsdom.JSDOM "<body><svg id='vis'></svg></body>" { run-scripts: "outside-only" }

  window.eval client-script.to-string!

  svg-doctype = """
  <?xml version="1.0" standalone="no"?>
  <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
    "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
  """

  svg-body = (window.document.get-elements-by-tag-name \body) .0 .inner-HTML

  console.log svg-doctype
  console.log svg-body
  process.exit!

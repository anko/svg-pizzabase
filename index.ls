#!/usr/bin/env lsc

require! <[ jsdom concat-stream ]>

process.stdin.pipe concat-stream (client-script) ->

  e, window <- jsdom.env "<body><svg id='vis'></svg></body>" src : [ client-script ]

  if e then console.error e ; process.exit 1

  svg-doctype = """
  <?xml version="1.0" standalone="no"?>
  <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
    "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
  """

  svg-body = (window.document.get-elements-by-tag-name \body) .0 .inner-HTML

  console.log svg-doctype
  console.log svg-body
  process.exit!

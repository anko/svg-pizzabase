module.exports = async function concatStream (readable) {
  readable.setEncoding("utf-8")
  let data = ""
  for await (const chunk of readable) {
    data += chunk
  }
  return data
}

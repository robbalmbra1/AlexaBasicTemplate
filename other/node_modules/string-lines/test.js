const assert = require('assert')
const stringLines = require('.')

const str = `This
contains
multiple
lines.`

const result = str.lines
const expect = ["This", "contains", "multiple", "lines."]

assert.deepEqual(result, expect)



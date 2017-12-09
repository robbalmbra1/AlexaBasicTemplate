string-lines
====
[![Build Status](https://travis-ci.org/TakeshiTseng/string-lines.svg?branch=master)](https://travis-ci.org/TakeshiTseng/string-lines)

Get lines from string

## Install:
```bash
$ npm install string-lines
```

## Usage:
```js
require('string-lines')

let str = `This
contains
multiple
lines`

console.log(str.lines) // ["This", "contains", "multiple", "lines"]
```

License: MIT


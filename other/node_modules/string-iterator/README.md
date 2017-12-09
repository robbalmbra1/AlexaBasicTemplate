# StringIterator

Helper tool for iterating over a string

[![Build Status](https://travis-ci.org/codenothing/StringIterator.png?branch=master)](https://travis-ci.org/codenothing/StringIterator)  


### Installation

```bash
$ npm install string-iterator
```

StringIterator may also be run in a browser environment

```html
<script type='text/javascript' src='StringIterator.js'></script>
```


### Usage

```js
var iter = new StringIterator( "abcdef" );
iter.each(function( c ) {
	console.log( c ); // each character in the string
});
```
  

API
---

### iter.index

The current index of the iteration

### iter.character

The character at the current index of the iteration

### iter.line

The line that the current index is on of the iteration

### iter.string

The original string passed into the constructor

### iter.length

The length of the original string

### iter.c

The character that the index is currently on

### iter.prev

The character previous to the current index

### iter.next

The character that comes after the current index

### iter.chars

The string broken down into an array of individual characters

### iter.lines

The string split into an array by newline characters


### .goto

Jumps index to the given position

```js
.goto( pos )
```


### .each

Iterates over the string, passing each character back to the callback

```js
.each( callback )
```


### .seek

Auto-skips over the string until it finds the end character (or regex match), and returns the result

```js
.seek( char )
.seek( regex )
```


### .skip

Skips `n` amount of characters

```js
.skip( n )
```


### .reverse

Reverse iteration `n` amount characters. Or if a function is passed in, until the callback returns false

```js
.reverse( n )
.reverse( callback )
```


### .restart

Resets iteration internals to the start

```js
.restart()
```


### License

```
The MIT License

Copyright (c) 2013 Corey Hart

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

String.prototype.__defineGetter__('lines', function () {
  return this.split('\n')
})


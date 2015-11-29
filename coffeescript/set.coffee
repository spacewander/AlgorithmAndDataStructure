merge = (a, b) ->
  i = j = 0
  res = []
  while i < a.length and j < b.length
    if a[i] < b[j]
      res.push a[i]
      i += 1
    else if a[i] == b[j]
      res.push a[i]
      res.push b[j]
      i += 1
      j += 1
    else
      res.push b[j]
      j += 1
  if i == a.length
    return res.concat(Array.prototype.slice.call(b, j))
  else
    return res.concat(Array.prototype.slice.call(a, i))

inplace_merge = (a, b) ->
  j = 0
  for i in [0...a.length]
    while a[i] >= b[j] and j < b.length
      Array.prototype.splice.call(a, i, 0, b[j])
      i += 1
      j += 1
  while j < b.length
    Array.prototype.push.call(a, b[j])
    j += 1
  return a
    
includes = (a, b) ->
  for i in [0...b.length]
    return false if Array.prototype.indexOf.call(a, b[i]) == -1
  return true

aInb = (a, b) ->
  Array.prototype.indexOf.call(b, a) != -1

union = (a, b) ->
  Array.prototype.filter.call a, (e) ->
    !aInb(e, b)
  .concat(Array.prototype.slice.call(b))

difference = (a, b) ->
  Array.prototype.filter.call a, (e) ->
    !aInb(e, b)

symmetric_difference = (a, b) ->
  Array.prototype.filter.call a, (e) ->
    !aInb(e, b)
  .concat Array.prototype.filter.call b, (e) ->
    !aInb(e, a)

intersection = (a, b) ->
  Array.prototype.filter.call a, (e) ->
    aInb(e, b)

module.exports = {
  merge,
  inplace_merge,
  includes,
  union,
  difference,
  symmetric_difference,
  intersection
}

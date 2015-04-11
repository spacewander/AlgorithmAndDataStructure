is_partitioned = (seq, func) ->
  i = 0
  len = seq.length
  while i < len
    break unless func seq[i]
    i += 1
  while i < len
    return false if func seq[i]
    i += 1
  return true
    
partition_point = (seq, func) ->
  for i in [0...seq.length]
    return i unless func seq[i]
  return seq.length

parition = (seq, func) ->
  pivot = partition_point(seq, func)
  for i in [pivot...seq.length]
    if func seq[i]
      [seq[pivot], seq[i]] = [seq[i], seq[pivot]]
      pivot += 1

parition_copy = (seq, func) ->
  res = []
  for i in [0...seq.length]
    if func seq[i]
      res.unshift seq[i]
    else
      res.push seq[i]
  res

stable_partition = (seq, func) ->
  for i in [0...seq.length]
    unless func seq[i]
      tmp = Array.prototype.splice.call seq, i, 1
      Array.prototype.push.call seq, tmp[0]

module.exports = {
  is_partitioned,
  partition_point,
  parition,
  parition_copy,
  stable_partition
}

<?php
namespace Algorithm;

function copy(array $ary, $start, $end) {
    return array_slice($ary, $start, $end - $start);
}

function copyIf(array $ary, $func) {
    $res = [];
    foreach ($ary as $e)
        if ($func($e))
            array_push($res, $e);
    return $res;
}

function copyN(array $ary, $n, $value) {
    return generateN($ary, $n, function() use ($value) {
        return $value;
    });
}

function copyBackward(array &$dest, array $src) {
    $bound = max(0, \count($dest)-\count($src));
    for ($i = \count($dest)-1, $j = \count($src)-1; $i >= $bound; $i--, $j--)
        $dest[$i] = $src[$j];
}

function fill(array $ary, $value) {
    return array_pad([], \count($ary), $value);
}

function fillN(array $ary, $n, $value) {
    if ($n < \count($ary))
        return copyN($ary, $n, $value);
    else
        return array_pad([], $n, $value);
}

function transform(array $ary, $func) {
    $res = $ary;
    foreach ($res as $k => $v)
        $res[$k] = $func($v);
    return $res;
}

function generate(array $ary, $func) {
    $res = $ary;
    foreach ($res as $k => $v)
        $res[$k] = $func();
    return $res;
}

function generateN(array $ary, $n, $func) {
    $res = $ary;
    $bound = min(\count($ary), $n);
    for ($i = 0; $i < $bound; $i++)
            $res[$i] = $func();
    return $res;
}

function remove(array &$ary, $value) {
    removeIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function removeIf(array &$ary, $func) {
    foreach ($ary as $k => $v)
        if ($func($v))
            unset($ary[$k]);
    $ary = array_values($ary);
}

function removeCopy(array &$ary, $value) {
    return removeCopyIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function removeCopyIf(array &$ary, $func) {
    $res = [];
    foreach ($ary as $k => $v)
        if ($func($v)) {
            array_push($res, $v);
            unset($ary[$k]);
        }
    $ary = array_values($ary);
    return $res;
}

function replace(array &$ary, $before, $after) {
    replaceIf($ary, function($x) use ($before) {
        return $x === $before;
    }, $after);
}

function replaceIf(array &$ary, $func, $after) {
    foreach ($ary as $k => $v)
        if ($func($v))
            $ary[$k] = $after;
}

function replaceCopy(array $ary, $before, $after) {
    return replaceCopyIf($ary, function($x) use ($before) {
        return $x === $before;
    }, $after);
}

function replaceCopyIf(array $ary, $func, $after) {
    $res = [];
    foreach ($ary as $k => $v)
        array_push($res, $func($v) ? $after : $v);
    return $res;
}

function swap(&$a, &$b) {
    $tmp = $a;
    $a = $b;
    $b = $tmp;
}

function swapRange(array &$a, array &$b, $start, $end) {
    $bound = min(\count($a), \count($b), $end);
    if ($bound <= $start) return;
    for ($i = $start; $i < $bound; $i++)
        swap($a[$i], $b[$i]);
}

function _reverse(array &$ary, $start, $end) {
    $end--;
    for ($i = $start; $i < ($end+$start) / 2; $i++)
        swap($ary[$i], $ary[$end+$start-$i]);
}

function reverse(array &$ary) {
    $length = \count($ary);
    _reverse($ary, 0, $length);
}

function reverseCopy(array $ary) {
    $res = [];
    for ($i = \count($ary) - 1; $i >= 0; $i--)
        array_push($res, $ary[$i]);
    return $res;
}

function shuffle(array &$ary) {
    for ($i = 0; $i < \count($ary); $i++) {
        $rd = rand(0, $i);
        swap($ary[$i], $ary[$rd]);
    }
}

function correctPivot($pivot, $length) {
    $pivot = $pivot % $length;
    if ($pivot < 0) $pivot += $length;
    return $pivot;
}

function rotate(array &$ary, $pivot) {
    $length = \count($ary);
    if ($length === 0) return $ary;
    $pivot = correctPivot($pivot, $length);
    _reverse($ary, 0, $pivot);
    _reverse($ary, $pivot, $length);
    _reverse($ary, 0, $length);
}

function rotateCopy(array $ary, $pivot) {
    $length = \count($ary);
    if ($length === 0) return $ary;
    $pivot = correctPivot($pivot, $length);
    return array_merge(array_slice($ary, $pivot),
                       array_slice($ary, 0, $pivot));
}

function unique(array &$ary) {
    $set = [];
    foreach ($ary as $k => $v)
        if (in_array($v, $set))
            unset($ary[$k]);
        else
            array_push($set, $v);
    $ary = $set;
}

function uniqueCopy(array $ary) {
    $res = [];
    foreach ($ary as $e)
        if (!in_array($e, $res))
            array_push($res, $e);
    return $res;
}
?>

<?php
namespace Algorithm;

function allOf(array $ary, $func) {
    foreach ($ary as $e)
        if (!$func($e))
            return false;
    return true;
}

function anyOf(array $ary, $func) {
    foreach ($ary as $e)
        if ($func($e))
            return true;
    return false;
}

function noneOf(array $ary, $func) {
    foreach ($ary as $e)
        if ($func($e))
            return false;
    return true;
}

// Both foreach and forEach are php keyword
function for_each(array &$ary, $func) {
    foreach ($ary as $k => $v)
        $ary[$k] = $func($v);
}

function count(array $ary, $value) {
    return countIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function countIf(array $ary, $func) {
    $counter = 0;
    foreach ($ary as $e)
        if ($func($e))
            $counter++;
    return $counter;
}

function mismatch(array $a, array $b) {
    foreach ($a as $k => $v)
        if ($b[$k] !== $v)
            return $k;
    return null;
}

function equal(array $a, array $b, $func) {
    foreach ($a as $k => $v)
        if (!$func($v, $b[$k]))
            return false;
    return true;
}

function find(array $ary, $value) {
    return findIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function findIf(array $ary, $func) {
    foreach ($ary as $k => $v)
        if ($func($v))
            return $k;
}

function findIfNot(array $ary, $func) {
    foreach ($ary as $k => $v)
        if (!$func($v))
            return $k;
}

function findEnd(array $outer, array $inner) {
    $outerLength = \count($outer);
    $innerLength = \count($inner);
    for ($i = $outerLength - $innerLength; $i >= 0; $i--) {
        $mismatch = false;
        for ($j = 0; !$mismatch && $j < $innerLength; $j++)
            $mismatch = ($outer[$i+$j] !== $inner[$j]);
        if (!$mismatch)
            return $i;
    }
    return null;
}

function findFirstOf(array $candidates, array $scope) {
    foreach ($candidates as $idx => $v)
        if (in_array($v, $scope))
            return $idx;
    return null;
}

function search(array $outer, array $inner) {
    $outerLength = \count($outer);
    $innerLength = \count($inner);
    for ($i = 0; $i < $outerLength - $innerLength; $i++) {
        $mismatch = false;
        for ($j = 0; !$mismatch && $j < $innerLength; $j++)
            $mismatch = ($outer[$i+$j] !== $inner[$j]);
        if (!$mismatch)
            return $i;
    }
    return null;
}

function searchN(array $outer, $n, $value) {
    return search($outer, array_pad([], $n, $value));
}
?>

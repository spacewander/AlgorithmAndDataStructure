<?php
namespace Algorithm;

function allOf($ary, $func) {
    foreach ($ary as $e)
        if (!$func($e))
            return false;
    return true;
}

function anyOf($ary, $func) {
    foreach ($ary as $e)
        if ($func($e))
            return true;
    return false;
}

function noneOf($ary, $func) {
    foreach ($ary as $e)
        if ($func($e))
            return false;
    return true;
}

// Both foreach and forEach are php keyword
function for_each(&$ary, $func) {
    foreach ($ary as $k => $v)
        $ary[$k] = $func($v);
}

function count($ary, $value) {
    return countIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function countIf($ary, $func) {
    $counter = 0;
    foreach ($ary as $e)
        if ($func($e))
            $counter++;
    return $counter;
}

function mismatch($a, $b) {
    foreach ($a as $k => $v)
        if ($b[$k] !== $v)
            return $k;
    return null;
}

function equal($a, $b, $func) {
    foreach ($a as $k => $v)
        if (!$func($v, $b[$k]))
            return false;
    return true;
}

function find($ary, $value) {
    return findIf($ary, function($x) use ($value) {
        return $x === $value;
    });
}

function findIf($ary, $func) {
    foreach ($ary as $k => $v)
        if ($func($v))
            return $k;
}

function findIfNot($ary, $func) {
    foreach ($ary as $k => $v)
        if (!$func($v))
            return $k;
}

function findEnd($outer, $inner) {
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

function findFirstOf($candidates, $scope) {
    foreach ($candidates as $idx => $v)
        if (in_array($v, $scope))
            return $idx;
    return null;
}

function search($outer, $inner) {
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

function searchN($outer, $n, $value) {
    return search($outer, array_pad([], $n, $value));
}
?>

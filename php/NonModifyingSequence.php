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
?>

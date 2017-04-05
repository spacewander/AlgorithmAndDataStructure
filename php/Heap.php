<?php
namespace Algorithm;

function isHeap($ary) {
    for ($i = 1; $i < \count($ary); $i++)
        if ($ary[$i] < $ary[\floor(($i-1)/2)]) return false;
    return true;
}

function isHeapUntil($ary) {
    for ($i = 1; $i < \count($ary); $i++)
        if ($ary[$i] < $ary[\floor(($i-1)/2)]) return $i;
    return null;
}

function makeHeap(&$ary, $func = null) {
    if (!isset($func))
        $func = function($a, $b){
            return $a < $b;
        };
    $len = \count($ary);
    for ($i = \floor($len/2) - 1; $i >= 0; $i--) {
        while (true) {
            $left = 2 * $i + 1;
            if ($left >= $len) break;
            $selected = $func($ary[$left], $ary[$i]) ? $left : $i;
            $right = $left + 1;
            if ($right < $len) {
                $selected = $func($ary[$right], $ary[$selected]) ?
                    $right : $selected;
            }
            if ($ary[$selected] === $ary[$i]) break;
            $tmp = $ary[$i];
            $ary[$i] = $ary[$selected];
            $ary[$selected] = $tmp;
            $i = $selected;
        }
    }
}

function popHeap(&$ary, $func = null) {
    $head = array_shift($ary);
    makeHeap($ary, $func);
    return $head;
}

function pushHeap(&$ary, $value, $func = null) {
    if (!isset($value)) {
        return;
    }
    $ary[] = $value;
    makeHeap($ary, $func);
}

function sortHeap(&$ary, $func = null) {
    makeHeap($ary, $func);
    $tmp = [];
    $len = \count($ary);
    for ($i = 0; $i < $len; $i++) {
        $tmp[] = popHeap($ary, $func);
    }
    $ary = array_values($tmp);
}
?>

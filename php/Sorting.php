<?php
namespace Algorithm;

function isSortedUntil(array $ary, $func = null) {
    if (!isset($func))
        $func = function($a, $b){
            return $a < $b;
        };
    for ($i = 1; $i < \count($ary); $i++)
        if (!$func($ary[$i-1], $ary[$i])) return $i;
    return null;
}

function isSorted(array $ary, $func = null) {
    return isSortedUntil($ary, $func) === null;
}

function _partition(array &$ary, $start, $end) {
    $pivot = $start;
    for (; $pivot < $end; $pivot++) {
        if (!($ary[$pivot] < $ary[$end])) {
            break;
        }
    }
    for ($i = $pivot; $i < $end; $i++) {
        if ($ary[$i] < $ary[$end]) {
            $tmp = $ary[$i];
            $ary[$i] = $ary[$pivot];
            $ary[$pivot] = $tmp;
            $pivot++;
        }
    }
    $tmp = $ary[$pivot];
    $ary[$pivot] = $ary[$end];
    $ary[$end] = $tmp;
    return $pivot;
}

function _quicksort(array &$ary, $start, $end) {
    if ($start < $end) {
        $pivot = _partition($ary, $start, $end);
        _quicksort($ary, $start, $pivot-1);
        _quicksort($ary, $pivot+1, $end);
    }
}

function sort(array &$ary) {
    _quicksort($ary, 0, \count($ary)-1);
}

function partialSort(array &$ary, $border) {
    if (\count($ary) < $border) $border = \count($ary);
    $partition = [];
    makeHeap($ary);
    for ($i = 0; $i < $border; $i++) {
        $partition[] = popHeap($ary);
    }
    for ($i = 0; $i < $border; $i++) {
        array_splice($ary, $i, 0, $partition[$i]);
    }
}

function partialSortCopy(array $ary, $border) {
    if (\count($ary) < $border) $border = \count($ary);
    $partition = [];
    makeHeap($ary);
    for ($i = 0; $i < $border; $i++) {
        $partition[] = popHeap($ary);
    }
    return $partition;
}

function stableSort(array &$ary, $func) {
    $len = \count($ary);
    for ($i = 0; $i < $len-1; $i++) {
        $min = $i;
        for ($j = $i + 1; $j < $len; $j++) {
            if ($func($ary[$j], $ary[$min])) $min = $j;
        }
        $minElement = $ary[$min];
        array_splice($ary, $min, 1);
        array_splice($ary, $i, 0, [$minElement]);
    }
}

// Note that $n starts from one.
function nthElement(array $ary, $n, $func = null) {
    $len = \count($ary);
    if ($len < $n) $n = $len;
    if (!isset($func)) {
        $func = function($a, $b) {
            return $a > $b;
        };
    }
    $heap = array_slice($ary, 0, $n);
    makeHeap($heap, $func);
    for ($i = $n; $i < $len; $i++) {
        if (!$func($ary[$i], $heap[0])) {
            popHeap($heap, $func);
            pushHeap($heap, $ary[$i], $func);
        }
    }
    return popHeap($heap, $func);
}
?>

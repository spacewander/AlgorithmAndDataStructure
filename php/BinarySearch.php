<?php
namespace Algorithm;

function lowerBound(array $ary, $value) {
    $len = \count($ary);
    $gap = $len;
    $start = 0;
    while ($gap > 0) {
        $i = $start;
        $step = \floor(gap / 2);
        $i += $step;
        if ($ary[$i] < $value) {
            $start = $i + 1;
            $gap -= $step + 1;
        } else {
            $gap = $step;
        }
    }
    if ($start >= $len) {
        return null;
    }
    return $start;
}

function upperBound(array $ary, $value) {
    $len = \count($ary);
    $gap = $len;
    $start = 0;
    while ($gap > 0) {
        $i = $start;
        $step = \floor(gap / 2);
        $i += $step;
        if ($ary[$i] <= $value) {
            $start = $i + 1;
            $gap -= $step + 1;
        } else {
            $gap = $step;
        }
    }
    if ($start >= $len) {
        return null;
    }
    return $start;
}

function binarySearch(array $ary, $value) {
    $bound = lowerBound($ary, $value);
    return $bound != null && $ary[$bound] === $value;
}

function equalRange(array $ary, $value) {
    return [lowerBound($ary, $value), upperBound($ary, $value)];
}
?>

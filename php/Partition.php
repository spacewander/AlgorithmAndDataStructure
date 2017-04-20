<?php
namespace Algorithm;

function isPartitioned(array $ary, $func) {
    $pivot = partitionPoint($ary, $func);
    if (!isset($pivot)) return true;
    for ($i = $pivot; $i < \count($ary); $i++) {
        if ($func($ary[$i])) return false;
    }
    return true;
}

function partitionPoint(array $ary, $func) {
    foreach ($ary as $i => $e) {
        if (!$func($e)) return $i;
    }
    return null;
}

function partition(array &$ary, $func) {
    $pivot = partitionPoint($ary, $func);
    if (!isset($pivot)) return;
    for ($i = $pivot; $i < \count($ary); $i++) {
        if ($func($ary[$i])) {
            $tmp = $ary[$i];
            $ary[$i] = $ary[$pivot];
            $ary[$pivot] = $tmp;
            $pivot++;
        }
    }
}

function partitionCopy(array $ary, $func) {
    $res = array_values($ary);
    $pivot = partitionPoint($res, $func);
    if (!isset($pivot)) return $res;
    for ($i = $pivot; $i < \count($res); $i++) {
        if ($func($res[$i])) {
            $tmp = $res[$i];
            $res[$i] = $res[$pivot];
            $res[$pivot] = $tmp;
            $pivot++;
        }
    }
    return $res;
}

function stablePartition(array &$ary, $func) {
    $pivot = partitionPoint($ary, $func);
    if (!isset($pivot)) return;
    $true_tail_part = [];
    $false_tail_part = [];
    for ($i = $pivot; $i < \count($ary); $i++) {
        $func($ary[$i]) ? $true_tail_part[]=$ary[$i] : $false_tail_part[]=$ary[$i];
    }
    for ($i = 0; $i < \count($true_tail_part); $i++) {
        $ary[$pivot + $i] = $true_tail_part[$i];
    }
    $false_start = $pivot + \count($true_tail_part);
    for ($i = 0; $i < \count($false_tail_part); $i++) {
        $ary[$false_start + $i] = $false_tail_part[$i];
    }
}

?>

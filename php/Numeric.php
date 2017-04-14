<?php
function itoa($init) {
    $count = $init - 1;
    return function() use (&$count) {
        $count++;
        return $count;
    };
}

function accumulate(array $ary, $init, $func) {
    foreach($ary as $e) {
        $init = $func($init, $e);
    }
    return $init;
}

function innerProduction(array $ary1, array $ary2, $init) {
    for ($i = 0; $i < count($ary1); $i++)
        $init += $ary1[$i] * $ary2[$i];
    return $init;
}

function adjacentDifference(array $ary) {
    $len = count($ary);
    if ($len <= 1) return $ary;
    $res = [$ary[0]];
    for ($i = 1; $i < $len; $i++)
        $res[] = $ary[$i] - $ary[$i-1];
    return $res;
}

function partialSum(array $ary) {
    $res = [];
    array_reduce($ary, function($init, $cur) use (&$res) {
        $init += $cur;
        $res[] = $init;
        return $init;
    }, 0);
    return $res;
}
?>

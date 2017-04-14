<?php
function _min($a, $b) {
    return $a < $b ? $a : $b;
}

function _max($a, $b) {
    return $a > $b ? $a : $b;
}

function minMax($a, $b) {
    return $a < $b ? [$a, $b] : [$b, $a];
}

function minElement(array $ary) {
    $reduceMin = function($min, $cur) {
        return (isset($min) && $min < $cur) ? $min : $cur;
    };
    return array_reduce($ary, $reduceMin);
}

function maxElement(array $ary) {
    $reduceMax = function($max, $cur) {
        return $max > $cur ? $max : $cur;
    };
    return array_reduce($ary, $reduceMax);
}

function minMaxElement(array $ary) {
    $reduceMinMax = function($minMax, $cur) {
        list($min, $max) = $minMax;
        $min = (isset($min) && $min < $cur) ? $min : $cur;
        $max = $max > $cur ? $max : $cur;
        return [$min, $max];
    };
    return array_reduce($ary, $reduceMinMax);
}

function lexicographicalCompare($s1, $s2) {
    $len1 = strlen($s1);
    $len2 = strlen($s2);
    $bound = min($len1, $len2);
    for ($i = 0; $i < $bound; $i++) {
        if ($s1[$i] !== $s2[$i]) {
            return $s1[$i] < $s2[$i];
        }
    }
    return $len1 < $len2;
}

function isPermutation(array $ary1, array $ary2) {
    $len1 = count($ary1);
    $len2 = count($ary2);
    if ($len1 != $len2) return false;
    $elems = array();
    foreach($ary1 as $e)
        $elems[$e] = isset($elems[$e]) ? ($elems[$e] + 1) : 1;
    foreach($ary2 as $e) {
        if (empty($elems[$e]))
            return false;
        $elems[$e]--;
    }
    return true;
}

function nextPermutation(array &$ary) {
    $len = count($ary) - 1;
    if ($len <= 0) return false;
    $i = $len;
    while (true) {
        $pos1 = $i;
        $i--;
        if ($ary[$i] < $ary[$pos1]) {
            $pos2 = $len;
            while ($ary[$i] >= $ary[$pos2]) {
                $pos2--;
            }
            $tmp = $ary[$i];
            $ary[$i] = $ary[$pos2];
            $ary[$pos2] = $tmp;
            $pivot = floor(($len+1-$pos1) / 2);
            for ($j = 0; $j < $pivot; $j++) {
                $tmp = $ary[$pos1+$j];
                $ary[$pos1+$j] = $ary[$len-$j];
                $ary[$len-$j] = $tmp;
            }
            return true;
        }
        if ($i === 0) {
            $ary = array_reverse($ary);
            return false;
        }
    }
}

function prevPermutation(array &$ary) {
    $len = count($ary) - 1;
    if ($len <= 0) return false;
    $i = $len;
    while (true) {
        $pos1 = $i;
        $i--;
        if ($ary[$pos1] < $ary[$i]) {
            $pos2 = $len;
            while ($ary[$pos2] >= $ary[$i]) {
                $pos2--;
            }
            $tmp = $ary[$i];
            $ary[$i] = $ary[$pos2];
            $ary[$pos2] = $tmp;
            $pivot = floor(($len+1-$pos1) / 2);
            for ($j = 0; $j < $pivot; $j++) {
                $tmp = $ary[$pos1+$j];
                $ary[$pos1+$j] = $ary[$len-$j];
                $ary[$len-$j] = $tmp;
            }
            return true;
        }
        if ($i === 0) {
            $ary = array_reverse($ary);
            return false;
        }
    }
}
?>

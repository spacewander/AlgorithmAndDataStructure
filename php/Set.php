<?php
namespace Algorithm;

function merge(array $a, array $b) {
    $res = [];
    $len_a = \count($a);
    $len_b = \count($b);
    $i = $j = 0;
    while ($i < $len_a && $j < $len_b) {
        $x = $a[$i];
        $y = $b[$j];
        if ($x < $y) {
            $res[] = $x;
            $i++;
        } elseif ($x > $y) {
            $res[] = $y;
            $j++;
        } else {
            $res[] = $x;
            $res[] = $y;
            $i++;
            $j++;
        }
    }
    for (; $i < $len_a; $i++)
        $res[] = $a[$i];
    for (; $j < $len_b; $j++)
        $res[] = $b[$j];
    return $res;
}

function inplaceMerge(array &$a, array $b) {
    $a = array_values(merge($a, $b));
}

function includes(array $ary, array $scope) {
    $end = \count($scope);
    if ($end == 0)
        return true;
    $j = 0;
    for ($i = 0; $i < \count($ary); $i++) {
        if ($ary[$i] == $scope[$j]) {
            $j++;
            if ($j == $end)
                return true;
        }
    }
    return false;
}

function union(array $a, array $b) {
    $res = [];
    $len_a = \count($a);
    $len_b = \count($b);
    $i = $j = 0;
    while ($i < $len_a && $j < $len_b) {
        $x = $a[$i];
        $y = $b[$j];
        if ($x < $y) {
            $res[] = $x;
            $i++;
        } elseif ($x > $y) {
            $res[] = $y;
            $j++;
        } else {
            $res[] = $x;
            $i++;
            $j++;
        }
    }
    for (; $i < $len_a; $i++)
        $res[] = $a[$i];
    for (; $j < $len_b; $j++)
        $res[] = $b[$j];
    return $res;
}

function difference(array $a, array $b) {
    $res = [];
    $len_a = \count($a);
    $len_b = \count($b);
    $i = $j = 0;
    while ($i < $len_a && $j < $len_b) {
        $x = $a[$i];
        $y = $b[$j];
        if ($x < $y) {
            $res[] = $x;
            $i++;
        } elseif ($x > $y) {
            $j++;
        } else {
            $i++;
            $j++;
        }
    }
    for (; $i < $len_a; $i++)
        $res[] = $a[$i];
    return $res;
}

function symmetricDifference(array $a, array $b) {
    $res = [];
    $len_a = \count($a);
    $len_b = \count($b);
    $i = $j = 0;
    while ($i < $len_a && $j < $len_b) {
        $x = $a[$i];
        $y = $b[$j];
        if ($x < $y) {
            $res[] = $x;
            $i++;
        } elseif ($x > $y) {
            $res[] = $y;
            $j++;
        } else {
            $i++;
            $j++;
        }
    }
    for (; $i < $len_a; $i++)
        $res[] = $a[$i];
    for (; $j < $len_b; $j++)
        $res[] = $b[$j];
    return $res;
}

function intersection(array $a, array $b) {
    $res = [];
    $len_a = \count($a);
    $len_b = \count($b);
    $i = $j = 0;
    while ($i < $len_a && $j < $len_b) {
        $x = $a[$i];
        $y = $b[$j];
        if ($x == $y) {
            $res[] = $x;
            $i++;
            $j++;
        } elseif ($x > $y) {
            $j++;
        } else {
            $i++;
        }
    }
    return $res;
}
?>

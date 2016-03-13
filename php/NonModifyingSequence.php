<?php
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
?>

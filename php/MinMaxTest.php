<?php
namespace Algorithm;

class MinMaxTest extends \PHPUnit_Framework_TestCase
{
        //$this->ary = [3, 6, 12, 5, 19, 2];
    public function testMin()
    {
        $this->assertEquals(11, _min(12, 11));
    }

    public function testMax()
    {
        $this->assertEquals(11, _max(5, 11));
    }

    public function testMinMax()
    {
        list($min, $max) = minMax(12, 11);
        $this->assertEquals(11, $min);
        $this->assertEquals(12, $max);
    }

    public function testMinElement()
    {
        $this->assertEquals(1, minElement([1, 11, 2, 3]));
    }

    public function testMaxElement()
    {
        $this->assertEquals(11, maxElement([1, 11, 2, 3]));
    }

    public function testMinMaxElement()
    {
        list($min, $max) = minMaxElement([2, 5, 7, 3, 17, 11, 13]);
        $this->assertEquals(2, $min);
        $this->assertEquals(17, $max);
    }

    public function testLexicographicalCompare()
    {
        $a = 'xy';
        $b = 'xyz';
        $c = 'xz';
        $this->assertTrue(lexicographicalCompare($a, $b));
        $this->assertTrue(lexicographicalCompare($a, $c));
        $this->assertTrue(lexicographicalCompare($b, $c));
        $this->assertFalse(lexicographicalCompare($c, $b));

        // Return true if $1 is less than $2
        $this->assertFalse(lexicographicalCompare($a, $a));
        $this->assertFalse(lexicographicalCompare($a, ""));
        $this->assertFalse(lexicographicalCompare("", ""));
    }

    public function testIsPermutation()
    {
        $ary = [1, 3, 3, 5];
        $this->assertTrue(isPermutation($ary, [3, 3, 1, 5]));
        $this->assertTrue(isPermutation($ary, [3, 1, 3, 5]));
        $this->assertFalse(isPermutation($ary, [1, 3, 5]));
        $this->assertFalse(isPermutation($ary, [1, 3, 5, 1]));
    }

    public function testNextPermutation()
    {
        $ary = [17, 11, 7, 3];
        nextPermutation($ary);
        $this->assertEquals([3, 7, 11, 17], $ary);

        $count = 0;
        while (nextPermutation($ary)){
            $count++;
        }
        $this->assertEquals(23, $count);
        $this->assertEquals([3, 7, 11, 17], $ary);
    }

    public function testPrevPermutation()
    {
        $ary = [3, 7, 11, 17];
        nextPermutation($ary);
        prevPermutation($ary);
        $this->assertEquals([3, 7, 11, 17], $ary);

        $count = 0;
        prevPermutation($ary);
        while (prevPermutation($ary))
            $count++;
        $this->assertEquals(23, $count);
        $this->assertEquals([17, 11, 7, 3], $ary);
    }
}
?>

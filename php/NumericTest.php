<?php
namespace Algorithm;

class NumericTest extends \PHPUnit_Framework_TestCase
{
    private $ary;
    public function setUp() {
        $this->ary = [2, 5, 7];
    }

    public function testItoa()
    {
        $g = itoa(4);
        $this->assertEquals(4, $g());
        $this->assertEquals(5, $g());
    }

    public function testAccumulate()
    {
        $this->assertEquals(1, accumulate([], 1, function($a, $b) {
            return $a * $b;
        }));
        $this->assertEquals(70, accumulate($this->ary, 1, function($a, $b) {
            return $a * $b;
        }));
        $this->assertEquals(140, accumulate($this->ary, 2, function($a, $b) {
            return $a * $b;
        }));
    }

    public function testInnerProduction()
    {
        $this->assertEquals(1, innerProduction([], [], 1));
        // require count(ary1) <= count(ary2)
        $this->assertEquals(32, innerProduction($this->ary, [1, 2, 3, 4], -1));
        $this->assertEquals(79, innerProduction($this->ary, $this->ary, 1));
    }

    public function testAdjacentDifference()
    {
        $this->assertEquals([], adjacentDifference([]));
        $this->assertEquals([4], adjacentDifference([4]));
        $this->assertEquals([2, 3, 2], adjacentDifference($this->ary));
    }

    public function testPartialSum()
    {
        $this->assertEquals([], partialSum([]));
        $this->assertEquals([2, 7, 14], partialSum($this->ary));
    }
}
?>

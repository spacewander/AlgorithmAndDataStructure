<?php
namespace Algorithm;

class BinarySearchTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    public function setUp() {
        // Required a sorted array
        $this->ary = [2, 3, 5, 8, 13];
    }

    public function testLowerBound()
    {
        // Return Null if the upper bound is out of range
        $this->assertNull(lowerBound($this->ary, 14));
        $this->assertEquals(4, lowerBound($this->ary, 13));
        $this->assertEquals(3, lowerBound($this->ary, 7));
        $this->assertEquals(1, lowerBound($this->ary, 3));
        $this->assertEquals(0, lowerBound($this->ary, 2));
        $this->assertEquals(0, lowerBound($this->ary, 1));
    }

    public function testUpperBound()
    {
        $this->assertNull(upperBound($this->ary, 13));
        $this->assertEquals(2, upperBound($this->ary, 3));
        $this->assertEquals(1, upperBound($this->ary, 2.7));
        $this->assertEquals(0, upperBound($this->ary, 1));
    }

    public function testBinarySearch()
    {
        $this->assertFalse(binarySearch($this->ary, 16));
        $this->assertTrue(binarySearch($this->ary, 13));
        $this->assertTrue(binarySearch($this->ary, 8));
        $this->assertFalse(binarySearch($this->ary, 6));
        $this->assertFalse(binarySearch($this->ary, 1));
    }

    public function testEqualRange()
    {
        $this->assertEquals(equalRange($this->ary, 2), [0, 1]);
        $this->assertEquals(equalRange($this->ary, 4), [2, 2]);
        $this->assertEquals(equalRange($this->ary, 5), [2, 3]);
        $this->assertEquals(equalRange($this->ary, 13), [4, null]);
    }
}
?>

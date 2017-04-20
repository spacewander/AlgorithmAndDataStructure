<?php
namespace Algorithm;

function less_than($upper_bound) {
    return function($num) use ($upper_bound) {
        return $num < $upper_bound;
    };
}

class PartitionTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    public function setUp() {
        $this->ary = [3, 4, 9, 7, 4];
    }

    public function testIsPartitioned()
    {
        $this->assertFalse(isPartitioned($this->ary, less_than(9)));
        $this->assertTrue(isPartitioned([1, 8, 7], less_than(9)));
        $this->assertTrue(isPartitioned([], less_than(9)));
    }

    public function testPartitionPoint()
    {
        // Return the index of first element could not satisfy the partition
        $this->assertEquals(2, partitionPoint($this->ary, less_than(9)));
        $this->assertEquals(1, partitionPoint($this->ary, less_than(4)));
        $this->assertEquals(0, partitionPoint($this->ary, less_than(0)));
        // Return null if all elements satisfy the partition
        $this->assertNull(partitionPoint([1, 8, 7], less_than(9)));
        $this->assertNull(partitionPoint([], less_than(9)));
    }

    public function testPartition()
    {
        partition($this->ary, less_than(9));
        $this->assertEquals(9, $this->ary[4]);

        partition($this->ary, less_than(5));
        for ($i = 0; $i < 3; $i++) {
            $this->assertTrue($this->ary[$i] < 5);
        }
        for ($i = 3; $i < \count($this->ary); $i++) {
            $this->assertFalse($this->ary[$i] < 5);
        }

        partition($this->ary, less_than(0));
        partition($this->ary, less_than(10));
    }

    public function testPartitionCopy()
    {
        $copy = partitionCopy($this->ary, less_than(9));
        $this->assertEquals(9, $copy[4]);

        $copy = partitionCopy($this->ary, less_than(8));
        for ($i = 0; $i < 4; $i++) {
            $this->assertTrue($copy[$i] < 8);
        }
        for ($i = 4; $i < \count($copy); $i++) {
            $this->assertFalse($copy[$i] < 8);
        }
    }

    public function testStablePartition()
    {
        stablePartition($this->ary, less_than(9));
        $this->assertEquals([3, 4, 7, 4, 9], $this->ary);

        $seq = [1, 2, 3, 1, 2, 5, 4];
        stablePartition($seq, less_than(3));
        $this->assertEquals([1, 2, 1, 2, 3, 5, 4], $seq);
    }
}
?>

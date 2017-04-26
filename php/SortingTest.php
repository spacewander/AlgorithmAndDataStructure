<?php
namespace Algorithm;

class SortingTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    public function setUp() {
        $this->ary = [4, 7, 8, 1, 2];
    }

    public function testIsSortedUntil()
    {
        $this->assertEquals(3, isSortedUntil($this->ary));
        $this->assertEquals(1, isSortedUntil($this->ary, function($a, $b) {
            return $a >= $b;
        }));
        $this->assertNull(isSortedUntil([1, 5, 9]));
    }

    public function testIsSorted()
    {
        $this->assertFalse(isSorted($this->ary));
        $this->assertTrue(isSorted([1, 5, 9]));
        $this->assertTrue(isSorted([]));
    }

    public function testSort()
    {
        $empty = [];
        sort($empty);
        $this->assertEquals([], $empty);
        $single = [1];
        sort($single);
        $this->assertEquals([1], $single);

        sort($this->ary);
        $this->assertEquals([1, 2, 4, 7, 8], $this->ary);

        $ary1 = [16, 24, 22, 12];
        sort($ary1);
        $this->assertEquals([12, 16, 22, 24], $ary1);

        $ary2 = [12, 17, 22];
        sort($ary2);
        $this->assertEquals([12, 17, 22], $ary2);
    }

    public function testPartialSort()
    {
        $empty = [];
        partialSort($empty, 1);
        $this->assertEquals([], $empty);

        partialSort($this->ary, 3);
        $this->assertEquals([1, 2, 4], array_slice($this->ary, 0, 3));
        partialSort($this->ary, 4);
        $this->assertEquals([1, 2, 4, 7], array_slice($this->ary, 0, 4));
    }

    public function testPartialSortCopy()
    {
        $this->assertEquals([], partialSortCopy([], 1));

        $this->assertEquals([1, 2], partialSortCopy($this->ary, 2));
        $this->assertEquals([1, 2, 4], partialSortCopy($this->ary, 3));
        $this->assertEquals([1, 2, 4, 7], partialSortCopy($this->ary, 4));
    }

    public function testStableSort()
    {
        $tupleAry = [
            [2, 3],
            [3, 4],
            [3, 2],
            [2, 1],
            [3, 5],
            [2, 4],
            [3, 1],
        ];
        stableSort($tupleAry, function($a, $b) {
            return $a[0] < $b[0];
        });
        $this->assertEquals([
            [2, 3],
            [2, 1],
            [2, 4],
            [3, 4],
            [3, 2],
            [3, 5],
            [3, 1],
        ], $tupleAry);
    }

    public function testNthElement()
    {
        $this->assertEquals(1, nthElement($this->ary, 1));
        $this->assertEquals(2, nthElement($this->ary, 2));
        $this->assertEquals(4, nthElement($this->ary, 3));
        $this->assertEquals(7, nthElement($this->ary, 4));
        $this->assertEquals(8, nthElement($this->ary, 5));
    }
}
?>

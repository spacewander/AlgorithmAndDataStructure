<?php
namespace Algorithm;

class HeapTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    public function setUp() {
        $this->ary = [2, 3, 13, 8, 5, 7];
        $this->empty = [];
        $this->single = [1];
    }

    public function testIsHeap()
    {
        $this->assertTrue(isHeap([]));
        $this->assertTrue(isHeap([1]));
        $this->assertTrue(isHeap([2, 3, 13, 8, 5]));
        $this->assertFalse(isHeap($this->ary));
    }

    public function testIsHeapUntil()
    {
        $this->assertNull(isHeapUntil([]));
        $this->assertNull(isHeapUntil([1]));
        $this->assertNull(isHeapUntil([1, 2]));
        $this->assertNull(isHeapUntil([1, 2, 1]));
        $this->assertEquals(2, isHeapUntil([1, 2, 0]));
        $this->assertEquals(5, isHeapUntil($this->ary));
    }

    public function testMakeHeap()
    {
        makeHeap($this->empty);
        makeHeap($this->single);

        $this->assertFalse(isHeap($this->ary));
        makeHeap($this->ary);
        $this->assertTrue(isHeap($this->ary));

        $heap = [1, 2];
        makeHeap($heap);
        $this->assertEquals([1, 2], $heap);
        $heap = [2, 1];
        makeHeap($heap);
        $this->assertEquals([1, 2], $heap);
    }

    public function testPopHeap()
    {
        makeHeap($this->ary);
        $this->assertEquals(2, popHeap($this->ary));
        $this->assertTrue(isHeap($this->ary));
        $this->assertEquals(3, popHeap($this->ary));
        $this->assertTrue(isHeap($this->ary));

        $this->assertNull(popHeap($this->empty));
        $heap = [1, 2];
        $this->assertEquals(1, popHeap($heap));
    }

    public function testPushHeap()
    {
        makeHeap($this->ary);
        $this->assertNotContains(4, $this->ary);
        pushHeap($this->ary, 4);
        $this->assertContains(4, $this->ary);
        $this->assertTrue(isHeap($this->ary));

        $len = \count($this->ary);
        // Push null means doing nothing
        pushHeap($this->ary, null);
        $this->assertEquals($len, \count($this->ary));
    }

    public function testSortHeap()
    {
        sortHeap($this->ary);
        $this->assertEquals([2, 3, 5, 7, 8, 13], $this->ary);
        sortHeap($this->ary, function($a, $b){
            return $a > $b;
        });
        $this->assertEquals([13, 8, 7, 5, 3, 2], $this->ary);

        sortHeap($this->empty);
        sortHeap($this->single);
    }
}

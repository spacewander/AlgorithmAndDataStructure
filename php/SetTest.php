<?php
namespace Algorithm;

class SetTest extends \PHPUnit_Framework_TestCase
{
    private $ary1;
    private $ary2;

    public function setUp() {
        // Require two sorted ranges
        $this->ary1 = [1, 3, 4, 6];
        $this->ary2 = [1, 3, 5, 7];
    }

    public function testMerge()
    {
        $this->assertEquals([1, 1, 3, 3, 4, 5, 6, 7], merge($this->ary1, $this->ary2));
        $this->assertEquals($this->ary1, merge([], $this->ary1));
        $this->assertEquals([], merge([], []));
    }

    public function testInplaceMerge()
    {
        inplaceMerge($this->ary1, $this->ary2);
        $this->assertEquals([1, 1, 3, 3, 4, 5, 6, 7], $this->ary1);
    }

    public function testIncludes()
    {
        // The included scope should be sorted.
        $this->assertTrue(includes($this->ary1, []));
        $this->assertTrue(includes($this->ary1, [1, 4]));
        $this->assertFalse(includes($this->ary1, [1, 2, 3]));
        $this->assertFalse(includes($this->ary1, [1, 4, 5]));
    }

    public function testUnion()
    {
        $this->assertEquals([1, 3, 4, 5, 6, 7], union($this->ary1, $this->ary2));
    }

    public function testDifference()
    {
        $this->assertEquals([4, 6], difference($this->ary1, $this->ary2));
        $this->assertEquals([5, 7], difference($this->ary2, $this->ary1));
        $this->assertEquals([3], difference([1, 3, 4], [1, 4]));
        $this->assertEquals([], difference($this->ary2, $this->ary2));
    }

    public function testSymmetricDiffernce()
    {
        // The returned value should be also sorted.
        $this->assertEquals([4, 5, 6, 7], symmetricDifference($this->ary1, $this->ary2));
        $this->assertEquals([4, 5, 6, 7], symmetricDifference($this->ary2, $this->ary1));
        $this->assertEquals([], symmetricDifference($this->ary2, $this->ary2));
        $this->assertEquals($this->ary2, symmetricDifference($this->ary2, []));
    }

    public function testIntersection()
    {
        $this->assertEquals([], intersection([], []));
        $this->assertEquals([1, 3, 4, 6], intersection($this->ary1, $this->ary1));
        $this->assertEquals([1, 3], intersection($this->ary1, $this->ary2));
    }
}
?>

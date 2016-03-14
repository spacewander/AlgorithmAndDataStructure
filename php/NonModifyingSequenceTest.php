<?php
namespace Algorithm;

class NonModifyingSequenceTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    /*
     * @before
     */
    public function setUp() {
        $this->ary = [1, 2, 3, 4, 6];
    }

    public function testAllOf()
    {
        $this->assertTrue(allOf($this->ary, function($x) {
            return $x > 0;
        }));
        $this->assertFalse(allOf($this->ary, function($x) {
            return $x < 3;
        }));
    }

    public function testAnyOf() {
        $this->assertTrue(anyOf($this->ary, function($x) {
            return $x < 2;
        }));
        $this->assertFalse(anyOf($this->ary, function($x) {
            return $x < 1;
        }));
    }

    public function testNoneOf()
    {
        $this->assertTrue(noneOf($this->ary, function($x) {
            return $x < 1;
        }));
        $this->assertFalse(noneOf($this->ary, function($x) {
            return $x < 6;
        }));
    }

    public function testForEach()
    {
        $func = function($x) {
            return $x + 1;
        };
        $newAry = array_map($func, $this->ary);
        for_each($this->ary, $func);
        $this->assertEquals($newAry, $this->ary);
    }

    public function testCount()
    {
        $this->assertEquals(1, count($this->ary, 2));
        $this->assertEquals(0, count($this->ary, 5));
    }

    public function testCountIf()
    {
        $this->assertEquals(1, countIf($this->ary, function($x) {
            return $x === 2;
        }));
    }

    public function testMismatch()
    {
        $ary = range(1, 5);
        $mismatchIdx = mismatch($this->ary, $ary);
        $this->assertEquals(4, $mismatchIdx);
        $newAry = $ary;
        $this->assertNull(mismatch($ary, $newAry));
    }

    public function testEqual()
    {
        $func = function($x) {
            return $x + 1;
        };
        $newAry = array_map($func, $this->ary);
        $cp = function($x, $y) {
            return $x === $y + 1;
        };
        $this->assertFalse(equal($this->ary, $newAry, $cp));
        $this->assertTrue(equal($newAry, $this->ary, $cp));
    }

    public function testFind()
    {
        $idx = find($this->ary, 3);
        $this->assertEquals(2, $idx);
    }

    public function testFindIf()
    {
        $this->assertEquals(2, findIf($this->ary, function($x) {
            return $x > 2;
        }));
        $this->assertNull(findIf($this->ary, function($x) {
            return $x > 6;
        }));
    }

    public function testFindIfNot()
    {
        $this->assertEquals(2, findIfNot($this->ary, function($x) {
            return $x < 3;
        }));
    }

    public function testFindEnd()
    {
        $ary = [1, 2, 1, 2, 3];
        $ary2 = [1, 2];
        $ary3 = [1, 2, 3];
        $ary4 = [1, 2, 3, 4];
        $idxOfAry2LastOccursInAry = findEnd($ary, $ary2);
        $this->assertEquals(2, $idxOfAry2LastOccursInAry);
        $this->assertEquals(2, findEnd($ary, $ary3));
        $this->assertNull(findEnd($ary, $ary4));
    }

    public function testFindFirstOf()
    {
        $ary2 = [10, 8, 2];
        $idxOfFirstAryElementInAry2 = findFirstOf($this->ary, $ary2);
        $this->assertEquals(1, $idxOfFirstAryElementInAry2);
        $ary3 = [10, 8];
        $this->assertNull(findFirstOf($this->ary, $ary3));
    }

    public function testSearch()
    {
        $ary2 = [2, 3, 4];
        $idxOfAry2InAry = search($this->ary, $ary2);
        $this->assertEquals(1, $idxOfAry2InAry);
        $aryNotConsistent = [2, 2, 4];
        $this->assertNull(search($this->ary, $aryNotConsistent));

        $this->assertEquals(0, search($this->ary, $this->ary));
        $aryTooLarge = range(1, 6);
        $this->assertNull(search($this->ary, $aryTooLarge));
    }

    public function testSearchN()
    {
        $ary = [1, 2, 2, 3];
        $this->assertNull(searchN($ary, 3, 2));
        $this->assertEquals(1, searchN($ary, 2, 2));
    }
}
?>

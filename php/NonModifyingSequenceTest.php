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
}
?>

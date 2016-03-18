<?php
namespace Algorithm;

class ModifyingSequenceTest extends \PHPUnit_Framework_TestCase
{
    private $ary;

    /*
     * @before
     */
    public function setUp() {
        $this->ary = [1, 2, 3, 4, 6];
    }

    public function testCopy()
    {
        $this->assertEquals([1, 2, 3], copy($this->ary, 0, 3));
    }

    public function testCopyIf()
    {
        $this->assertEquals([1, 3], copyIf($this->ary, function($x) {
            return $x % 2 === 1;
        }));
    }

    public function testCopyN()
    {
        $ary = [0, 0, 0, 1];
        $this->assertEquals([3, 3, 3, 1], copyN($ary, 3, 3));
        $ary2 = [0, 0];
        $this->assertEquals([3, 3], copyN($ary2, 3, 3));
    }

    public function testCopyBackward()
    {
        $ary = [2, 2, 2];
        copyBackward($ary, $this->ary);
        $this->assertEquals([3, 4, 6], $ary);
        $ary = array_pad([], 6, 1);
        copyBackward($ary, $this->ary);
        $this->assertEquals([1, 1, 2, 3, 4, 6], $ary);
    }

    public function testFill()
    {
        $this->assertEquals([], fill([], 3));
        $this->assertEquals([3, 3], fill([1, 1], 3));
    }

    public function testFillN()
    {
        $this->assertEquals([3, 3, 3], fillN([], 3, 3));
        $this->assertEquals([3, 3, 3], fillN([2, 2], 3, 3));
        $this->assertEquals([3, 3, 2], fillN([2, 2, 2], 2, 3));
    }

    public function testTransform()
    {
        $func = function($x) {
            return $x + 1;
        };
        $this->assertEquals(array_map($func, $this->ary),
            transform($this->ary, $func));
    }

    public function testGenerate()
    {
        $func = function() {
            return 2;
        };
        $this->assertEquals([2, 2, 2], generate([1, 1, 1], $func));
    }

    public function testGenerateN()
    {
        $func = function() {
            return 1;
        };
        $this->assertEquals([1, 1], generateN([0, 0], 2, $func));
        $this->assertEquals([1, 1], generateN([0, 0], 3, $func));
    }

    public function testRemove()
    {
        $ary = [1, 2, 3];
        remove($ary, 3);
        $this->assertEquals([1, 2], $ary);
    }

    public function testRemoveIf()
    {
        $ary = [1, 2, 3];
        removeIf($ary, function($e) {
            return $e < 2;
        });
        $this->assertEquals([2, 3], $ary);
    }

    public function testRemoveCopy()
    {
        $ary = [1, 2, 3];
        $this->assertEquals([3], removeCopy($ary, 3));
        $this->assertEquals([1, 2], $ary);
    }

    public function testRemoveCopyIf()
    {
        $ary = [1, 2, 3];
        $this->assertEquals([1], removeCopyIf($ary, function($e) {
            return $e < 2;
        }));
        $this->assertEquals([2, 3], $ary);
    }

    public function testReplace()
    {
        $ary = [1, 3, 3];
        replace($ary, 3, 2);
        $this->assertEquals([1, 2, 2], $ary);
    }

    public function testReplaceIf()
    {
        $ary = [1, 2, 3, 3];
        replaceIf($ary, function($e) {
            return $e >= 2;
        }, 1);
        $this->assertEquals([1, 1, 1, 1], $ary);
    }

    public function testReplaceCopy()
    {
        $ary = [1, 3, 3];
        $this->assertEquals([1, 2, 2], replaceCopy($ary, 3, 2));
    }

    public function testReplaceCopyIf()
    {
        $ary = [1, 2, 3, 3];
        $this->assertEquals([1, 1, 1, 1], replaceCopyIf($ary, function($e) {
            return $e >= 2;
        }, 1));
    }

    public function testSwap()
    {
        $a = 1;
        $b = 2;
        swap($a, $b);
        $this->assertEquals(2, $a);
        $this->assertEquals(1, $b);
    }

    public function testSwapRange()
    {
        $a = [1, 2, 3, 4];
        $b = [4, 3, 2, 1];
        swapRange($a, $b, 1, 3);
        $this->assertEquals([1, 3, 2, 4], $a);
        $this->assertEquals([4, 2, 3, 1], $b);

        // out of range
        $a = [1, 1, 1];
        $b = [2];
        swapRange($a, $b, 1, 3);
        $this->assertEquals([1, 1, 1], $a);
        $this->assertEquals([2], $b);

        // some part out of range
        $c = [2, 2];
        swapRange($a, $c, 1, 3);
        $this->assertEquals([1, 2, 1], $a);
        $this->assertEquals([2, 1], $c);
    }

    public function testReverse()
    {
        $ary = [1, 2, 3];
        reverse($ary);
        $this->assertEquals([3, 2, 1], $ary);
        $ary2 = [1, 2, 3, 4];
        reverse($ary2);
        $this->assertEquals([4, 3, 2, 1], $ary2);
    }

    public function testReverseCopy()
    {
        $ary = [1, 2, 3];
        $this->assertEquals([3, 2, 1], reverseCopy($ary));
    }

    public function testShuffle()
    {
        shuffle($this->ary);
    }

    public function testRotate()
    {
        $ary = [1, 2, 3, 4];
        rotate($ary, 2);
        $this->assertEquals([3, 4, 1, 2], $ary);

        rotate($ary, 5);
        $this->assertEquals([4, 1, 2, 3], $ary);

        rotate($ary, -1);
        $this->assertEquals([3, 4, 1, 2], $ary);
    }

    public function testRotateCopy()
    {
        $this->assertEquals([], rotateCopy([], 3));
        $this->assertEquals([3, 4, 6, 1, 2], rotateCopy($this->ary, 2));
        $this->assertEquals([3, 4, 6, 1, 2], rotateCopy([1, 2, 3, 4, 6], -3));
        $this->assertEquals([3, 4, 6, 1, 2], rotateCopy([1, 2, 3, 4, 6], 7));
    }

    public function testUnique()
    {
        $dup = [1, 1, 2, 2, 3];
        unique($dup);
        $this->assertEquals([1, 2, 3], $dup);
    }

    public function testUniqueCopy()
    {
        $dup = [1, 1, 2, 2, 3];
        $this->assertEquals([1, 2, 3], uniqueCopy($dup));
    }
}
?>

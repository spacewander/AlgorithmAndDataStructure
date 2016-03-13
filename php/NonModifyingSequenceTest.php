<?php
class NonModifyingSequenceTest extends PHPUnit_Framework_TestCase
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
}
?>

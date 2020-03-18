namespace TestingExample\BasicAppTest;

// autoloader for loading in other functions and the other functions for testing
require_once(__DIR__.'/../vendor/autoload.hack');
use function TestingExample\BasicApp\multiply_two_numbers;

// these imports are required 
use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;

// this class name must match the file name and extend HackTest
final class BasicAppTest extends HackTest {
    <<__Override>>
    public static async function beforeFirstTestAsync(): Awaitable<void> {
        \Facebook\AutoloadMap\initialize();
    }

    public function testMultiplySmallNumbers() : void {
        $num_one = 5;
        $num_two = 4;
        $product = multiply_two_numbers($num_one, $num_two);
        expect($product)->toBeSame(20);
    }
}

import std.stdio;
import std.conv;
import std.string: isNumeric;
import std.algorithm.comparison: equal;

void main() {

    bool quit = false;

    string accumulator = "";

    outer: while (!quit) {

        write("Input your bits: ");

        ubyte query = 0;

        try {

            string input = readln();

            if (equal(input, "quit\n")) {
                break outer;
            }

            char[] blah = input.dup;

            // Wow we're really turning up the optimizations here

            foreach (number; 1..9) {

                inner: foreach (letter; blah) {

                    string sample = to!string(letter);

                    if (isNumeric(sample)) {

                        if (to!int(sample) == number) {

                            // Simple register shifting

                            ubyte shift = cast(ubyte)(8 - number);

                            query |= 1 << shift;

                            break inner;
                        }

                    }    

                }
            }
            

        } catch (Exception e) {
            writeln("You done goofed, try again");
        }
        
        accumulator ~= cast(char)query;

        writeln("\nCurrent sentence: ", accumulator, "\n");
    }

    writeln("See ya!");
}

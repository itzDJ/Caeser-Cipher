// decrypting based on Caesar's cipher and an unknown shift

#include <stdio.h>

// implicit declaration of the function, so it can be accessed in main() 
// this is not needed if the function is fully declared before main()
void shiftMessage(int shift, char message[256]);

int main()
{
    char message[256];
    printf("Enter the Caesar Cipher encoded text: ");
    // fgets is a method of getting a string
    // fgets(string, size of string, stdin)  // stdin for standard input
    fgets(message, 256, stdin);
    printf("\n");
    
    for (int shift = 1; shift != 26; ++shift) {
        shiftMessage(shift, message);
    }

    printf("\n");

    return 0;
}

void shiftMessage(int shift, char message[256]) {
    char letter;

    for (int i = 0; message[i] != '\0'; ++i) {
        // for loop runs until the character in the message is the null 
        letter = message[i];

        if (letter >= 'a' && letter <= 'z') {
            // letter = letter - 1 to shift the letter back one from where it previous was
            // ex: by the time the shift is 5, letter has already been shifted 4 times from the loop
            // so it only needs to be shifted one more time
            letter -= 1;

            if (letter < 'a') {
                /*
                    if the value of letter is less than the value of 'a'
                    after the shift is subtracted from it, 
                    add 26 (the amount of letters in the alphabet) to letter
                    so we're not printing symbols

                    ex:
                        'a' - 1 is a symbol when we need it to be 'z'

                        if the letter was 'b' and the shift was 4,
                        'b' - 4 is a symbol so we add 26 to it

                        'b' - 4 + 26 = 'x'
                */

                letter += 26;
            }
            message[i] = letter;

        } else if (letter >= 'A' && letter <= 'Z') {
            letter -= 1;

            if (letter < 'A') {
                letter += 26;
            }
            message[i] = letter;
        }
    }

    // the 2 in %2i is used for right justification
    printf("%2i. %s", shift, message);
}
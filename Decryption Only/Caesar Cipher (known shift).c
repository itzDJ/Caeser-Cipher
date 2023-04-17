// decrypting based on Caesar's cipher and a known shift

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

    int shift;
    printf("Shift: ");
    scanf("%i", &shift);
    printf("\n");

    shiftMessage(shift, message);

    printf("\n");

    return 0;
}

void shiftMessage(int shift, char message[256])
{
    char letter;

    for (int i = 0; message[i] != '\0'; ++i)
    {
        // for loop runs until the character in the message is the null
        letter = message[i];

        if (letter >= 'a' && letter <= 'z')
        {
            letter -= shift;

            if (letter < 'a')
            {
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
        }
        else if (letter >= 'A' && letter <= 'Z')
        {
            letter -= shift;

            if (letter < 'A')
            {
                letter += 26;
            }
            message[i] = letter;
        }
    }

    printf("%s", message);
}
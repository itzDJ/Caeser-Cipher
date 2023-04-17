#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

// This initial calling of functions is needed because
// the following functions were declared after the main function.
void print_usage();
void encrypt();
void decrypt();
char *lowercaseString(char string[]);

// The parameters in main function are for accepting command line arguments (CLAs).
int main(int argc, char *argv[])
{
    // This if statement exits the program if there are more than two CLAs.
    // The first of those two CLAs, argv[0], is the script name.
    if (argc != 2)
    {
        print_usage();
    }

    // The strcmp function takes two strings as arguments.
    // If the strings are equal, return the number 0.
    // This function must be used in the conditional statement instead of: if (argv[1] == "--encrypt")
    if (strcmp(argv[1], "--encrypt") == 0)
    {
        encrypt();
    }
    else if (strcmp(argv[1], "--decrypt") == 0)
    {
        decrypt();
    }
    else
    {
        print_usage();
    }

    return 0;
}

void encrypt()
{
    char plaintext[256];
    printf("\nEnter the message you want to encrypt: ");
    fgets(plaintext, 256, stdin);

    lowercaseString(plaintext);

    char line[256];
    int shift;
    printf("Enter the desired shift value (integer between 1 and 25): ");
    fgets(line, sizeof(line), stdin);
    sscanf(line, "%d", &shift);

    if (shift > 25 || shift < 0)
    {
        printf("Invalid shift value.\n\n");
        exit(1);
    }

    printf("%d. ", shift);
    for (int j = 0; j < strlen(plaintext); ++j)
    {
        char letter = plaintext[j] - 97;

        if (letter > 25 || letter < 0)
        {
            printf("%c", plaintext[j]);
            continue;
        }

        int formula = (letter + shift) % 26;

        if (formula > 25)
        {
            formula -= 26;
        }
        else if (formula < 0)
        {
            formula += 26;
        }

        letter = formula + 97;

        printf("%c", letter);
    }

    printf("\n\n");
}

void decrypt()
{
    char ciphertext[256];
    printf("\nEnter the Caesar Cipher encoded text: ");
    fgets(ciphertext, 256, stdin);

    lowercaseString(ciphertext);

    for (int shift = 1; shift != 26; ++shift)
    {
        printf("%d. ", shift);
        for (int j = 0; j < strlen(ciphertext); ++j)
        {
            char letter = ciphertext[j] - 97;

            if (letter > 25 || letter < 0)
            {
                printf("%c", ciphertext[j]);
                continue;
            }

            int formula = (letter - shift) % 26;

            if (formula > 25)
            {
                formula -= 26;
            }
            else if (formula < 0)
            {
                formula += 26;
            }

            letter = formula + 97;

            printf("%c", letter);
        }
    }

    printf("\n\n");
}

void print_usage()
{
    printf("\nIncorrect argument usage.\n");
    printf("Run either `./Caesar_Cipher --encrypt` or `./Caesar_Cipher --decrypt`.\n\n");

    // The exit() function will exit the program if called anywhere in the code.
    // A return statement from within the main function will act in the same way.
    // The exit() function requires an integer as its parameter.
    // No matter the integer value, the exit() function will exit the program.
    // That integer is the exit status. Exit status 1 is "Operation not permitted".
    exit(1);
}

// return type is a pointer to the first element in the string
char *lowercaseString(char string[])
{
    for (int i = 0; i != strlen(string); ++i)
    {
        string[i] = tolower(string[i]);
    }

    return string;
}

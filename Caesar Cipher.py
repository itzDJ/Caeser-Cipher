#!/usr/bin/env python3

import random
import sys


def encrypt():
    # getting the ciphertext and making it lowercase
    plaintext = input("Enter the plaintext to encode: ").lower()
    print("")

    shift_type = input("Random or custom shift? (r/c): ")
    if shift_type == "r":
        shift = random.randint(1, 25)
    elif shift_type == "c":
        shift = int(input("Enter the shift to encode (1 - 25): "))

        if shift > 25 or shift < 1:
            print("Invalid shift.")
            sys.exit()
    else:
        print("Invalid input.")
        sys.exit()

    # start: variable shift = 1
    # stop: variable shift = 26
    print(f"{shift}. ", end="")
    for char in plaintext:
        # ord() gets the ASCII code of a character
        # ascii value of lowercase letter - 97 makes:
        # 'a' = 0, 'b' = 1, ... 'z' = 25

        letter = ord(char) - 97

        if letter > 25 or letter < 0:
            # used to account for symbols
            # prints whatever character isn't in the alphabet
            print(char, end="")
            continue  # go back to top of body of loop

        # defining the formula for the Caesar Cipher
        formula = (letter + shift) % 26

        if formula > 25:
            formula -= 26
        elif formula < 0:
            formula += 26

        # chr() gets the character encoded by an ASCII code number
        # the + 97 is used to make 'a' go from 0 to 97
        # (back to its ascii value)
        letter = chr(formula + 97)

        print(letter, end="")

    print("")

    # this print statement is to end with a newline
    print("")


def decrypt():
    # getting the ciphertext and making it lowercase
    ciphertext = input("Enter the Caesar Cipher encoded text: ").lower()
    print("")

    for shift in range(1, 26):
        # start: variable shift = 1
        # stop: variable shift = 26
        print(f"{shift}. ", end="")
        for char in ciphertext:
            # ord() gets the ASCII code of a character
            # ascii value of lowercase letter - 97 makes:
            # 'a' = 0, 'b' = 1, ... 'z' = 25

            letter = ord(char) - 97

            if letter > 25 or letter < 0:
                print(char, end="")
                continue  # go back to top of body of loop

            # defining the formula for the Caesar Cipher
            formula = (letter - shift) % 26

            if formula > 25:
                formula -= 26
            elif formula < 0:
                formula += 26

            # chr() gets the character encoded by an ASCII code number
            # the + 97 is used to make 'a' go from 0 to 97
            # (back to its ascii value)
            letter = chr(formula + 97)

            print(letter, end="")

        shift += 1
        print("")

    # this print statement is to end with a newline
    print("")


def main():
    # args is a list of the command line arguments
    # sys.argv[0] is the script name
    # [0:] starts splicing at the zero index to getting all indexes from 0+

    args = sys.argv[0:]
    if len(args) != 2:
        print("Incorrect argument usage.")
        sys.exit()
    else:
        arg = args[1]

    if arg == "--encrypt" or arg == "-e":
        encrypt()
    elif arg == "--decrypt" or arg == "-d":
        decrypt()
    else:
        print("Incorrect argument usage.")
        sys.exit()


if __name__ == '__main__':
    main()

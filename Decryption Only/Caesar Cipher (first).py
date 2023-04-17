#!/usr/bin/env python3


def main():
    ciphertext = (input("Enter the Caesar Cipher encoded text: ")).lower()

    alphabet = "abcdefghijklmnopqrstuvwxyz"

    # list slicing
    # turning the string alphabet into a list
    alphabet_list = []
    alphabet_list[:] = alphabet

    for shift in range(1, 26):
        # start: variable shift = 1
        # stop: variable shift = 26
        plaintext = f"{shift}. "
        # shifts the alphabet up the value i which changes in the loop
        alphabet_list_shift = alphabet_list[shift:] + alphabet_list[:shift]

        # turning the string cipertext into a list
        ciphertext_list = []
        ciphertext_list[:] = ciphertext

        # sets the alphabet_list_shift to the keys
        # sets alphabet_list_shift to the values of the dictionary
        dictionary = dict(zip(alphabet_list_shift, alphabet_list))

        for char in ciphertext_list:
            match char:
                case " ":
                    plaintext = plaintext + " "
                case "-":
                    plaintext = plaintext + "-"
                case ".":
                    plaintext = plaintext + "."
                case _:  # basically the else statement
                    plaintext = plaintext + dictionary[char]

        print(plaintext)


if __name__ == '__main__':
    main()

import random

secret_number = random.randint(1, 100)

print("Welcome to the Guess the Number game!")
print("I'm thinking of a number between 1 and 100. Can you guess what it is?")

guess = None

while guess != secret_number:
    user_input = input("Enter your guess: ")
    
    try:
        guess = int(user_input)
    except ValueError:
        print("That's not a valid number. Please enter an integer between 1 and 100.")
        continue

    if guess < secret_number:
        print("Your guess is too low. Guess again.")
    elif guess > secret_number:
        print("Your guess is too high. Guess again.")
    else:
        print("Congratulations! You guessed the number correctly!")


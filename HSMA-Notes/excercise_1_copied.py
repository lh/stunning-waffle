def play_game(word_length, word_list):

list_of_x_letter_words = [

word for word in word_list if len (word) == word_length

]

random word = random. choice(list_of_x_letter _words)

hm progress = 0 
privileged

guessed_characters = 0

guessed_letters = []

current_state = ["_" for x in range(word_length) ]

for char in current

print (f char), end.,

print)

print_hangman_image (hm_progress)

while hm_progress < 7:

selected_ letter = input ("Please input a letter : ")

if selected_letter in guessed_ letters:

print (f"You've guessed {selected_letter) before, try another.") else:

guessed

letters. append (selected letter)

if selected_letter in random word:

print (f"Correct! {selected letter} is in the word!") for char_index in range(word_length) :

if random word[char_index] == selected_letter:

current_ state[char_index] = selected_letter

guessed_characters += 1

else:

print (f"Sorry, there's no {selected_letter)")

hm_progress += 1

if guessed

_characters == word_length:

print ("Well done - you win!") break

for char in current _state:

print (f"{char) ", end='')

print

print _hangman_image(hm_progress)

time. sleep (1)

print (f"The word was {random_word}")

length_of_word = int(input( "Please input number of letters for word : "))

play_game(length_of_word, list_of _words)
import requests
from PIL import Image
from io import BytesIO
import matplotlib.pyplot as plt
import random

suits = ['Hearts', 'Diamond', 'Clubs', 'Spade']
cards = [c for c in range(1, 13)]
deck = []
for suit in suits:
    for card in cards:
        _ = (card, suit)
        deck.append(_)
#print(deck)

random.shuffle(deck)

#chosen_card = deck.pop()


continue_game=True
high_score=0
while continue_game:
    print("Welcome!")
    # URL of the image
    image_url = "http://www.ukgameshows.com/p/images/thumb/d/d8/Playyourcardsright_desk.jpg/400px-Playyourcardsright_desk.jpg"
    response = requests.get(image_url)
    img = Image.open(BytesIO(response.content))
    plt.imshow(img)
    plt.axis('off')  # Turn off axis
    plt.show()

    #marker for the value of the home card
   # chosen_card = shuffled_deck.pop()
    
    chosen_card = deck.pop()
    card_value = chosen_card[0]

    home_card_value = card_value

    is_won=False
    all_guess=[]
    round_number = 0

    while round_number < 5:

        print(f"your card is {chosen_card} worth {home_card_value} ") 

        guess=input(f"Will your next card be higher (H) or lower (L)?")

        next_card = deck.pop()
        #next_card = chosen_card
        next_card_value = next_card[0]  

        all_guess.append(chosen_card)
        
        if guess == "H" and home_card_value < next_card_value:
            print("No! You are out of the game bad luck!")
            break
            
        elif guess == "H" and home_card_value < next_card_value:
            print("YOUR RIGHT!!!!! ")
            round_number += 1
            home_card_value = next_card
            chosen_card = next_card
            
        
        elif guess == "L" and home_card_value > next_card_value:
            print("No! You are out of the game bad luck!")
            break

        elif guess == "L" and home_card_value < next_card_value:
             print("YOUR RIGHT!!!!! ")
             round_number += 1
             home_card_value = next_card
             chosen_card = next_card

        elif home_card_value == next_card_value:
            print("You get nothing for a pair")
            home_card_value = next_card
            chosen_card = next_card

        
    if round_number == 6:
        winner_url = "https://www.thesun.co.uk/wp-content/uploads/2018/08/NINTCHDBPICT000346680648-e15336666018431.jpg"
    # Download the image using requests
        winner_resp = requests.get(winner_url)

            # Open the image using PIL (Python Imaging Library)
        img = Image.open(BytesIO(winner_resp.content))

            # Display the image
        plt.imshow(img)
        plt.axis('off')  # Turn off axis
        plt.show()

        print("You are a winner!!!!!!!!")

        prize_choice = ['Copy of Short Circuits', 'Speedboat', 'TV','Trip to Cornwall', 
                'Free Wimpys','Free Blockbuster Rental', 'Rubiks Cube',  'Rollerskates', 'Casio Watch']
        prize = random.choice(prize_choice)
        print(prize)
            
            

    cont = input("Press return to continue. Enter 'n' to end the game:")
    if cont=='n':
        continue_game=False
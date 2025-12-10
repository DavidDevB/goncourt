
from business.goncourt import Goncourt
from models.book import Book


def main() -> None:
    """
    Main function of the Goncourt application.
    Allows the user to choose to run the application as a 'User', as 'the President
    or as a member of the 'Jury'.
    """
    print("Hello dear stranger!")
    choice = input("Do you want to run the Goncourt as a 'User', as 'the President' or as a member of the 'Jury'?: ").strip().lower()

    if choice == 'the president':
        goncourt = Goncourt()
        print("Welcome President of Goncourt!")
        for book_id in range(1, 16):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                book.selection = "first"
                goncourt.add_book_to_selection(book)
        all_books = goncourt.get_books_from_selection("first")
        print("We are on September 3rd, 2025 and the first 15 books of the first selection have been revealed.")
        print("--------------------------------")
        print("Here is the list of books from the first selection:")
        print("--------------------------------")
        for book in all_books:
            print(book.__str__())
            print("\n")
        print("--------------------------------")
        print("See you on October 7th, 2025 to discover the books of the second selection.")
        print("--------------------------------")
        print("\n")
        print("Welcome President of Goncourt!")
        print("We are on October 7th, 2025 and the 8 books of the second selection have been revealed.")
        print("--------------------------------")
        for book_id in range(1, 9):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                book.selection = "second"
                goncourt.add_book_to_selection(book)
        all_books = goncourt.get_books_from_selection("second")
        print("Here is the list of books from the second selection:")
        for book in all_books:
            print(book.__str__())
            print("\n")
        print("--------------------------------")
        print("See you on October 28th, 2025 to discover the books of the third selection.")
        print("--------------------------------")
        print("\n")
        print("Welcome President of Gouncourt!")
        print("We are on October 28th, 2025 and the 4 books of the third selection have been revealed.")
        print("--------------------------------")
        for book_id in range(1, 5):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                book.selection = "third"
                goncourt.add_book_to_selection(book)
        all_books = goncourt.get_books_from_selection("third")
        print("Here is the list of books from the third selection:")    
        for book in all_books:
            print(book.__str__())
            print("\n")
        print("--------------------------------")
        print("See you on November 4th, 2025 to discover the Goncourt 2025 winner.")
        print("--------------------------------")
        print("\n")
        print("Welcome President of Goncourt!")
        print("We are on November 4th, 2025 and the Goncourt 2025 winner has been revealed.")
        winner_book = goncourt.get_book_by_id(1)
        print("Here is the Goncourt 2025 winning book:")
        if winner_book is not None:
            print(winner_book.__str__())
        print("--------------------------------")
        print("The votes of the last selection were as follows:")
        book1 = goncourt.get_book_by_id(1)
        if book1 is not None:
            book1.voices = 6
            print(f"{book1.title} received {book1.voices} voices.")
        book2 = goncourt.get_book_by_id(2)
        if book2 is not None:
            book2.voices = 4
            print(f"{book2.title} received {book2.voices} voices.")

    elif choice == 'user':
        goncourt = Goncourt()
        
        for book_id in range(1, 16):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                goncourt.add_book_to_books_1(book)
        all_books = goncourt.get_books_from_books_1()
        print("--------------------------------")
        print("Books from first selection:")
        print("--------------------------------")
        for book in all_books:
            print(book.__str__())
            print("\n")
        
        for i in range(1, 9):
            book = goncourt.get_book_by_id(i)
            if book is not None:
                goncourt.add_book_to_books_2(book)
        all_books_2 = goncourt.get_books_from_books_2()
        print("--------------------------------")
        print("Books from second selection:")   
        print("--------------------------------")
        for book in all_books_2:
            print(book.__str__())
            print("\n")

        for i in range (1, 5):
            book = goncourt.get_book_by_id(i)
            if book is not None:
                goncourt.add_book_to_books_3(book)
        all_books_3 = goncourt.get_books_from_books_3()
        print("--------------------------------")
        print("Books from third selection:")
        print("--------------------------------")
        for book in all_books_3:
            print(book.__str__())
            print("\n")
        
    elif choice == 'jury':
        goncourt = Goncourt()
        password = input("Please the password to be able to vote: ")
        if password != "goncourt2025":
            print("Wrong password! Access denied.")
            return
        all_juries = []
        voted_books = []
        while len(all_juries) < 10:
            print("--------------------------------")
            for jury in goncourt.get_all_juries():
                print(f"Jury Member: {jury}")
            jury_name = input("Choose your jury member from the list above by entering his full name: ").strip()
            if not any(j.__str__() == jury_name for j in goncourt.get_all_juries()):
                print("This jury member does not exist. Please choose a valid jury member from the list.")
                continue
            if any(j == jury_name for j in all_juries):
                print("This jury member has already voted. Please choose another one.")
                continue
            print(f"Welcome {jury_name}!")
            while True:
                choice = input("Do you want to vote for a book? (yes/no):").strip().lower()
                if choice == "yes":
                    print("Here are the books from the first selection:")
                    print("--------------------------------")
                    first_selection_books = goncourt.get_books_from_selection("first")
                    for book in first_selection_books:
                        print(book.__str__())
                        print("\n")
                    vote = int(input("Enter the book ID you want to vote for: "))
                    voted_book = None
                    # Vérifie que le livre a déjà été voté dans cette session
                    # Si oui, utilise l'objet existant
                    # Sinon, le récupère depuis la base de données
                    # et l'ajoute à la liste des livres votés dans cette session
                    # Enfin, incrémente le nombre de voix du livre
                    for book in voted_books:
                        if book.book_id == vote:
                            voted_book = book
                            break

                    if voted_book is None:
                        voted_book = goncourt.get_book_by_id(vote)
                        if voted_book is not None:
                            voted_books.append(voted_book)

                    if voted_book is not None:
                        voted_book.add_voice()
                        print(f"✓ You have voted for {voted_book.title}. Thank you for your vote!")
                    else:
                        print("❌ Invalid book ID.")
                elif choice == "no":
                    print(f"Thank you {jury_name} for your participation!")
                    break
                else:
                    print("Invalid choice. Please enter 'yes' or 'no'.")
            all_juries.append(jury_name)
    else:
        print("Invalid choice. Please restart the program and choose a valid option.")
        



if __name__ == "__main__":
    main()
    
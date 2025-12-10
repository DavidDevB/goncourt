

from business.goncourt import Goncourt
from models.book import Book


def main(choice: str) -> None:

    if choice == 'the president':
        goncourt = Goncourt()
        print("Welcome President of Goncourt!")
        for book_id in range(1, 16):
            book = Goncourt.get_book_by_id(book_id)
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
        print("See you on November 5th, 2025 to discover the Goncourt 2025 winner.")
        print("--------------------------------")
        print("\n")
        print("Welcome President of Goncourt!")
        print("We are on November 5th, 2025 and the Goncourt 2025 winner has been revealed.")
        winner_book = Goncourt.get_book_by_id(1)
        print("Here is the Goncourt 2025 winning book:")
        if winner_book is not None:
            print(winner_book.__str__())

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
        
    








if __name__ == "__main__":
    print("Hello dear stranger!")
    choice = input("Do you want to run the Goncourt as a 'User' or as 'the President'?: ")
    main(choice.strip().lower())
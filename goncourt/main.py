

from business.goncourt import Goncourt
from models.book import Book


def main(choice: str) -> None:

    if choice == 'the president':
        goncourt = Goncourt()
        print("Bienvenue Président du Goncourt!")
        for book_id in range(1, 16):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                goncourt.add_book_to_books_1(book)
        all_books = goncourt.get_books_from_books_1()
        for book in all_books:
            goncourt.set_book_selection(book, "first")
        print("Nous sommes le 3 Septembre 2025 et les 15 premiers livres de la sélection ont été dévoilés.")
        print("--------------------------------")
        print("Voici la liste des livres de la première sélection :")
        print("--------------------------------")
        for book_id in range(1, 16):
            book = goncourt.get_book_by_id(book_id)
            if book is not None:
                goncourt.add_book_to_books_1(book)
        all_books = goncourt.get_books_from_books_1()
        for book in all_books:
            print(book.__str__())
            print("\n")

        print("--------------------------------")
        print("Rendez-vous le 7 Octobre 2025 pour découvrir les livres de la deuxième sélection.")
        print("--------------------------------")
        print("\n")
        print("Bienvenue Président du Goncourt!")
        print("Nous sommes le 7 Octobre 2025 et les 8 livres de la deuxième sélection ont été dévoilés.")
        print("--------------------------------")

        print("Voici la liste des livres de la deuxième sélection:")
        selection = input("Quelle sélection voulez-vous consulter (2 ou 3) ? ").strip()
        if selection not in ['2', '3']:
            print("Sélection invalide. Veuillez choisir 2 ou 3.")
            return
        selection_number = int(selection)

        goncourt = Goncourt()

    # elif choice == 'user':
    #     goncourt = Goncourt()
        
    #     for book_id in range(1, 16):
    #         book = goncourt.get_book_by_id(book_id)
    #         if book is not None:
    #             goncourt.add_book_to_books_1(book)
    #     all_books = goncourt.get_books_from_books_1()
    #     print("--------------------------------")
    #     print("Books from first selection:")
    #     print("--------------------------------")
    #     for book in all_books:
    #         print(book.__str__())
    #         print("\n")
        
    #     for i in range(1, 9):
    #         book = goncourt.get_book_by_id(i)
    #         if book is not None:
    #             goncourt.add_book_to_books_2(book)
    #     all_books_2 = goncourt.get_books_from_books_2()
    #     print("--------------------------------")
    #     print("Books from second selection:")   
    #     print("--------------------------------")
    #     for book in all_books_2:
    #         print(book.__str__())
    #         print("\n")

    #     for i in range (1, 5):
    #         book = goncourt.get_book_by_id(i)
    #         if book is not None:
    #             goncourt.add_book_to_books_3(book)
    #     all_books_3 = goncourt.get_books_from_books_3()
    #     print("--------------------------------")
    #     print("Books from third selection:")
    #     print("--------------------------------")
    #     for book in all_books_3:
    #         print(book.__str__())
    #         print("\n")
        
    








if __name__ == "__main__":
    print("Hello dear stranger!")
    choice = input("Do you want to run the Goncourt as a 'User' or as 'the President'?: ")
    main(choice.strip().lower())
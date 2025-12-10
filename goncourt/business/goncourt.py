# -*- coding: utf-8 -*-

from dataclasses import dataclass, field
from datetime import date
from typing import Optional
from daos.book_dao import BookDao
from daos.author_dao import AuthorDao
from daos.editor_dao import EditorDao
from daos.selection_dao import SelectionDao
from models.book import Book
from models.author import Author


@dataclass
class Goncourt:
    """Business layer of the Goncourt application, implementing use cases and functional specifications."""

    books_1: list[Book] = field(default_factory=list, init=False)
    books_2: list[Book] = field(default_factory=list, init=False)
    books_3: list[Book] = field(default_factory=list, init=False)
    authors: list[Author] = field(default_factory=list, init=False)

    def add_book_to_books_1(self, book: Book) -> None:
        """Adds the book to the list of books."""
        self.books_1.append(book)

    def get_books_from_books_1(self) -> list[Book]:
        """Returns the list of books."""
        return self.books_1

    def add_book_to_books_2(self, book: Book) -> None:
        """Adds the book to the list of books."""
        self.books_2.append(book)

    def get_books_from_books_2(self) -> list[Book]:
        """Returns the list of books."""
        return self.books_2

    def add_book_to_books_3(self, book: Book) -> None:
        """Adds the book to the list of books."""
        self.books_3.append(book)

    def get_books_from_books_3(self) -> list[Book]:
        """Returns the list of books."""
        return self.books_3

    def add_author(self, author: Author) -> None:
        """Adds the author to the list of authors."""
        self.authors.append(author)

    @staticmethod
    def get_all_books() -> list[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read_all()

    @staticmethod
    def get_book_by_id(id_book: int) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book, book=None)

    
    def get_author_by_id(self, id_author: int) -> Optional[Author]:
        author_dao: AuthorDao = AuthorDao()
        return author_dao.read(id_author)
       
    @staticmethod
    def set_book_selection(book: Book, selection: str) -> None:
        """Sets the selection number of the book."""
        book.selection = selection

    def add_book_to_selection(self, book: Book):
        """Adds the book to the selection in the database."""
        selection_dao: SelectionDao = SelectionDao()
        if book.selection is not None:
            selection_dao.create(book)

    def get_books_from_selection(self, selection: str) -> list[Book]:
        """Returns all books in a given selection."""
        selection_dao: SelectionDao = SelectionDao()
        return selection_dao.read_all_the_selection(selection)

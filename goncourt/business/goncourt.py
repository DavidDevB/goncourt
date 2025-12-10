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

    def get_author_by_id(self, id_author: int) -> Optional[Author]:
        author_dao: AuthorDao = AuthorDao()
        return author_dao.read(id_author)
    
    def add_book_to_selection(self, book: Book):
        """Adds the book to the selection in the database."""
        selection_dao: SelectionDao = SelectionDao()
        if book.selection is not None:
            selection_dao.create(book)

    def get_books_from_selection(self, selection: str) -> list[Book]:
        """Returns all books in a given selection."""
        selection_dao: SelectionDao = SelectionDao()
        return selection_dao.read_all_the_selection(selection)
    
    @staticmethod
    def get_all_books() -> list[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read_all()

    @staticmethod
    def get_book_by_id(id_book: int) -> Optional[Book]:
        book_dao: BookDao = BookDao()
        return book_dao.read(id_book, book=None)

    @staticmethod
    def set_book_selection(book: Book, selection: str) -> None:
        """Sets the selection number of the book."""
        book.selection = selection

    

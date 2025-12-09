
"""
Class Book
"""


from dataclasses import dataclass, field
from .author import Author
from .editor import Editor
from typing import Optional


@dataclass
class Book():
    """
    Represents a book and his data :
    - book_id       : primary key of the persistent entity
    - title         : title of the book
    - summary       : summary of the book
    - characters    : main characters of the book
    - parution_date : date of parution of the book
    - pages         : number of pages of the book
    - isbn          : isbn number of the book
    - price         : price of the book
    - author        : author of the book
    - editor        : editor of the book
    - selection     : selection number of the book
    - voices        : number of voices for the book
    """
    title: str
    summary: str
    characters: str
    parution_date: str
    pages: int
    isbn: int
    price: int
    author: Author
    editor: Editor
    selection: Optional[str]
    voices: Optional[int]
    book_id: Optional[int] = field(default=None, init=False)

    def set_author(self, author: Author) -> None:
        """Sets the author of the book."""
        self.author = author

    def set_editor(self, editor: Editor) -> None:
        """Sets the editor of the book."""
        self.editor = editor

    def set_selection(self, selection: str) -> None:
        """Sets the selection number of the book."""
        self.selection = selection

    def set_voices(self, voices: int) -> None:
        """Sets the number of voices for the book."""
        self.voices = voices

    def get_author(self) -> Author:
        """Returns the book's author."""
        return self.author
    
    def get_editor(self) -> Editor:
        """Returns the book's editor."""
        return self.editor
    
    def __str__(self) -> str:
        return (f"{self.title} by {self.author}, published by {self.editor} on {self.parution_date}.\n"
               f"Summary: {self.summary}\nCharacters: {self.characters}\nPages: {self.pages}, ISBN: {self.isbn}, Price: {self.price}€\n"
               )


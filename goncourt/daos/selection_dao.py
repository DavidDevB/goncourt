
from dataclasses import dataclass, field
from typing import Optional
from goncourt.daos.dao import Dao
from goncourt.models.book import Book
from goncourt.models.author import Author
from goncourt.models.editor import Editor
import pymysql.cursors


@dataclass
class SelectionDao(Dao[Book]):
    """Data access object for the Selection model."""

    def create(self, obj: Selection) -> int:
        """Inserts the book into the selection in the DB.

        :param selection: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "INSERT INTO (%s)_selection (selection_number) VALUES (%s)"
                cursor.execute(sql, (obj.selection, obj.book_id,))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error inserting book to selection: {e}")
                return 0
            
            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
    
    def read(self, id_entity: int, book: Optional[Book]) -> Optional[Book]:
            """Returns the book corresponding to the entity whose id is id_entity
            (or None if it could not be found)"""
            if book is None:
                return None
                
            book_to_get: Optional[Book]

            with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
                sql = """
                SELECT * FROM (%s)_selection
                INNER JOIN books ON books.book_id = (%s)_selection.book_id
                WHERE first_selection_id=%s
                """
                cursor.execute(sql, (book.selection, id_entity,))
                record = cursor.fetchone()
            if record is not None:
                book_to_get = Book(
                    title=record["title"],
                    summary=record["summary"],
                    characters=record["characters"],
                    parution_date=record["parution_date"],
                    pages=record["pages"],
                    isbn=record["isbn"],
                    price=record["price"],
                    author=book.author,
                    editor=book.editor,
                    selection=record["selection_number"],
                    voices=book.voices
                )
                book_to_get.book_id = record['first_selection_id']
            else:
                book_to_get = None
            return book_to_get
    
    def read_all_the_selection(self, selection: str) -> list[Book]:
        """Returns all books in a given selection."""
        books: list[Book] = []

        table_name = f"{selection}_selection"

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = f"""
            SELECT * FROM {table_name}
            INNER JOIN books ON books.book_id = (%s)_selection.book_id
            INNER JOIN authors ON books.author_id = authors.author_id
            INNER JOIN editors ON books.editor_id = editors.editor_id
            """
            cursor.execute(sql, (selection, selection,))
            records = cursor.fetchall()
        for record in records:

            author = Author(
                first_name=record["first_name"],
                last_name=record["last_name"],
                biography=record["biography"]
            )
            author.author_id = record['author_id']

            editor = Editor(
                name=record["name"]
            )
            editor.editor_id = record['editor_id']
            book = Book(
                title=record["title"],
                summary=record["summary"],
                characters=record["characters"],
                parution_date=record["parution_date"],
                pages=record["pages"],
                isbn=record["isbn"],
                price=record["price"],
                author=author,
                editor=editor,
                selection=record["selection_number"],
                voices=None
            )
            book.book_id = record['book_id']
            books.append(book)
        return books

    def update(self, obj: Book) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "UPDATE (%s)_selection SET selection_number=%s WHERE book_id=%s"
                cursor.execute(sql, (obj.selection, obj.book_id,))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error updating book selection: {e}")
                return False
            
            return cursor.rowcount > 0
        

    def delete(self, obj: Book) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "DELETE FROM (%s)_selection WHERE book_id=%s"
                cursor.execute(sql, (obj.selection, obj.book_id,))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error deleting book from selection: {e}")
                return False
            
            return cursor.rowcount > 0
        
        
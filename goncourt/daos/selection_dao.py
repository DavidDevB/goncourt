
from dataclasses import dataclass, field
from typing import Optional
from daos.dao import Dao
from models.book import Book
from models.author import Author
from models.editor import Editor
import pymysql.cursors


@dataclass
class SelectionDao(Dao[Book]):
    """Data access object for the Selection model."""

    def create(self, obj: Book) -> int:
        """Inserts the book into the selection in the DB.

        :param selection: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """

        table_name = f"{obj.selection}_selection"

        with Dao.connection.cursor() as cursor:
            try:
                sql = f"INSERT INTO {table_name} (fk_book_id) VALUES (%s)"
                cursor.execute(sql, (obj.book_id,))
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
                
            table_name = f"{book.selection}_selection"    
        
            book_to_get: Optional[Book]

            with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
                sql = f"""
                SELECT * FROM {table_name}
                INNER JOIN books ON books.book_id = {table_name}.book_id
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
            SELECT b.book_id,
                b.title,
                b.summary,
                b.characters,
                b.parution_date,
                b.pages,
                b.isbn,
                b.price,
                b.fk_author_id,
                b.fk_editor_id,
                s.{table_name}_id,
                a.author_id,
                a.first_name,
                a.last_name,
                a.biography,
                e.editor_id,
                e.name
            FROM {table_name} s
            INNER JOIN books b ON s.fk_book_id = b.book_id
            INNER JOIN authors a ON b.fk_author_id = a.author_id
            INNER JOIN editors e ON b.fk_editor_id = e.editor_id
            ORDER BY s.{table_name}_id
            """
            cursor.execute(sql, ())
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
                selection=record[f"{table_name}_id"],
                voices=0
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
        
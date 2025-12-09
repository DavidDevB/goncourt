
from dataclasses import dataclass
from models.book import Book
from models.author import Author
from models.editor import Editor
from daos.dao import Dao
from typing import Optional
import pymysql.cursors

@dataclass
class BookDao(Dao[Book]):
    """DAO for Book entities"""
    def create(self, obj: Book) -> int:
        """Creates the entity in the DB corresponding to the object book

        :param book: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = """
                        INSERT INTO books (title, summary, characters, parution_date, pages, isbn, price, author_id, editor_id)
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """
                cursor.execute(sql, (obj.title, obj.summary, obj.characters, obj.parution_date,
                                    obj.pages, obj.isbn, obj.price,
                                    obj.author.author_id if obj.author else None,
                                    obj.editor.editor_id if obj.editor else None,
                                    ))

                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error creating book: {e}")
                return 0 

            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
            
    def read(self, id_entity: int) -> Optional[Book]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        book: Optional[Book]

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = """
            SELECT 
                b.book_id, 
                b.title, 
                b.summary, 
                b.characters, 
                b.parution_date, 
                b.pages, 
                b.isbn, 
                b.price,
                a.author_id,
                a.first_name AS author_first_name,
                a.last_name AS author_last_name,
                a.biography AS author_biography,
                e.editor_id,
                e.name AS editor_name
            FROM books b
            INNER JOIN authors a ON b.fk_author_id = a.author_id
            INNER JOIN editors e ON b.fk_editor_id = e.editor_id
            WHERE b.book_id=%s
        """
            cursor.execute(sql, (id_entity,))
            record = cursor.fetchone()
        if record is not None:

            author = Author(
                first_name=record["author_first_name"],
                last_name=record["author_last_name"],
                biography=record["author_biography"],
            )
            author.author_id = record['author_id']

            editor = Editor(
                name=record["editor_name"]
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
                selection=None,
                voices=None,
            )
            book.book_id = record['book_id']
        else:
            book = None

        return book
    
    def read_all(self) -> list[Book]:
        """ Returns all books from the database """
        books: list[Book] = []

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = """
            SELECT 
                b.book_id, 
                b.title, 
                b.summary, 
                b.characters, 
                b.parution_date, 
                b.pages, 
                b.isbn, 
                b.price,
                a.author_id,
                a.first_name AS author_first_name,
                a.last_name AS author_last_name,
                a.biography AS author_biography,
                e.editor_id,
                e.name AS editor_name
            FROM books b
            INNER JOIN authors a ON b.fk_author_id = a.author_id
            INNER JOIN editors e ON b.fk_editor_id = e.editor_id
        """

            cursor.execute(sql)
            records = cursor.fetchall()

        for record in records:

            author = Author(
                first_name=record["author_first_name"],
                last_name=record["author_last_name"],
                biography=record["author_biography"],
            )
            author.author_id = record['author_id']

            editor = Editor(
                name=record["editor_name"]
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
                selection=None,
                voices=None,
            )
            book.book_id = record['book_id']
            books.append(book)

        return books
    
    def update(self, obj: Book) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        if obj.book_id is None or obj.book_id <= 0:
            return False
        
        with Dao.connection.cursor() as cursor:
            try:
                sql = """
                        UPDATE books
                        SET title=%s, summary=%s, characters=%s, parution_date=%s,
                            pages=%s, isbn=%s, price=%s, author_id=%s, editor_id=%s
                        WHERE book_id=%s
                    """
                cursor.execute(sql, (obj.title, obj.summary, obj.characters, obj.parution_date,
                                    obj.pages, obj.isbn, obj.price,
                                    obj.author.author_id if obj.author else None,
                                    obj.editor.editor_id if obj.editor else None,
                                    obj.book_id))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error updating book: {e}")
                return False

            return cursor.rowcount > 0
        
    def delete(self, obj: Book) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "DELETE FROM books WHERE book_id=%s"
                cursor.execute(sql, (obj.book_id,))
                Dao.connection.commit()
                
            except pymysql.MySQLError as e:
                print(f"Error deleting book: {e}")
                return False
            
            return cursor.rowcount > 0

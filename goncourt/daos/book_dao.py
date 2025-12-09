
from dataclasses import dataclass
from models.book import Book
from daos.dao import Dao
from typing import Optional
import pymysql.cursors

@dataclass
class BookDao(Dao[Book]):
    def create(self, obj: Book) -> int:
        """Creates the entity in the DB corresponding to the object book

        :param book: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            sql = """
                    INSERT INTO book (title, summary, characters, parution_date, pages, isbn, price, author_id, editor_id)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                  """
            cursor.execute(sql, (obj.title, obj.summary, obj.characters, obj.parution_date,
                                 obj.pages, obj.isbn, obj.price,
                                 obj.author.author_id if obj.author else None,
                                 obj.editor.editor_id if obj.editor else None,
                                 ))

            Dao.connection.commit()

            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
            
    def read(self, id_entity: int) -> Optional[Book]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        book: Optional[Book]

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT * FROM book WHERE book_id=%s"
            cursor.execute(sql, (id_entity,))
            record = cursor.fetchone()
        if record is not None:
            book = Book(
                title=record["title"],
                summary=record["summary"],
                characters=record["characters"],
                parution_date=record["parution_date"],
                pages=record["pages"],
                isbn=record["isbn"],
                price=record["price"],
                author=record["author_id"],
                editor=record["editor_id"],
                selection=None,
                voices=None,
            )
            book.book_id = record['book_id']
        else:
            book = None

        return book
    
    def update(self, obj: Book) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        with Dao.connection.cursor() as cursor:
            sql = """
                    UPDATE book
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

            return cursor.rowcount > 0
        
    def delete(self, obj: Book) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            sql = "DELETE FROM book WHERE book_id=%s"
            cursor.execute(sql, (obj.book_id,))
            Dao.connection.commit()

            return cursor.rowcount > 0
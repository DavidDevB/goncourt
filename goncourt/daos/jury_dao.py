
from typing import Optional
from daos.dao import Dao
from models.jury import Jury
from models.book import Book
import pymysql.cursors


class JuryDao(Dao[Jury]):
    def create(self, obj: Jury) -> int:
        """Creates the jury member in the DB corresponding to the object obj

        :param obj: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            sql = """
            INSERT INTO juries (first_name, last_name)
            VALUES (%s, %s)
            """
            cursor.execute(sql, (obj.first_name, obj.last_name))
            Dao.connection.commit()
            return cursor.lastrowid
    
    def read(self, id_entity: int, book: Optional[Book]) -> Optional[Jury]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        jury_to_get: Optional[Jury]

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = """
            SELECT * FROM juries WHERE jury_id=%s
            """
            cursor.execute(sql, (id_entity,))
            record = cursor.fetchone()
        if record is not None:
            jury_to_get = Jury(
                first_name=record["first_name"],
                last_name=record["last_name"]
            )
            jury_to_get.jury_id = record['jury_id']
        else:
            jury_to_get = None

        return jury_to_get
    
    def read_all(self) -> list[Jury]:
        """Returns a list of all jury members in the database."""
        juries: list[Jury] = []

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT * FROM juries"
            cursor.execute(sql)
            records = cursor.fetchall()
        
        for record in records:
            jury = Jury(
                first_name=record["first_name"],
                last_name=record["last_name"]
            )
            jury.jury_id = record['jury_id']
            juries.append(jury)

        return juries
    
    def update(self, obj: Jury) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        with Dao.connection.cursor() as cursor:
            sql = """
            UPDATE juries
            SET first_name=%s, last_name=%s
            WHERE jury_id=%s
            """
            cursor.execute(sql, (obj.first_name, obj.last_name, obj.jury_id))
            Dao.connection.commit()
            return cursor.rowcount > 0
        
    def delete(self, obj: Jury) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            sql = """
            DELETE FROM juries WHERE jury_id=%s
            """
            cursor.execute(sql, (obj.jury_id,))
            Dao.connection.commit()
            return cursor.rowcount > 0


from dataclasses import dataclass
from daos.dao import Dao
from models.author import Author
from typing import Optional
import pymysql.cursors

@dataclass
class AuthorDao(Dao[Author]):
    """DAO for Author entities"""

    def create(self, obj: Author) -> int:
        """Creates the entity in the DB corresponding to the object author

        :param author: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "INSERT INTO author (first_name, last_name, biography) VALUES (%s, %s, %s)"
                cursor.execute(sql, (obj.first_name, obj.last_name, obj.biography))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error creating author: {e}")
                return 0
            
            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
            
    def read(self, id_entity: int) -> Optional[Author]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        author: Optional[Author]

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT * FROM author WHERE author_id=%s"
            cursor.execute(sql, (id_entity,))
            record = cursor.fetchone()
        if record is not None:
            author = Author(
                first_name=record["first_name"],
                last_name=record["last_name"],
                biography=record["biography"],
            )
            author.author_id = record['author_id']
        else:
            author = None
        return author
    
    def update(self, obj: Author) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "UPDATE author SET first_name=%s, last_name=%s, biography=%s WHERE author_id=%s"
                cursor.execute(sql, (obj.first_name, obj.last_name, obj.biography, obj.author_id))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error updating author: {e}")
                return False
            
            return cursor.rowcount > 0
        
    def delete(self, obj: Author) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "DELETE FROM author WHERE author_id=%s"
                cursor.execute(sql, (obj.author_id,))
                Dao.connection.commit()
                
            except pymysql.MySQLError as e:
                print(f"Error deleting author: {e}")
                return False
            
            return cursor.rowcount > 0
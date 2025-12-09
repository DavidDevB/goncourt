

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
            sql = "INSERT INTO author (first_name, last_name, biography) VALUES (%s, %s, %s)"
            cursor.execute(sql, (obj.first_name, obj.last_name, obj.biography))
            Dao.connection.commit()

            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
            
    def read(self, id_entity: int) -> Optional[Author]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
    
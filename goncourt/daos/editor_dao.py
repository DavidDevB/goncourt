

from dataclasses import dataclass
from daos.dao import Dao
from models.editor import Editor
from typing import Optional
import pymysql.cursors


@dataclass
class EditorDao(Dao[Editor]):
    """DAO for Editor entities"""

    def create(self, obj: Editor) -> int:
        """Creates the entity in the DB corresponding to the object editor

        :param editor: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "INSERT INTO editors (name, address) VALUES (%s)"
                cursor.execute(sql, (obj.name,))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error creating editor: {e}")
                return 0
            
            if cursor.rowcount > 0:
                return cursor.lastrowid
            else:
                return 0
            
    def read(self, id_entity: int) -> Optional[Editor]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        editor: Optional[Editor]

        with Dao.connection.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT * FROM editors WHERE editor_id=%s"
            cursor.execute(sql, (id_entity,))
            record = cursor.fetchone()
        if record is not None:
            editor = Editor(
                name=record["name"]
            )
            editor.editor_id = record['editor_id']
        else:
            editor = None
        return editor
    
    def update(self, obj: Editor) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "UPDATE editors SET name=%s WHERE editor_id=%s"
                cursor.execute(sql, (obj.name, obj.editor_id))
                Dao.connection.commit()

            except pymysql.MySQLError as e:
                print(f"Error updating editor: {e}")
                return False
            
            return cursor.rowcount > 0
        
    def delete(self, obj: Editor) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        with Dao.connection.cursor() as cursor:
            try:
                sql = "DELETE FROM editors WHERE editor_id=%s"
                cursor.execute(sql, (obj.editor_id,))
                Dao.connection.commit()
                
            except pymysql.MySQLError as e:
                print(f"Error deleting editor: {e}")
                return False

            return cursor.rowcount > 0
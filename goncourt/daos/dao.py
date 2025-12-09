# -*- coding: utf-8 -*-

"""
Generic abstract class Dao[T], from which the DAO classes of each entity inherit
"""

from dataclasses import dataclass
from abc import ABC, abstractmethod
from typing import ClassVar, Optional
import pymysql.cursors
from typing import TypeVar, Union


@dataclass
class Dao[T](ABC):
    connection: ClassVar[pymysql.Connection] = \
        pymysql.connect(host='localhost',
                        user='goncourt',
                        password='weR(@!-Zo_ho(cJc',
                        database='goncourt',
                        cursorclass=pymysql.cursors.DictCursor)

    @abstractmethod
    def create(self, obj: T) -> int:
        """Creates the entity in the DB corresponding to the object obj

        :param obj: to be created as a DB entity
        :return: the id of the entity inserted in the DB (0 if the creation failed).
        """
        ...

    @abstractmethod
    def read(self, id_entity: int) -> Optional[T]:
        """Returns the object corresponding to the entity whose id is id_entity
           (or None if it could not be found)"""
        ...

    @abstractmethod
    def update(self, obj: T) -> bool:
        """Updates the DB entity corresponding to obj, to match it

        :param obj: object already updated in memory
        :return: True if the update could be performed
        """
        ...

    @abstractmethod
    def delete(self, obj: T) -> bool:
        """Deletes the DB entity corresponding to obj

        :param obj: object whose corresponding entity is to be deleted
        :return: True if the deletion could be performed
        """
        ...

    def __getitem__(self, id: int) -> Optional[T]:
        """Allows to use the syntax dao[id] to read an entity by its id
        :param id: id of the entity to read
        :return: the object corresponding to the entity whose id is id_entity
        """
        return self.read(id)

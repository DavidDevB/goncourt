
from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Author:
    """
    Represents the author and his data :
    - first_name : author's first name
    - last_name  : author's last name
    - biography  : author's biography
    """
    first_name: str
    last_name: str
    biography: str
    author_id: Optional[int] = field(default=None, init=False)

    
    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
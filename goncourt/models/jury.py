
from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Jury:
    """
    Represents the jury's member and his data :
    - first_name : jury member's first name
    - last_name  : jury member's last name
    """
    first_name: str
    last_name:str
    jury_id: Optional[int] = field(default=None, init=False)
    
    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
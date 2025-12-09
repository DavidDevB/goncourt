
from dataclasses import dataclass, field
from typing import Optional

@dataclass
class Editor:
    """
    Represents the editor and his data :
    - name : editor's name
    """
    name: str
    editor_id: Optional[int] = field(default=None, init=False)

    def __str__(self) -> str:
        """String representation of the editor."""
        return f"{self.name}"
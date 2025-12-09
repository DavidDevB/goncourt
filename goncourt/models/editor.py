
from dataclasses import dataclass, field
from typing import Optional

@dataclass
class Editor:
    """
    Represents the editor and his data :
    - name : editor's name
    """
    editor_id: Optional[int] = field(default=None, init=False)
    name: str

    def get_name(self) -> str:
        """Returns the editor's name."""
        return self.name
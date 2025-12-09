

class Jury:
    """
    Represents the jury's member and his data :
    - first_name : jury member's first name
    - last_name  : jury member's last name
    """
    def __init__(self, first_name: str, last_name: str):
        self.first_name = first_name
        self.last_name = last_name

    def get_full_name(self) -> str:
        """Returns the complete name of the jury's member."""
        return f"{self.first_name} {self.last_name}"
    
    def __str__(self) -> str:
        return self.get_full_name()
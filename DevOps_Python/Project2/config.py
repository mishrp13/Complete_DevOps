
# Write a context manager for opening, locking, and closing a file.

import fcntl
from typing import Optional, IO


class LockedFile:
    """
    Context manager for opening a file with an exclusive lock.
    Ensures the file is locked during usage and always released properly.
    """

    def __init__(self, filepath: str, mode: str = "r"):
        self.filepath = filepath
        self.mode = mode
        self.file: Optional[IO] = None

    def __enter__(self) -> IO:
        try:
            self.file = open(self.filepath, self.mode)
            fcntl.flock(self.file.fileno(), fcntl.LOCK_EX)
            return self.file
        except Exception:
            if self.file:
                self.file.close()
            raise

    def __exit__(self, exc_type, exc_val, exc_tb) -> bool:
        try:
            if self.file:
                fcntl.flock(self.file.fileno(), fcntl.LOCK_UN)
                self.file.close()
        finally:
            self.file = None
        return False  # do not suppress exceptions

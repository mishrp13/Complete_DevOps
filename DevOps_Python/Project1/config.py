# Write a Python script that safely reads environment variables with defaults and validation.

import os
import sys
from typing import Callable, Optional, Type


class ConfigError(Exception):
    """Raised when configuration is invalid."""
    pass


def get_env(
    name: str,
    *,
    default: Optional[str] = None,
    required: bool = False,
    cast: Type = str,
    validator: Optional[Callable[[any], bool]] = None
):
    """
    Safely read and validate an environment variable.

    Args:
        name: Environment variable name
        default: Default value if not set
        required: Whether the variable must be set
        cast: Type to cast the value to
        validator: Optional validation function

    Returns:
        Validated and cast value

    Raises:
        ConfigError: If validation fails
    """
    value = os.getenv(name, default)

    if required and value is None:
        raise ConfigError(f"Missing required environment variable: {name}")

    if value is None:
        return None

    try:
        if cast is bool:
            value = value.lower() in {"1", "true", "yes", "on"}
        else:
            value = cast(value)
    except (ValueError, TypeError):
        raise ConfigError(f"Invalid value for {name}: cannot cast '{value}' to {cast.__name__}")

    if validator and not validator(value):
        raise ConfigError(f"Validation failed for {name}: invalid value '{value}'")

    return value




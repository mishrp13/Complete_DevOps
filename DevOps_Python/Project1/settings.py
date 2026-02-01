from config import get_env, ConfigError


def positive_int(value: int) -> bool:
    return value > 0


try:
    APP_NAME = get_env("APP_NAME", default="my-service")
    DEBUG = get_env("DEBUG", default="false", cast=bool)
    PORT = get_env("PORT", default="8080", cast=int, validator=positive_int)
    DATABASE_URL = get_env("DATABASE_URL", required=True)
    TIMEOUT_SECONDS = get_env("TIMEOUT_SECONDS", default="5", cast=int, validator=positive_int)

except ConfigError as e:
    # Fail fast — container should crash if config is bad
    raise SystemExit(f"❌ Configuration error: {e}")

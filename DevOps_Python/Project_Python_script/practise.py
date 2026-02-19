import logging

logging.basicConfig(
    filename="calculator.log",
    level=logging.INFO,
    format="%(asctime)s -%(levelname)s -%(message)s"
)

def divide(a,b):
    logging.info(f"Attempting division: {a}/{b} ")
    try:
        result= a/b
        logging.info(f"Divion  Successfull: {result}")
        return result
    except ZeroDivisionError:
        logging.error("Division by Zero attempted: ")
        return None
    
divide(10,2)
divide(5,0)
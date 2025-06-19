from dotenv import dotenv_values

def load_dotenv(file_path):
    return dotenv_values(file_path)

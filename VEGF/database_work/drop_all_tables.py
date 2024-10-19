import sqlite3
import subprocess

def drop_all_tables(db_path):
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    cursor.execute("PRAGMA foreign_keys = OFF;")
    cursor.execute("BEGIN TRANSACTION;")

    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()

    for table in tables:
        cursor.execute(f'DROP TABLE IF EXISTS "{table[0]}";')

    cursor.execute("COMMIT;")
    conn.close()

def rebuild_database(db_path, schema_file, error_log):
    # Drop all tables
    drop_all_tables(db_path)

    # Rebuild the database
    command = f"sqlite3 {db_path} < {schema_file}"
    with open(error_log, 'w') as error_file:
        subprocess.run(command, shell=True, stderr=error_file)

if __name__ == "__main__":
    db_path = 'output_mirror.sqlite'
    schema_file = 'output_schema_sqlite.sql'
    error_log = 'errors_in_output_schema.tsv'

    rebuild_database(db_path, schema_file, error_log)
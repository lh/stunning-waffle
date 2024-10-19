# Making a database schema

Using schemacralwer - not trivial for a large databases. Unable to map it
directly from my database schema using the --loads-script option for
schmacrawler.

## Database Schema Visualization Workflow

This workflow describes the process of visualizing a SQLite database schema using SchemaCrawler.

### Prerequisites

1. Java Runtime Environment (JRE)
2. SchemaCrawler
3. SQLite
4. Graphviz (for diagram generation)

### Steps

1. Create SQLite Database:

   ```bash
   sqlite3 test_database.sqlite < test_schema.sql
   ```

   This command creates a SQLite database file from your SQL schema.

2. Run SchemaCrawler:

   ```bash
   schemacrawler.sh --server=sqlite --database=test_database.sqlite --info-level=standard --command=schema --output-format=pdf --output-file=test_diagram.pdf
   ```

   This command generates a PDF diagram of your database schema.

3. If the PDF doesn't display properly, try generating a PNG:
   ```bash
   schemacrawler.sh --server=sqlite --database=test_database.sqlite --info-level=standard --command=schema --output-format=png --output-file=test_diagram.png
   ```

4. For a text representation, use:

   ```bash
   schemacrawler.sh --server=sqlite --database=test_database.sqlite --info-level=standard --command=schema --output-format=text --output-file=test_diagram.txt
   ```

### Troubleshooting

- If diagrams aren't generating, ensure Graphviz is installed and properly configured.
- If using the `--load-script` option doesn't work, create the database file first as shown in step 1.
- Check SchemaCrawler's log output for any error messages or warnings.

### Notes

- The `--info-level=standard` option provides a good balance of detail. Use `--info-level=maximum` for more detailed output.
- SchemaCrawler supports various output formats including PDF, PNG, and text.
- The generated diagram includes tables, columns, data types, primary keys, and foreign key relationships.


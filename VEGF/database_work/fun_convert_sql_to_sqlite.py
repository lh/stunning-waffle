


def convert_sql_to_sqlite(input_file, output_file):
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            # Replace nvarchar(MAX) with TEXT
            line = line.replace('nvarchar(MAX)', 'TEXT')
            # Add other conversions if necessary
            outfile.write(line)

    print(f"Conversion to sqlite syntax completed. Output written to {output_file}")

# Example usage
# convert_sql_to_sqlite('output_schema.sql', 'output_schema_sqlite.sql')
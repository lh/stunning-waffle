import csv


def escape_name(name):
    return f'[{name}]'

def get_data_type(data_type, max_length):
    if data_type.lower() in ['int', 'bit', 'datetime', 'datetime2', 'uniqueidentifier']:
        return data_type
    elif data_type == 'varbinary' and max_length == '-1':
        return 'varbinary(max)'
    elif data_type == 'xml':
        return 'xml'
    elif data_type.lower() in ['nvarchar', 'varchar', 'char']:
        return f"{data_type}({max_length if max_length != '-1' else 'MAX'})"
    elif data_type.lower() == 'decimal':
        return f"{data_type}(18, 2)"  # Assuming a default precision and scale
    else:
        return f"{data_type}({max_length})"

def tsv_to_sql(input_file, output_file):
    with open(input_file, 'r') as tsv_file, open(output_file, 'w') as sql_file:
        reader = csv.DictReader(tsv_file, delimiter='\t')
        current_table = None
        columns = []

        for row in reader:
            try:
                if current_table != row['TableName']:
                    if current_table:
                        sql_file.write(f"CREATE TABLE {escape_name(current_table)} (\n")
                        sql_file.write(',\n'.join(columns))
                        sql_file.write('\n);\n\n')
                    current_table = row['TableName']
                    columns = []

                column_def = f"    {escape_name(row['ColumnName'])} {get_data_type(row['DataType'], row['max_length'])}"
                
                if row['is_nullable'] == '0':
                    column_def += " NOT NULL"
                if row['IsPrimaryKey'] == 'YES':
                    column_def += " PRIMARY KEY"
                columns.append(column_def)

            except KeyError as e:
                print(f"Error processing row: {row}. Missing key: {e}")
            except Exception as e:
                print(f"Unexpected error processing row: {row}. Error: {e}")

        if current_table:
            sql_file.write(f"CREATE TABLE {escape_name(current_table)} (\n")
            sql_file.write(',\n'.join(columns))
            sql_file.write('\n);\n')

    print(f"Conversion completed. Output written to {output_file}")

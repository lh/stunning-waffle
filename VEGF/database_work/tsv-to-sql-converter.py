
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# This script converts a TSV file to a SQL file. The TSV is generated from 
# the microsoft sql server export, in response to the query in the file 
# get_schema.sql. The TSV file is expected to have the following columns:
# TableName	ColumnName	DataType	max_length	is_nullable	IsPrimaryKey

from fun_tsv_to_sql import *
from fun_convert_sql_to_sqlite import *

import sys 


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python tsv_to_sql.py <input_tsv> <output_sql>")
        sys.exit(1)
    tsv_to_sql(sys.argv[1], sys.argv[2])
    convert_sql_to_sqlite(sys.argv[2], sys.argv[2].replace('.sql', '_sqlite.sql'))



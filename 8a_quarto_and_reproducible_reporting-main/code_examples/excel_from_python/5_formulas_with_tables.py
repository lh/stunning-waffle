import xlsxwriter
import pandas as pd

hsma_store_items_df = pd.DataFrame([
    {"Item": "HSMA T-Shirts", "Units": 500 , "Unit Cost": 11.99},
    {"Item": "I <3 HSMA Bumper Stickers", "Units": 3000, "Unit Cost": 0.30},
    {"Item": "HSMA Cat Bowls", "Units": 10, "Unit Cost": 15}
    ])

with pd.ExcelWriter("5_formula_with_tables.xlsx", engine="xlsxwriter") as writer:

    hsma_store_items_df.to_excel(writer, sheet_name="HSMA Store",
                                index=False, startrow=1, header=False)

    # Get the xlsxwriter workbook and worksheet objects.
    workbook = writer.book
    worksheet = writer.sheets["HSMA Store"]

    max_row, max_col = hsma_store_items_df.shape
    col_names = hsma_store_items_df.columns.tolist()

    ####################
    # Add in a formula #
    ####################

    # Add the Total column header
    worksheet.write(0, max_col, "Total")

    # Add the formula for each row in the Total column
    for row in range(1, max_row+1):
        formula = f'=B{row+1}*C{row+1}'
        worksheet.write_formula(row, max_col, formula)

    max_col += 1

    col_names.append("Total")

    # Create a list of column headers, to use in add_table().
    column_settings = [
        {"header": column}
        for column
        in col_names]

    # Add the Excel table structure. Pandas will add the data.
    worksheet.add_table(0, 0,
                        max_row,
                        max_col - 1,
                        {"columns": column_settings,
                        'name': 'Stock',
                        'style': 'Table Style Medium 9',
                        'banded_rows': False,
                        'first_column': True
                        })

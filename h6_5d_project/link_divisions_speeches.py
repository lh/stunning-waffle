import pandas as pd
import numpy as np
from datetime import datetime
import logging

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def load_data(file_path):
    try:
        df = pd.read_csv(file_path)
        logging.info(f"Successfully loaded data from {file_path}")
        logging.info(f"Columns in the dataset: {', '.join(df.columns)}")
        return df
    except Exception as e:
        logging.error(f"Error loading data from {file_path}: {e}")
        return None

def preprocess_divisions(df):
    if 'Date' in df.columns:
        df['Date'] = pd.to_datetime(df['Date'])
    else:
        logging.error("'Date' column not found in divisions dataset")
        return None
    if 'Subject' in df.columns:
        df['Subject'] = df['Subject'].fillna('').astype(str).str.lower()
    else:
        logging.error("'Subject' column not found in divisions dataset")
        return None
    return df

def preprocess_debates(df):
    if 'date' not in df.columns:
        logging.error("'date' column not found in debates dataset")
        return None
    
    df['Date'] = pd.to_datetime(df['date'])
    
    if 'text' not in df.columns:
        logging.error("'text' column not found in debates dataset")
        return None
    
    df['Subject'] = df['text'].fillna('').astype(str).str.lower()
    return df

def find_matching_division(debate_row, divisions_df):
    debate_date = debate_row['Date']
    debate_text = debate_row['Subject']
    
    # Look for divisions on the same date
    same_date_divisions = divisions_df[divisions_df['Date'] == debate_date]
    
    if not same_date_divisions.empty:
        # Check for subject similarity
        for _, division in same_date_divisions.iterrows():
            if division['Subject'] and division['Subject'] in debate_text:
                return division
    
    return None

def link_datasets(debates_df, divisions_df):
    linked_data = []
    
    for _, debate in debates_df.iterrows():
        matching_division = find_matching_division(debate, divisions_df)
        
        if matching_division is not None:
            linked_data.append({
                'Date': debate['Date'],
                'Speaker': debate.get('speaker_name', 'Unknown'),
                'Debate_Text': debate['text'],
                'Division_Subject': matching_division['Subject'],
                'Rebels': matching_division.get('Rebels', 'N/A'),
                'Turnout': matching_division.get('Turnout', 'N/A'),
                'Majority': matching_division.get('Majority', 'N/A')
            })
    
    return pd.DataFrame(linked_data)

def main():
    divisions_path = '/Users/rose/HSMA/h6_5d_project/datasets/live_division_data.csv'
    debates_path = '/Users/rose/HSMA/h6_5d_project/datasets/debates_2019_to_date.csv'
    
    divisions_df = load_data(divisions_path)
    debates_df = load_data(debates_path)
    
    if divisions_df is None or debates_df is None:
        return
    
    divisions_df = preprocess_divisions(divisions_df)
    debates_df = preprocess_debates(debates_df)
    
    if divisions_df is None or debates_df is None:
        return
    
    linked_df = link_datasets(debates_df, divisions_df)
    
    output_path = '/Users/rose/HSMA/h6_5d_project/datasets/linked_debates_divisions.csv'
    
    try:
        linked_df.to_csv(output_path, index=False)
        logging.info(f"Linked data successfully saved to {output_path}")
        logging.info(f"Number of rows in the saved file: {len(linked_df)}")
        logging.info(f"Columns in the saved file: {', '.join(linked_df.columns)}")
    except Exception as e:
        logging.error(f"Error saving linked data to CSV: {e}")
    
    logging.info(f"Total debates: {len(debates_df)}")
    logging.info(f"Total divisions: {len(divisions_df)}")
    logging.info(f"Linked entries: {len(linked_df)}")

if __name__ == "__main__":
    main()
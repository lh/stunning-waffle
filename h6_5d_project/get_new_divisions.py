import requests
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime
import logging
import re

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

def parse_date(date_string):
    # Remove non-breaking spaces and extra whitespace
    date_string = re.sub(r'\s+', ' ', date_string.replace('\xa0', ' ').strip())
    try:
        return datetime.strptime(date_string, "%d %b %Y")
    except ValueError as e:
        logging.warning(f"Could not parse date: {date_string}. Error: {e}")
        return None

def scrape_division_data(url):
    logging.info(f"Fetching data from {url}")
    response = requests.get(url)
    if response.status_code != 200:
        logging.error(f"Failed to fetch data. Status code: {response.status_code}")
        return None

    soup = BeautifulSoup(response.text, 'html.parser')
    table = soup.find('table', class_='votes')
    if not table:
        logging.error("Could not find the data table on the page")
        return None

    data = []
    rows = table.find_all('tr')[1:]  # Skip the header row
    for row in rows:
        cols = row.find_all('td')
        if len(cols) >= 6:  # We expect 6 columns now
            date_str = cols[0].text.strip()
            time_str = cols[1].text.strip()
            subject = cols[2].text.strip()
            rebels = cols[3].text.strip()
            turnout = cols[4].text.strip()
            majority = cols[5].text.strip()

            date = parse_date(date_str)
            if date is None:
                continue

            try:
                rebels = int(rebels) if rebels.isdigit() else 0
                turnout = int(turnout) if turnout.isdigit() else 0
                majority = int(majority) if majority.isdigit() else 0
            except ValueError as e:
                logging.warning(f"Error parsing numeric data: {e}. Using default values.")

            data.append({
                'Date': date,
                'Time': time_str,
                'Subject': subject,
                'Rebels': rebels,
                'Turnout': turnout,
                'Majority': majority
            })

    return pd.DataFrame(data)

def main():
    url = "https://www.publicwhip.org.uk/divisions.php?rdisplay=2019&house=commons"
    df = scrape_division_data(url)
    
    if df is not None and not df.empty:
        logging.info(f"Successfully scraped {len(df)} rows of data")
        output_file = 'live_division_data.csv'
        df.to_csv(output_file, index=False)
        logging.info(f"Data saved to {output_file}")
    else:
        logging.error("Failed to scrape data or no data was found")

if __name__ == "__main__":
    main()
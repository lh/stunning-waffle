import requests
from bs4 import BeautifulSoup
import xml.etree.ElementTree as ET
import pandas as pd
from datetime import datetime
import logging
import re
from concurrent.futures import ThreadPoolExecutor, as_completed

# Set up logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# URL containing the list of debate XML files
base_url = "https://www.theyworkforyou.com/pwdata/scrapedxml/debates/"

# Define the date range
start_date = datetime(2019, 1, 1)
end_date = datetime.now()

def extract_date_from_filename(filename):
    match = re.search(r'debates(\d{4}-\d{2}-\d{2})', filename)
    return datetime.strptime(match.group(1), '%Y-%m-%d') if match else None

def get_file_list():
    logging.info(f"Fetching XML file list from {base_url}")
    response = requests.get(base_url)
    soup = BeautifulSoup(response.content, 'html.parser')
    links = soup.find_all('a')
    xml_files = [link.get('href') for link in links if link.get('href', '').endswith('.xml')]
    xml_files.sort(reverse=True)  # Sort in descending order
    logging.info(f"Found {len(xml_files)} XML files")
    return xml_files

def parse_xml(xml_content):
    root = ET.fromstring(xml_content)
    speeches = []
    for speech in root.findall('.//speech'):
        speaker_name = speech.get('speakername', '')
        person_id = speech.get('person_id', '')
        text = ' '.join([p.text for p in speech.findall('.//p') if p.text])
        speeches.append({
            'speaker_name': speaker_name,
            'person_id': person_id,
            'text': text
        })
    return speeches

def process_file(file_name):
    debate_date = extract_date_from_filename(file_name)
    if debate_date is None or debate_date < start_date:
        return None
    if debate_date > end_date:
        return 'STOP'
    
    url = base_url + file_name
    response = requests.get(url)
    if response.status_code == 200:
        speeches = parse_xml(response.content)
        return {'date': debate_date, 'speeches': speeches}
    else:
        logging.error(f"Failed to download {file_name}. Status code: {response.status_code}")
        return None

def main():
    xml_files = get_file_list()
    data = []

    with ThreadPoolExecutor(max_workers=10) as executor:
        future_to_file = {executor.submit(process_file, file_name): file_name for file_name in xml_files}
        for future in as_completed(future_to_file):
            file_name = future_to_file[future]
            try:
                result = future.result()
                if result == 'STOP':
                    logging.info(f"Reached file {file_name} which is before the start date. Stopping.")
                    break
                if result:
                    logging.info(f"Processed {file_name}")
                    for speech in result['speeches']:
                        speech['date'] = result['date']
                        data.append(speech)
            except Exception as exc:
                logging.error(f"{file_name} generated an exception: {exc}")

    df = pd.DataFrame(data)
    logging.info(f"Data extraction complete. Total entries: {len(df)}")

    output_file = 'debates_2019_to_date.csv'
    df.to_csv(output_file, index=False)
    logging.info(f"Data saved to {output_file}")

if __name__ == "__main__":
    main()
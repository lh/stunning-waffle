import streamlit as st
import logging
from datetime import datetime
from wordcloud import WordCloud, STOPWORDS
import matplotlib.pyplot as plt
from docx import Document
import fitz  # PyMuPDF
import string

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

def make_wordcloud(text, filename):
    stopwords = set(STOPWORDS)
    tokens = text.split()
    punctuation_mapping_table = str.maketrans('', '', string.punctuation)
    tokens_stripped_of_punctuation = [token.translate(punctuation_mapping_table)
                                      for token in tokens]
    lower_tokens = [token.lower() for token in tokens_stripped_of_punctuation]

    joined_string = (" ").join(lower_tokens)

    wordcloud = WordCloud(width=1800,
                          height=1800,
                          stopwords=stopwords,
                          min_font_size=20).generate(joined_string)

    plt.figure(figsize=(30,40))
    plt.axis("off")
    plt.imshow(wordcloud)
    plt.savefig(filename)

def read_docx(file):
    doc = Document(file)
    full_text = []
    for para in doc.paragraphs:
        full_text.append(para.text)
    return '\n'.join(full_text)

def read_pdf(file):
    pdf_document = fitz.open(stream=file.read(), filetype="pdf")
    full_text = []
    for page_num in range(len(pdf_document)):
        page = pdf_document.load_page(page_num)
        full_text.append(page.get_text())
    return '\n'.join(full_text)

st.title("Wordcloud Generator")

text_input = st.text_area("Enter some text:")
if st.button("Generate Wordcloud"):
    current_date = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    filename = f"{current_date}_wordcloud.png"
    make_wordcloud(text_input, filename)
    st.image(filename)

uploaded_file = st.file_uploader("Or upload a text file:", type=["txt", "docx", "pdf"])

if uploaded_file is not None:
    file_type = uploaded_file.type
    logger.debug(f"Uploaded file type: {file_type}")
    try:
        if file_type == "text/plain":
            text = uploaded_file.read().decode("utf-8")
        elif file_type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
            text = read_docx(uploaded_file)
        elif file_type == "application/pdf":
            text = read_pdf(uploaded_file)
        else:
            st.error("Unsupported file type")
            logger.error("Unsupported file type")
            text = None

        if text:
            current_date = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
            filename = f"{current_date}-wordcloud.png"
            make_wordcloud(text, filename)
            st.image(filename)

            with open(filename, "rb") as img:
                btn = st.download_button(
                    label="Download image",
                    data=img,
                    file_name=filename,
                    mime="image/png"
                )
    except Exception as e:
        st.error("An error occurred while processing the file.")
        logger.error(f"Error processing file: {e}")
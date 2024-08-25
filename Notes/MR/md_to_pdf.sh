#!/bin/bash

# Input Markdown file
input_file="$1"

# Output PDF file
output_file="${input_file%.md}.pdf"

# Temporary LaTeX file
temp_tex="${input_file%.md}.tex"

# Convert Markdown to LaTeX
pandoc "$input_file" -f markdown -t latex --template=template.tex -o "$temp_tex"

# Replace Mermaid code blocks with mermaid environments
sed -i 's/\\begin{verbatim}/\\begin{mermaid}/g; s/\\end{verbatim}/\\end{mermaid}/g' "$temp_tex"

# Convert LaTeX to PDF
pdflatex "$temp_tex"

# Clean up temporary files
rm "${temp_tex%.tex}.aux" "${temp_tex%.tex}.log" "$temp_tex"

echo "Conversion complete. Output file: $output_file"
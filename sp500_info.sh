#!/bin/bash
# ============================================================
# sp500_info.sh
# Fetches S&P 500 constituents CSV and displays
# Company Name, Location, and Founding Year — sorted by year.
# ============================================================

CSV_URL="https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv"

# Download CSV, parse with proper CSV handling, sort by founding year
curl -sL "$CSV_URL" \
  | python3 -c "
import csv, sys

reader = csv.reader(sys.stdin)
header = next(reader)  # skip header

rows = []
for row in reader:
    if len(row) < 8:
        continue
    name = row[1].strip()
    location = row[4].strip()
    founded = row[7].strip()
    # Extract first 4-digit year
    import re
    m = re.search(r'\d{4}', founded)
    if m:
        year = m.group()
        rows.append((int(year), name, location))

rows.sort(key=lambda x: x[0])

print(f\"{'COMPANY NAME':<50} {'LOCATION':<45} {'FOUNDED'}\")
print(f\"{'-'*50} {'-'*45} {'-'*7}\")
for year, name, loc in rows:
    print(f'{name:<50} {loc:<45} {year}')
"

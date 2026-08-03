"""
sp500_info.py
Fetches S&P 500 constituents CSV and displays
Company Name, Location, and Founding Year — sorted by year.
"""

import csv
import re
import urllib.request

CSV_URL = "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv"

def main():
    response = urllib.request.urlopen(CSV_URL)
    data = response.read().decode("utf-8").splitlines()

    reader = csv.reader(data)
    next(reader)  # skip header

    rows = []
    for row in reader:
        if len(row) < 8:
            continue
        name = row[1].strip()
        location = row[4].strip()
        founded = row[7].strip()

        match = re.search(r"\d{4}", founded)
        if match:
            year = int(match.group())
            rows.append((year, name, location))

    rows.sort(key=lambda x: x[0])

    print(f"{'COMPANY NAME':<50} {'LOCATION':<45} {'FOUNDED'}")
    print(f"{'-'*50} {'-'*45} {'-'*7}")
    for year, name, loc in rows:
        print(f"{name:<50} {loc:<45} {year}")

if __name__ == "__main__":
    main()

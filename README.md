# S&P 500 CSV Scraper

A lightweight script that fetches the [S&P 500 constituents CSV](https://github.com/datasets/s-and-p-500-companies) and displays **Company Name**, **Headquarters Location**, and **Founding Year** — sorted by year.

## Quick Start

```bash
python sp500_info.py
```

## Sample Output

```
COMPANY NAME                                       LOCATION                                      FOUNDED
-------------------------------------------------- --------------------------------------------- -------
Bank of New York Mellon                            New York City, New York                       1784
Colgate-Palmolive                                  New York City, New York                       1806
Citigroup                                          New York City, New York                       1812
...
Tesla, Inc.                                        Austin, Texas                                 2003
Meta Platforms                                     Menlo Park, California                        2004
GE Vernova                                         Cambridge, Massachusetts                      2024
```

## Requirements

- **Python 3.6+** (uses only the standard library — no pip installs needed)

## How It Works

1. Downloads the CSV from GitHub using `urllib`
2. Parses it with Python's `csv` module (handles quoted fields correctly)
3. Extracts the founding year via regex
4. Sorts all entries ascending by year and prints a formatted table

## License

MIT

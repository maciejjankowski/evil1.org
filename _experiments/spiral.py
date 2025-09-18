import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import io
import requests

# Download Excel file from IMF URL
url = 'https://www.imf.org/external/datamapper/export/excel.php?indicator=DEBT1'
response = requests.get(url)
excel_data = response.content

# Load the Excel data into a DataFrame
df = pd.read_excel(io.BytesIO(excel_data), sheet_name=0)

# Inspect the data structure to confirm layout
print(df.head())
print(df.columns[:20])

# Assuming years start from column index 1, country in first column, and data are debt values
# Filter numeric year columns from header (non-year columns may exist)
year_cols = [col for col in df.columns if isinstance(col, int)]
df_years = df[year_cols].apply(pd.to_numeric, errors='coerce')

# Sum across all countries for each year to get estimated total debt % (rough proxy)
total_debt_by_year = df_years.sum()

# Convert years to sorted numpy array
years = np.array(total_debt_by_year.index)
debt_percent_sum = total_debt_by_year.values

# Convert years to angles in radians for radial plot
angles = 2 * np.pi * (years - years.min()) / (years.max() - years.min())

# Plot radial graph
fig, ax = plt.subplots(figsize=(8,8), subplot_kw={'projection':'polar'})
ax.plot(angles, debt_percent_sum, linewidth=2, marker='o')
ax.set_theta_zero_location('N')
ax.set_theta_direction(-1)

# Adjust ticks to show years every 5 years for clarity
tick_years = years[::5]
tick_angles = angles[::5]
ax.set_xticks(tick_angles)
ax.set_xticklabels(tick_years, fontsize=8)

ax.set_title('Estimated Total Global Debt (% of GDP) by Year (Sum of Countries)', y=1.08)
plt.show()


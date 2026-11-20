
# ==========================================
# HR EMPLOYEE ATTRITION ANALYSIS
# Dataset: IBM HR Analytics
# Run using: python analysis.py
# ==========================================

import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# 1. Set dataset path
BASE_DIR = Path(__file__).resolve().parent
FILE_PATH = BASE_DIR.parent / "excel" / "HR_Employee_Attrition_Analysis.xlsx"

# Create folder to save charts
CHART_DIR = BASE_DIR / "charts"
CHART_DIR.mkdir(exist_ok=True)

# 2. Load cleaned dataset from Excel
df = pd.read_excel(FILE_PATH, sheet_name="Clean_Data")

print("\n========== HR EMPLOYEE ATTRITION ANALYSIS ==========\n")

# 3. Basic dataset information
print("Dataset Shape:", df.shape)

print("\nFirst 5 Employee Records:")
print(df.head())

print("\nMissing Values:")
print(df.isnull().sum().sum())

# 4. Calculate important KPIs
total_employees = len(df)

employees_left = (df["Attrition"] == "Yes").sum()

employees_stayed = (df["Attrition"] == "No").sum()

attrition_rate = (employees_left / total_employees) * 100

average_age = df["Age"].mean()

average_income = df["Monthly_Income"].mean()

print("\n========== KEY PERFORMANCE INDICATORS ==========")

print("Total Employees:", total_employees)
print("Employees Left:", employees_left)
print("Employees Stayed:", employees_stayed)
print("Attrition Rate:", round(attrition_rate, 2), "%")
print("Average Age:", round(average_age, 2))
print("Average Monthly Income:", round(average_income, 2))

# 5. Attrition by Department
dept = df.groupby("Department")["Attrition"].apply(
    lambda x: (x == "Yes").mean() * 100
)

plt.figure(figsize=(8, 5))
dept.plot(kind="bar", title="Attrition Rate by Department")
plt.ylabel("Attrition Rate (%)")
plt.xlabel("Department")
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig(CHART_DIR / "department_attrition.png")
plt.show()

# 6. Attrition by Overtime
overtime = df.groupby("OverTime")["Attrition"].apply(
    lambda x: (x == "Yes").mean() * 100
)

plt.figure(figsize=(7, 5))
overtime.plot(kind="bar", title="Attrition Rate by Overtime")
plt.ylabel("Attrition Rate (%)")
plt.xlabel("Overtime")
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig(CHART_DIR / "overtime_attrition.png")
plt.show()

# 7. Attrition by Job Role
role = df.groupby("Job_Role")["Attrition"].apply(
    lambda x: (x == "Yes").mean() * 100
).sort_values()

plt.figure(figsize=(10, 6))
role.plot(kind="barh", title="Attrition Rate by Job Role")
plt.xlabel("Attrition Rate (%)")
plt.ylabel("Job Role")
plt.tight_layout()
plt.savefig(CHART_DIR / "jobrole_attrition.png")
plt.show()

# 8. Attrition by Age Group
age = df.groupby("Age_Group")["Attrition"].apply(
    lambda x: (x == "Yes").sum()
)

plt.figure(figsize=(8, 5))
age.plot(kind="bar", title="Employees Left by Age Group")
plt.ylabel("Employees Left")
plt.xlabel("Age Group")
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig(CHART_DIR / "age_attrition.png")
plt.show()

# 9. Attrition by Gender
gender = df.groupby("Gender")["Attrition"].apply(
    lambda x: (x == "Yes").sum()
)

plt.figure(figsize=(7, 5))
gender.plot(kind="bar", title="Employee Attrition by Gender")
plt.ylabel("Employees Left")
plt.xlabel("Gender")
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig(CHART_DIR / "gender_attrition.png")
plt.show()

# 10. Display employee records
print("\n========== EMPLOYEE DATA ==========")
print(df[["Age", "Gender", "Department",
          "Job_Role", "Monthly_Income",
          "OverTime", "Attrition"]].head(20))

# 11. Export employee data
df.to_csv(BASE_DIR / "HR_Attrition_Results.csv", index=False)

print("\nAnalysis Completed Successfully!")
print("Charts saved inside the charts folder.")
print("CSV report exported successfully.")

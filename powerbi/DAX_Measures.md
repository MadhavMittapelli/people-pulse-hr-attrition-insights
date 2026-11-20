# DAX Measures – HR Employee Attrition Analysis

**Power BI table:** `HR-EmployeeAttrition`

These measures use the table and field names referenced by the uploaded PBIX report. Create them from **Modeling → New measure**. If your Power BI model uses a different spelling or capitalization for a field, select the matching field from the Fields pane.

## 1. Core KPI measures

```dax
Total Employees =
DISTINCTCOUNT('HR-EmployeeAttrition'[EmployeeNumber])
```

```dax
Employees Left =
CALCULATE(
    [Total Employees],
    'HR-EmployeeAttrition'[Attrition] = "Yes"
)
```

```dax
Active Employees =
CALCULATE(
    [Total Employees],
    'HR-EmployeeAttrition'[Attrition] = "No"
)
```

```dax
Attrition Rate =
DIVIDE(
    [Employees Left],
    [Total Employees],
    0
)
```

Format **Attrition Rate** as Percentage with 2 decimal places.

```dax
Retention Rate =
DIVIDE(
    [Active Employees],
    [Total Employees],
    0
)
```

Format **Retention Rate** as Percentage with 2 decimal places.

```dax
Average Age =
AVERAGE('HR-EmployeeAttrition'[Age])
```

```dax
Average Monthly Income =
AVERAGE('HR-EmployeeAttrition'[MonthlyIncome])
```

## 2. Additional workforce measures

```dax
Average Years at Company =
AVERAGE('HR-EmployeeAttrition'[YearsAtCompany])
```

```dax
Average Years in Current Role =
AVERAGE('HR-EmployeeAttrition'[YearsInCurrentRole])
```

```dax
Average Job Satisfaction =
AVERAGE('HR-EmployeeAttrition'[JobSatisfaction])
```

```dax
Overtime Employees =
CALCULATE(
    [Total Employees],
    'HR-EmployeeAttrition'[OverTime] = "Yes"
)
```

```dax
Overtime Attrition =
CALCULATE(
    [Employees Left],
    'HR-EmployeeAttrition'[OverTime] = "Yes"
)
```

```dax
Overtime Attrition Rate =
DIVIDE(
    [Overtime Attrition],
    [Overtime Employees],
    0
)
```

## 3. Comparison and risk-analysis measures

```dax
Attrition Rate - No Overtime =
CALCULATE(
    [Attrition Rate],
    'HR-EmployeeAttrition'[OverTime] = "No"
)
```

```dax
Attrition Rate - Overtime =
CALCULATE(
    [Attrition Rate],
    'HR-EmployeeAttrition'[OverTime] = "Yes"
)
```

```dax
Attrition Rate Difference =
[Attrition Rate - Overtime] - [Attrition Rate - No Overtime]
```

```dax
Employees Left - Previous Filter Context =
CALCULATE(
    [Employees Left],
    ALL('HR-EmployeeAttrition'[Department])
)
```

The last measure removes only the Department filter; other slicers remain active.

## 4. Calculated columns used for grouping

Only create these if the corresponding columns do not already exist in the model. The uploaded report already references **Age Group** and **Income Band**.

### Age Group

```dax
Age Group =
SWITCH(
    TRUE(),
    'HR-EmployeeAttrition'[Age] < 25, "Under 25",
    'HR-EmployeeAttrition'[Age] < 35, "25–34",
    'HR-EmployeeAttrition'[Age] < 45, "35–44",
    'HR-EmployeeAttrition'[Age] < 55, "45–54",
    "55+"
)
```

### Income Band

```dax
Income Band =
SWITCH(
    TRUE(),
    'HR-EmployeeAttrition'[MonthlyIncome] < 3000, "Below 3K",
    'HR-EmployeeAttrition'[MonthlyIncome] < 6000, "3K–5.9K",
    'HR-EmployeeAttrition'[MonthlyIncome] < 9000, "6K–8.9K",
    "9K+"
)
```

## 5. Suggested visual mapping

| Dashboard visual | Measure / field |
|---|---|
| Total Employees card | `[Total Employees]` |
| Employees Left card | `[Employees Left]` |
| Active Employees card | `[Active Employees]` |
| Attrition Rate card | `[Attrition Rate]` |
| Average Age card | `[Average Age]` |
| Average Monthly Income card | `[Average Monthly Income]` |
| Department chart | Department + `[Employees Left]` |
| Job role chart | JobRole + `[Employees Left]` |
| Gender donut | Gender + `[Employees Left]` |
| Income band donut | Income Band + `[Employees Left]` |
| Overtime chart | OverTime + `[Employees Left]` |
| Education chart | EducationField + `[Employees Left]` |
| Work-life balance chart | WorkLifeBalance + `[Employees Left]` |
| Age group chart | Age Group + `[Employees Left]` |

## 6. Important validation notes

- Use `EmployeeNumber` as the employee identifier; it is appropriate for a distinct employee count.
- `Attrition` is expected to contain `"Yes"` and `"No"` values, as used by the report.
- The measures above respect report filters unless a measure explicitly changes filter context.
- Check the exact field names in the Power BI Fields pane before pasting formulas.
- Do not create duplicate measures if the PBIX already contains measures with the same names.

# HR Employee Attrition Analysis

## 1. Project Overview

This Power BI project analyzes employee attrition using the **HR-EmployeeAttrition** dataset. The report is designed to help HR teams understand workforce exits and explore how attrition varies across departments, job roles, gender, income bands, overtime, education fields, work-life balance, and age groups.

The dashboard includes six KPI cards, interactive slicers, and multiple charts. Its purpose is to support evidence-based workforce monitoring and help HR teams identify areas that may need further investigation.

## 2. Business Problem

Employee attrition can increase recruitment and onboarding costs, interrupt team productivity, and result in the loss of organizational knowledge. HR teams need a clear view of how many employees leave and how attrition differs across workforce segments.

The business questions addressed by this report are:

- What is the overall employee count and attrition rate?
- How many employees have left and how many remain active?
- Which departments and job roles show higher employee exits?
- How does attrition vary by gender and income band?
- Is attrition different for employees working overtime?
- How do education field, age group, and work-life balance relate to employee exits?

## 3. Dashboard KPIs

The report contains the following six KPI cards:

| KPI | Business meaning |
|---|---|
| Total Employees | Distinct count of employees in the selected filter context |
| Employees Left | Employees whose Attrition value is Yes |
| Active Employees | Employees whose Attrition value is No |
| Attrition Rate | Employees left divided by total employees |
| Average Age | Average employee age |
| Average Monthly Income | Average monthly income of employees in the selected context |

**Calculation:** Attrition Rate = Employees Left ÷ Total Employees.

KPI values change when report slicers are applied.

## 4. Dashboard Analysis Areas

### Department and Job Role

The department and job-role charts compare employee exits across organizational groups. HR can use these views to identify teams that warrant a closer review of workload, management practices, career opportunities, or role expectations.

### Gender and Income Band

The gender and income-band visuals show how employee exits are distributed across these groups. Distribution counts should be interpreted alongside each group's employee population; a larger count alone does not necessarily mean a higher attrition rate.

### Overtime

The overtime visual allows HR to compare employee exits for employees marked as working overtime and those not marked as working overtime. This can help prioritize further analysis of workload and scheduling.

### Education Field

The education-field chart compares exits across employee education backgrounds. It can help HR explore whether retention patterns differ among professional or educational groups.

### Work-Life Balance

The work-life-balance visual provides a segment-level view of employee exits. It can support follow-up analysis of workload, flexibility, and employee experience.

### Age Group

The age-group chart compares employee exits across age segments. It can help HR explore whether retention needs differ at different career stages.

## 5. Interactive Filters

The dashboard provides five slicers:

- Department
- Gender
- Job Role
- Overtime
- Education Field

Use the slicers to investigate individual workforce segments or combinations of filters. KPI cards and visuals should be read in the context of the active filters.

## 6. Key Business Insights

The report structure supports the following analysis, but exact segment rankings and rates should be confirmed from the live PBIX visuals after applying the required filters:

1. **Department-level variation:** Compare attrition across departments to identify where HR follow-up may be most useful.
2. **Role-level variation:** Examine job roles separately because employee experience and work requirements can differ by role.
3. **Overtime relationship:** Compare the attrition rate for overtime and non-overtime groups rather than relying only on exit counts.
4. **Income segmentation:** Review attrition by income band while considering the number of employees in each band.
5. **Employee experience:** Review work-life balance and other workforce dimensions as potential areas for further investigation.

These are investigation prompts, not proof that any factor causes employees to leave.

## 7. Recommendations

- Review departments and job roles with comparatively high attrition rates.
- Compare overtime and non-overtime attrition rates and investigate workload patterns where differences appear.
- Combine employee exit analysis with engagement surveys, exit-interview feedback, and manager-level context.
- Review career development, compensation competitiveness, and internal mobility as possible retention topics.
- Monitor the dashboard regularly and compare results across consistent reporting periods.
- Avoid making decisions about individuals based only on group-level patterns.

## 8. Limitations and Interpretation

- The report is descriptive: it shows patterns and associations, not causal relationships.
- Segment counts can be misleading when group sizes differ; use rates as well as counts.
- The dashboard fields shown in the PBIX do not, by themselves, establish why an employee left.
- Validate data completeness, field definitions, and category labels before presenting results to management.
- The supplied PBIX does not provide a verified narrative of causes; additional HR research is required before making causal claims.

## 9. Conclusion

The HR Employee Attrition Analysis dashboard provides an interactive view of employee exits across key workforce dimensions. By combining headline KPIs with department, job-role, overtime, income, education, age, gender, and work-life-balance analysis, the report helps HR teams identify where deeper investigation may be valuable and supports more informed retention planning.

## 10. Tools Used

- Microsoft Power BI
- Power Query (for data preparation, where applied)
- DAX (for measures and KPI calculations)
- HR-EmployeeAttrition dataset referenced by the report

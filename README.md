<div align="center">

# 📊 Data Analysis — Practical Exam (Set C)

### 🚀 Department, Course & Batch Performance Analysis Across SQL, Python, Excel & Power BI

<img src="https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python">
<img src="https://img.shields.io/badge/Jupyter-Notebook-orange?style=for-the-badge&logo=jupyter">
<img src="https://img.shields.io/badge/Pandas-Data%20Cleaning-purple?style=for-the-badge&logo=pandas">
<img src="https://img.shields.io/badge/SQL-Joins%20%26%20Aggregates-lightgrey?style=for-the-badge&logo=mysql">
<img src="https://img.shields.io/badge/Excel-Pivot%20%26%20Summary-green?style=for-the-badge&logo=microsoftexcel">
<img src="https://img.shields.io/badge/Power%20BI-Dashboard-yellow?style=for-the-badge&logo=powerbi">

---

A cross-tool data analysis project that cleans, merges, and analyzes student assessment
data using **SQL**, **Python**, **Excel**, and **Power BI**, and reconciles the results
across all four.

⭐ *"Quality is our Motto." — Red & White Skill Education, Practical Exam, Data Analysis (Set C)*

</div>

---

## 👤 Project Title, Student & Set

| | |
|---|---|
| **Project Title** | Student Assessment Performance Analysis |
| **Student Name** | Darshil Kotadiya |
| **Student ID** | _10311_ |
| **Assigned Set** | **Set C** |
| **Institution** | Red & White Skill Education |

---

## 🎯 Business Objective & Questions

**Objective:** Identify where student performance is weakest across departments,
courses, and batches so that support can be targeted effectively.

**Business Questions Answered:**
1. Which departments and courses are underperforming, and what are their average
   scores and pass rates?
2. Which batches (sessions) perform best, and how has the average score trended
   month over month (Jan–Mar)?

---

## 📈 Project Workflow

```text
Start
   │
   ▼
Raw Data (assessments.csv + courses.csv)
   │
   ▼
Data Cleaning
   │  • Check data types
   │  • Remove duplicate rows
   │  • Left-join assessments ↔ courses
   │  • Check for unmatched departments
   ▼
Derive pass_flag (score >= 50)
   │
   ├──────────────┬──────────────┬──────────────┐
   ▼              ▼              ▼              ▼
 SQL           Python          Excel         Power BI
(setup.sql +  (main.ipynb)   (Raw → Clean   (Power_BI.pbix
 Queries_.sql)                → Summary)     dashboard)
   │              │              │              │
   ▼              ▼              ▼              ▼
S2_A_ / S2_B_  clean_data.csv  Summary sheet  Refreshed
S2_C_ outputs  python_summary   KPIs/pivots    visuals
               .csv + chart
   │              │              │              │
   └──────────────┴──────────────┴──────────────┘
                        │
                        ▼
            Cross-Tool Reconciliation
         (compare dept/course averages
            across all four tools)
                        │
                        ▼
            Findings & Recommendation
                        │
                        ▼
                       End
```

---

## 📁 Project Folder Structure

```
Data-Analysis-Set-C/
│
├── README.md                   # This file
│
├── setup.sql                   # Creates & seeds `assessments` and `courses` tables
├── Queries_.sql                 # SQL analysis: S2a, S2b, S2c, S3 diagnostic
├── S2_A_.csv                    # SQL output → avg score by department
├── S2_B_                        # SQL output → underperforming courses (avg < 60)
├── S2_C_                        # SQL output → top 2 batches by avg score
│
├── assessments.csv              # Raw dataset — assessment-level records
├── courses.csv                  # Raw dataset — course lookup
├── main.ipynb                   # Python notebook: load, clean, merge, analyze, chart
├── clean_data.csv               # Python output — cleaned & merged dataset
├── python_summary.csv           # Python output — department pass-rate summary
├── python_chart.png             # Python output — monthly average score bar chart
│
├── Mock_Practical_Excel.xlsx    # Excel workbook (Raw, Lookup, Clean, Summary sheets)
└── Power_BI.pbix                # Power BI report & dashboard
```

---

## 📂 Dataset Filenames & Data Dictionary

### `assessments.csv` (raw)
| Column | Type | Meaning |
|---|---|---|
| assessment_id | Integer | Unique ID for each assessment record |
| month | Text | Month of the assessment (Jan / Feb / Mar) |
| course_id | Text | Foreign key → `courses.csv` (C1–C4) |
| batch | Text | Session: Morning, Evening, or Weekend |
| score | Integer | Marks scored (out of 100) |
| attendance_pct | Integer | Attendance percentage for that assessment |

### `courses.csv` (raw)
| Column | Type | Meaning |
|---|---|---|
| course_id | Text | Unique course code (C1–C4) |
| course | Text | Course name (Excel, PowerBI, SQL, Python) |
| department | Text | Department the course belongs to (Business / Technology) |

### `clean_data.csv` (Python output — merged & cleaned)
| Column | Type | Meaning |
|---|---|---|
| assessment_id, month, course_id, batch, score, attendance_pct | — | Same as `assessments.csv` |
| course, department | Text | Joined in from `courses.csv` |
| pass_flag | Integer (0/1) | `1` if `score >= 50`, else `0` |

### `python_summary.csv` (Python output)
| Column | Type | Meaning |
|---|---|---|
| department | Text | Department name |
| total_assessments | Integer | Count of assessments in that department |
| passing_count | Integer | Count of records with `pass_flag = 1` |
| pass_rate | Float | `passing_count / total_assessments * 100` |

### `S2_A_.csv` (SQL output)
| Column | Type | Meaning |
|---|---|---|
| department | Text | Department name |
| avg_score | Float | Average score (`marks1`) across all assessments in the department |

### `S2_B_` (SQL output)
| Column | Type | Meaning |
|---|---|---|
| course | Text | Course name |
| avg_score | Float | Average score for the course (only courses averaging < 60) |

### `S2_C_` (SQL output)
| Column | Type | Meaning |
|---|---|---|
| batch | Text | Batch/session name |
| avg_score | Float | Average score for the batch — top 2 shown |

---

## 🧹 Cleaning Steps & Metric Definitions

**Cleaning steps** (applied in `main.ipynb`, mirrored in the Excel `Clean` sheet and SQL):
1. Loaded `assessments.csv` and `courses.csv`.
2. Confirmed `score` and `attendance_pct` were numeric data types.
3. Removed exact duplicate rows from `assessments` (`drop_duplicates()`).
4. Left-joined `assessments` with `courses` on `course_id` to bring in `course` and
   `department`, checking for any unmatched (null) departments after the join.
5. Derived `pass_flag` on the cleaned, merged data.

**Metric definitions:**
- **`pass_flag` rule:** `pass_flag = 1` if `score >= 50`, else `0`.
- **Pass rate formula:** `pass_rate = (passing_count / total_assessments) * 100`.
- **Average score:** mean of `score` (SQL: `marks1`), grouped by department, course, or
  batch as needed.

---

## 🛠 Tools & Versions Used

| Tool | Version |
|---|---|
| Excel | Microsoft Excel (.xlsx) |
| Power BI | Power BI Desktop (.pbix) |
| SQL Engine | _\<name your engine, e.g. MySQL 8.0 / PostgreSQL 15 / SQLite 3>_ |
| Python | _\<e.g. 3.11>_ |
| Python packages | pandas _\<version>_, numpy _\<version>_, matplotlib _\<version>_ |

> Run `python --version` and `pip freeze | grep -E "pandas|numpy|matplotlib"` in your
> environment and fill in the exact versions above.

---

## 🗄 SQL Setup & Query Execution Steps

1. Open your SQL engine's client / CLI.
2. Run **`setup.sql`** first — creates the `assessments` and `courses` tables and
   inserts the seed data.
3. Run **`Queries_.sql`**, which executes:
   - **S2a** — average score by department → `S2_A_.csv`
   - **S2b** — underperforming courses, avg score < 60 → `S2_B_`
   - **S2c** — top 2 batches by average score → `S2_C_`
   - **S3** — diagnostic check for any `course_id` with no matching `assessments` record
4. Export each result set to its corresponding CSV file listed above.

---

## 🐍 Python Environment Setup & Run Instructions

```bash
pip install -r requirements.txt
python -m jupyter nbconvert --to notebook --execute main.ipynb
# or open main.ipynb and run all cells directly
```

Running `main.ipynb` will:
- Load and clean `assessments.csv` + `courses.csv`
- Merge the datasets and derive `pass_flag`
- Compute department and course pass-rate summaries
- Generate the monthly average score bar chart (`outputs/python_chart.png`)
- Export `outputs/clean_data.csv` and `outputs/python_summary.csv`

> No `requirements.txt` yet? Generate one with:
> `pip freeze | grep -E "pandas|numpy|matplotlib" > requirements.txt`

---

## 📗 Excel Sheet Guide (`Mock_Practical_Excel.xlsx`)

| Sheet | Purpose |
|---|---|
| **Raw** | Original, unedited assessment data as provided |
| **Lookup** | Course-to-department lookup table |
| **Sheet3** | Working / scratch calculations |
| **Clean** | Cleaned and merged data (course, department, pass_flag added) |
| **Summary sheet** | Final pivot tables and KPIs used in the write-up |

---

## ⚡ Power BI Data-Source Refresh Instructions

1. Open `Power_BI.pbix` in Power BI Desktop.
2. Go to **Home → Transform data → Data source settings**.
3. Select the CSV data source and click **Change Source**.
4. Browse to the cloned repository's local path for `assessments.csv` / `clean_data.csv`
   and update the file path.
5. Click **Apply**, then **Home → Refresh** to reload the report with the new path.

---

## 📊 Findings & Recommendation

**Finding 1 — Department gap:** Technology averages **56** with a **50% pass rate**,
well below Business at **67** average and an **83.3% pass rate**.

**Finding 2 — Weakest course:** Python has the lowest pass rate of all four courses at
**33.3%** (1 of 3 passing), compared to Excel (100%), PowerBI (66.7%), and SQL (66.7%).

**Recommendation:** Prioritize additional instructional support and practice
assessments for the Python course — it is both the weakest individual course and part
of the lower-performing Technology department, so improving it would lift the
department average the most.

---

## 🔗 Cross-Tool Reconciliation

The department-level average score was confirmed consistent across all four tools:

| Tool | Business avg | Technology avg |
|---|---|---|
| SQL (`S2_A_.csv`) | 67.00 | 56.00 |
| Python (`main.ipynb` / `clean_data.csv`) | 67.00 | 56.00 |
| Excel (Summary sheet) | 67.00 | 56.00 |
| Power BI (dashboard card) | 67.00 | 56.00 |

**Rounding note:** SQL returns extended decimal places (e.g. `67.0000000000000000`);
all tools were rounded to 2 decimal places for reporting, with no discrepancy after
rounding.

---

## 🎥 Working Video

- **Video URL:** _https://drive.google.com/file/d/1kksZlB4tGKkg-doE_lHrawP4KPQcIxjU/view?usp=sharing_

This video covers:
- Project overview & business objective
- Dataset & cleaning walkthrough
- SQL, Python, Excel, and Power BI results
- Cross-tool reconciliation and final recommendation

---

## 📚 References

_\<List any external code, tutorials, or resources used, or write "None" if all work is original.>_

---

## ✍️ Authorship Declaration

> All work in this repository is my own except where cited.

**Signed:** Darshil Kotadiya

<div align="center">

---

## ⭐ Thank You for Reviewing This Project ⭐

</div>

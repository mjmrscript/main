# Python pandas Cheat Sheet

It involves the analysis and manipulation of tabular data.

# 📑 Table of Contents

## فهرست مطالب

1. [Introduction | مقدمه](#introduction)
2. [Install pandas | نصب pandas](#install-pandas)
3. [Use library | استفاده از کتابخانه](#use-library)
4. [Series | سری](#series)
5. [DataFrame | دیتافریم](#dataframe)
6. [Read and Write | خواندن و نوشتن فایل](#read-and-write)
7. [Overview of Information | نمای کلی اطلاعات](#overview-of-information)
8. [Choose Data | انتخاب داده](#choose-data)
9. [Sort | مرتب‌سازی](#sort)
10. [Merging DataFrames | ادغام دیتافریم‌ها](#merging-dataframes)
11. [Pivot Table | جدول محوری](#pivot-table)
12. [Work with String | کار با رشته‌ها](#work-with-string)
13. [Transfer Data Type | تبدیل نوع داده](#transfer-data-type)
14. [Delete Duplicate | حذف داده‌های تکراری](#delete-duplicate)
15. [Examples | مثال‌ها](#example)

---

## Introduction

```bash
#Checking if Python is installed
python3 --version

#Checking if pip is installed
python3 -m pip --version

#if not installed
sudo apt install python3-pip

#create project
mkdir myproject
cd myproject
python3 -m venv .venv
source .venv/bin/activate
```
> for exit from venv `deactivate`

## install pandas

```bash
#without venv
python -m pip install pandas
#with venv
pip install pandas
```

## Use library

```python
import pandas as pd
```

---
---

## series

show structur like CSV

```python
import pandas as pd
import numpy as np

s = pd.Series([10, 20, 30, 40])
print(s)
# 0    10
# 1    20
# 2    30
# 3    40

s2 = pd.Series({'x': 100, 'y': 200, 'z': 300})
print(s2)
# x    100
# y    200
# z    300

s3 = pd.Series([1, 2, 3], index=['a', 'b', 'c'])
print(s3['b'])
# 2
```

---

## dataframe

show structur like CSV

```python
data = {
    'name': ['Ali', 'Sara', 'Reza'],
    'age': [25, 30, 22],
    'city': ['Tehran', 'Shiraz', 'Isfahan']
}

df = pd.DataFrame(data)
print(df)
#    name  age     city
# 0   Ali   25   Tehran
# 1  Sara   30   Shiraz
# 2  Reza   22  Isfahan
```

---

## read and write

Reading data from a file, processing it with pandas, and saving the result to a new file.

```python
df = pd.read_csv('file.csv')
df.to_csv('output.csv', index=False)
```
> `index=False` means that the row number column (0, 1, 2, ...) is not written to the output file.

---

## Overview of Information

(number of rows, number of columns)

```python
print(df.shape)
# (3, 3)
```

show headline

```python
print(df.columns)
# Index(['name','age','city'], dtype='object')
```

information numeric

```python
print(df.describe())
              سن
# count   3.000000
# mean   25.666667
# std     4.041452
# min    22.000000
# 25%    23.500000
# 50%    25.000000
# 75%    27.500000
# max    30.000000
```

---


## choose data

choose some data

```python
print(df['name'])
# 0     ali
# 1     sara
# 2     reza
```

```python
print(df.loc[0, 'name'])
# ali
```

```python
print(df[df['age'] > 24])
#    name  age     city
# 0   Ali   25   Tehran
# 1  Sara   30   Shiraz

print(df[(df['age'] > 20) & (df['age'] < 30)])
#    name  age     city
# 0   Ali   25   Tehran
# 2  Reza   22  Isfahan


print(df[df['city'].isin(['tehran', 'shiraz'])])
#    name  age     city
# 0   Ali   25   Tehran
# 1  Sara   30   Shiraz

df['age after 10 years'] = df['age'] + 10
print(df)
#    name  age     city  age_after_10_years
# 0   Ali   25   Tehran                  35
# 1  Sara   30   Shiraz                  40
# 2  Reza   22  Isfahan                  32
```

---

## sort

sort data 

```python
print(df.sort_values('age', ascending=False))
#    name  age     city
# 1  Sara   30   Shiraz
# 0   Ali   25   Tehran
# 2  Reza   22  Isfahan
```

> sort_values('age') → sorts the table based on the 'age' column

> ascending=False → in descending order (largest to smallest)

---

## Merging DataFrames  

merge data

```python
df1 = pd.DataFrame({'id': [1, 2, 3], 'name': ['Ali', 'Sara', 'Reza']})
df2 = pd.DataFrame({'id': [1, 2, 4], 'score': [18, 19, 20]})

print(pd.merge(df1, df2, on='id', how='inner'))
#    id  name  score
# 0   1   Ali     18
# 1   2  Sara     19
```

> pd.merge(df1, df2, on='id') → Merges two tables based on the common 'id' column.

> how='inner' → Only rows with a common id in both tables are displayed.

>> 'outer' → all row

Concatenates two DataFrames side-by-side (horizontally)

```python
print(pd.concat([df1, df2], axis=1))
#    id  name  id  score
# 0   1   Ali   1     18
# 1   2  Sara   2     19
# 2   3  Reza   4     20
```

> axis=1 → Column-wise concatenation (side-by-side)

> axis=0 → Concatenation by row (stacking vertically) — default

---

## Pivot Table

create summary

```python
print(df3.pivot_table(values='age', index='city', aggfunc='mean'))
#          age
# city        
# Shiraz  29.0
# Tehran  23.5
```

> values='age' → The value being calculated is the 'age' column.

> index='city' → Grouping by city (one row per city)

> aggfunc='mean'(default) → the aggregation function is the mean ('mean' , 'sum' , 'count' , 'min' , 'max')

---


## work with string

upper , lower , ...

```python
print(df['name'].str.upper())
# 0     ALI
# 1    SARA
# 2    REZA
```

> df['name'] → selects the 'name' column (a Series)

> .upper() → ali : ALI
>> .lower() → ALI : ali
>> .title() →  ali reza : Ali Reza
>> .len() → Ali : 3
>> .contains('a') → True/False
>> .replace('a', 'b') → Ali : bli
>> .strip() → " Ali " → "Ali"
>> .split(' ') → "Ali Reza" → ['Ali', 'Reza']

---

## transfer data type

change data type

```python
print(df['age'].astype(float))
# 0    25.0
# 1    30.0
# 2    22.0
```

---

## delete duplicate

delete duplicate data

```python
data4 = pd.DataFrame({'x': [1, 1, 2, 3, 3]})
print(data4.drop_duplicates())
#    x
# 0  1
# 2  2
# 3  3
```

---

## EXAMPLE

Store Sales Analysis (Identifying Best-Selling Products)

```python
import pandas as pd

data = {
    'product': ['Laptop', 'Mobile', 'Laptop', 'Tablet', 'Mobile', 'Mobile'],
    'seller': ['Ali', 'Sara', 'Reza', 'Ali', 'Reza', 'Sara'],
    'price': [25000000, 15000000, 26000000, 8000000, 14000000, 15500000],
    'quantity': [2, 5, 1, 3, 4, 2]
}
df = pd.DataFrame(data)
df['total_sales'] = df['price'] * df['quantity']

top = df.groupby('product')['total_sales'].sum().sort_values(ascending=False)
print(top)
# product
# Mobile    150000000
# Laptop     51000000
# Tablet     24000000
```

---

Age group

```python
import pandas as pd

data = {'name': ['Ali', 'Sara', 'Reza', 'Maryam', 'Hossein'], 'age': [15, 25, 45, 65, 8]}
df = pd.DataFrame(data)

bins = [0, 12, 18, 60, 100]
labels = ['child', 'teenager', 'adult', 'elderly']
df['age_group'] = pd.cut(df['age'], bins=bins, labels=labels)
print(df)
#       name  age  age_group
# 0      Ali   15   teenager
# 1     Sara   25      adult
# 2     Reza   45      adult
# 3   Maryam   65    elderly
# 4  Hossein    8      child
```

---

Ranking student

```python
import pandas as pd

data = {'name': ['Ali', 'Sara', 'Reza', 'Maryam'], 'score': [18, 20, 15, 20]}
df = pd.DataFrame(data)

df['rank'] = df['score'].rank(ascending=False, method='min')
print(df.sort_values('rank'))

```

---


# Python Numpy Cheat Sheet

A Python library for numerical computing and working with multidimensional arrays.

## 📑 Table of Contents

1. [Introduction | مقدمه](#introduction)
2. [Install numpy | نصب کتابخانه numpy](#install-numpy)
3. [Use Library | استفاده از کتابخانه](#use-library)
4. [Info | اطلاعات و مثال دستور](#info)
5. [Reading and Writing Files | خواندن و نوشتن فایل‌ها](#reading-and-writing-files)
6. [Create Array | ساخت آرایه](#create-array)
7. [Properties and Inspection | ویژگی‌ها و بازرسی آرایه](#properties-and-inspection-methods)
8. [Copying, Sorting, Transforming | کپی، مرتب‌سازی و تبدیل](#copying-sorting-and-transforming)
9. [Adding/Removing/Combining/Splitting Elements | افزودن، حذف، ترکیب و تقسیم عناصر](#addingremovingcombiningsplitting-elements)
10. [Vector Math | عملیات ریاضی برداری](#vector-math)
11. [Scalar Math | عملیات ریاضی اسکالر](#scalar-math)
12. [Statistics | آمار](#statistics)

---
---

## introduction

```python
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

---

## install numpy

```python
#without venv
python -m pip install numpy
#with venv
pip install numpy
```

## use-library

You’ll also need to import numpy to get started

```python
import numpy as np
```
## info

```python
np.info(np.eye)
```

> show the information for eye and example

## Reading and writing files

Read from file.txt

```python
import numpy as np
data = np.loadtxt('file.txt')
print(data)
```

content file.txt
```
1 2 3
4 5 6
```

output
```
[[1. 2. 3.]
 [4. 5. 6.]]
```

---

Read CSV (Separated by comma)

```python
data = np.genfromtxt('file.csv', delimiter=',')
print(data)
```

content file.csv
```
1,2,3
4,5,6
```

output
```
[[1. 2. 3.]
 [4. 5. 6.]]
```

---


save array in file.txt

```python
arr = np.array([[1, 2, 3], [4, 5, 6]])
np.savetxt('file.txt', arr, delimiter=' ')
```

output
```
1.000000000000000000e+00 2.000000000000000000e+00 3.000000000000000000e+00
4.000000000000000000e+00 5.000000000000000000e+00 6.000000000000000000e+00
```

---

Simpler format

```python
arr = np.array([[1, 2, 3], [4, 5, 6]])
np.savetxt('file.txt', arr, delimiter=',', fmt='%d')
```

> delimiter # Character between numbers

output
```
1,2,3
4,5,6
```

---
---

## create array

```python
np.array([1, 2, 3])
# [1 2 3]

np.array([(1,2,3), (4,5,6)])
# [[1 2 3]
#  [4 5 6]]

np.zeros(3)
# [0. 0. 0.]

np.ones((3,4))
# [[1. 1. 1. 1.]
#  [1. 1. 1. 1.]
#  [1. 1. 1. 1.]]

np.eye(5)
# [[1. 0. 0. 0. 0.]
#  [0. 1. 0. 0. 0.]
#  ...]

np.linspace(0, 100, 6)
# [  0.  20.  40.  60.  80. 100.]
# 0 to 100 with 6 numbers

np.arange(0, 10, 3)
# [0 3 6 9]
# 0 to 10 with 3 steps

np.full((2,3), 8)
# [[8 8 8]
#  [8 8 8]]
# array 2*3 with all 8

np.random.rand(4,5)
# 0.87 0.20 0.34 ....
#beetwin 0,1 & aray 4*5

np.random.rand(6,7) * 100
#beetwin 0,100

np.random.randint(5, size=(2,3))
# [[3 1 4]
#  [0 2 2]]
# A 2×3 array of random integers between 0 and 4.
```

---
---

## Properties and inspection methods

```python
import numpy as np
arr = np.array([[1, 2, 3], [4, 5, 6]])
# Total number of elements
print(arr.size)
# output = 6

# Row, column
print(arr.shape)
# output = (2,3)

# type data
print(arr.dtype)
# output = int64

#translata data type
new_arr = arr.astype(float)
print(new_arr.dtype)
# output = float64
print(new_arr)
# output
# [[1. 2. 3.]
#  [4. 5. 6.]]

# transfer array to list
lst = arr.tolist()
print(lst)
# [[1, 2, 3], [4, 5, 6]]
print(type(lst))  # <class 'list'>
```

---
---

## Copying, sorting, and transforming

```python
import numpy as np
arr = np.array([[3, 1, 2], [6, 4, 5]])

# Copies arr to new memory
new = np.copy(arr)
new[0,0] = 99
print(arr[0,0])
#arr dont change, this is 3

arr.sort()
print(arr)
# [[1 2 3]
#  [4 5 6]]
```

---
---

## Adding/removing/Combining/splitting Elements

```python
import numpy as np
arr = np.array([1, 2, 3, 4, 5])

print(np.append(arr, [6, 7]))
# [1 2 3 4 5 6 7]

print(np.insert(arr, 2, [99, 88]))
# [ 1  2 99 88  3  4  5]
# It inserts it before index 2.

a = np.array([[1,2]])
b = np.array([[3,4]])
print(np.concatenate((a, b), axis=0))
# [[1 2]
#  [3 4]]

print(np.concatenate((a, b), axis=1))
# [[1 2 3 4]]

a = np.array([1,2,3,4,5,6])
print(np.split(a, 3))
# [array([1, 2]), array([3, 4]), array([5, 6])]
```

---
---

## Vector Math

```python
import numpy as np
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# جمع
np.add(a, b)
# [5 7 9]

#تفریق
np.subtract(a, b)
# [-3 -3 -3]

# ضرب
np.multiply(a, b)
# [4 10 18]

# تقسیم
np.divide(a, b)
# [0.25 0.4 0.5]

# توان
np.power(a, b)
# [1 32 729]

# برابری کامل
np.array_equal(a, b)
# False

# رادیکال
np.sqrt(a)
# [1. 1.41 1.73]

# سینوس
np.sin(a)
# [0.84 0.91 0.14]

# لگاریتم طبیعی
np.log(a)
# [0. 0.69 1.09]

# قدر مطلق
np.abs(a)
# [1 2 3]

# گرد به بالا
np.ceil(a)
# [1. 2. 3.]

# گرد به پایین
np.floor(a)
# [1. 2. 3.]

# گرد به نزدیک‌ترین
np.round(a)
# [1. 2. 3.]
```

---
---

## Scalar Math

```python
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
a = np.array([[1, 2, 3], [4, 5, 6]])

np.add(arr, 1)   
# [2 3 4 5 6]

np.subtract(arr, 2)   
# [-1  0  1  2  3]

np.multiply(arr, 3)   
# [ 3  6  9 12 15]

np.divide(arr, 4)  
# [0.25 0.5  0.75 1.   1.25]

np.power(arr, 5)   
# [1  32 243 1024 3125]
```

---
---

## Statistics

```python
import numpy as np
arr = np.array([1, 2, 3, 4, 5])
a = np.array([[1, 2, 3], [4, 5, 6]])

np.mean(arr)        
# 3.0
np.mean(a, axis=0) 
# [2.5 3.5 4.5]  (میانگین هر ستون)

arr.sum()   
# 15

arr.min()   
# 1

a.max(axis=0)   
# [4 5 6]  (بیشینه هر ستون)

np.var(arr)   
# 2.0

# Standard deviation
np.std(a, axis=1)   
# [0.816 0.816]  (برای هر ردیف)
```

> axis=0 عملیات روی ستون
> axis=1 عملیات روی ردیف


---
---


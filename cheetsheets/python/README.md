# Python Cheat Sheet

A practical and example-driven reference guide for **Python**.

---

## 📋 Table of Contents

1. [To Begin - شروع](#to-begin)
2. [Comments - نظرات](#comments)
3. [Data Types - انواع داده](#data-types)
4. [Variables and Assignments - متغیرها و انتساب](#variables-and-assignments)
5. [Strings - رشته‌ها](#strings)
6. [Numbers and Math - اعداد و ریاضیات](#numbers-and-math)
7. [Conditionals - شرط‌ها](#conditionals)
8. [Loops - حلقه‌ها](#loops)
9. [Functions - توابع](#functions)
10. [Classes - کلاس‌ها](#classes)
11. [Exceptions - استثناها](#exceptions)
12. [Collections - مجموعه‌ها](#collections)
13. [Comprehensions - کامپرهنشن‌ها](#comprehensions)
14. [File I/O - ورودی و خروجی فایل](#file-io)
15. [Imports and Modules - وارد کردن و ماژول‌ها](#imports-and-modules)
16. [Virtual Environments - محیط‌های مجازی](#virtual-environments)
17. [Packages - پکیج‌ها](#packages)

---

# To Begin

## Start the Interactive Shell

```bash
python
```
## Quit the Interactive Shell

```python
exit()
```

## Run a Script

```bash
python my_script.py
```

## Run a Script in Interactive Mode

```bash
python -i my_script.py
```
---

# Comments

## Write Comments

```python
# This is a comment
# print("This code will not run.")
print("This will run.") 
```
> comments are ignored by Python

# Data Types

Using `None` to represent missing or optional values.
Using `type()` to check the object type.
Checking for a specific type using `isinstance()`.
issubclass() checks if a class is a subclass.

## Type Investigation

```python
type(42)                # <class 'int'>
type(3.14)              # <class 'float'>
type("Hello")           # <class 'str'>
type(True)              # <class 'bool'>
type(None)              # <class 'NoneType'>

isinstance(3.14, float)  # True
issubclass(int, object)  # True - everything inherits from object
```
## Type Conversion

```python
int("42")                # 42
float("3.14")            # 3.14
str(42)                  # "42"
bool(1)                  # True
list("abc")              # ["a", "b", "c"]
```
---

# Variables and Assignments

Variables are created when they are assigned for the first time.

## Basic Assignment

```python
name = "Leo"           # String
age = 7                # Integer
height = 5.6           # Float
is_cat = True          # Boolean
flaws = None           # None type
```

## Parallel & Chained Assignments

```python
x, y = 10, 20          # Assign multiple values
a = b = c = 0          # Give same value to multiple variables
```
## Augmented Assignments

```python
counter += 1		# counter = counter + 1
numbers += [4, 5]
permissions |= write	# permissions = permissions | write (Add the write permission to permissions and assign the result back to permissions.)
```

### EXAMPLE

```python
numbers = [1, 2, 3]
numbers += [4, 5]
print(numbers)		# [1, 2, 3, 4, 5]
```
---

# Strings

## Creating Strings

```python
single = 'Hello'
double = "World"
multi = """Multiple
line string"""
```

## String Operations

```python
greeting = "me" + "ow!"  # "meow!"
repeat = "Meow!" * 3     # "Meow!Meow!Meow!"
length = len("Python")   # 6
```

## String Methods

```python
"a".upper()                     # "A"
"A".lower()                     # "a"
" a ".strip()                   # "a"		# Delete space from both sides
"xxhelloxx".strip("x")         # "hello"	# Delete character 'x'
"abc".replace("bc", "ha")       # "aha"
"a b".split()                   # ["a", "b"]	# Convert string to list
"-".join(["a", "b"])            # "a-b"		# join is the opposite of split.
```

### EXAMPLE

```python
path = "/".join(["home", "user", "docs", "file.txt"])
# "/home/user/docs/file.txt"
```

## String Indexing & Slicing

```python
text = "Python"
text[0]      # "P" (first)
text[-1]     # "n" (last)
text[1:4]    # "yth" (slice)
text[:3]     # "Pyt" (from start)
text[3:]     # "hon" (to end)
text[::2]    # "Pto" (every 2nd)
text[::-1]   # "nohtyP" (reverse)
```

## String Formatting

```python
# f-strings
name = "Aubrey"
age = 2
f"Hello, {name}!"	                   # "Hello, Aubrey!"
f"{name} is {age} years old"	           # "Aubrey is 2 years old"
f"Debug: {age=}"               		   # "Debug: age=2"

# Format method
template = "Hello, {name}! You're {age}."
template.format(name="Aubrey", age=2)      # "Hello, Aubrey! You're 2."
```

## Raw Strings

```python
# Normal string with an escaped tab
"This is:\tCool."       # "This is:    Cool."

# Raw string with escape sequences
r"This is:\tCool."      # "This is:\tCool."
```
---

# Numbers and Math

## Arithmetic Operators

```python
10 + 3    # 13
10 - 3    # 7
10 * 3    # 30
10 / 3    # 3.3333333333333335
10 // 3   # 3
10 % 3    # 1
2 ** 3    # 8
```

## Useful Functions

```python
abs(-5)              # 5
round(3.7)           # 4
round(3.14159, 2)    # 3.14
min(3, 1, 2)         # 1
max(3, 1, 2)         # 3
sum([1, 2, 3])       # 6
```
---

# Conditionals

Python uses indentation for code blocks.
Use of 4 spaces: Level of complexity.

## If-Elif-Else

```python
if age < 13:
    category = "child"
elif age < 20:
    category = "teenager"
else:
    category = "adult"
```

## Comparison Operators

```python
x == y    # Equal to
x != y    # Not equal to
x < y     # Less than
x <= y    # Less than or equal
x > y     # Greater than
x >= y    # Greater than or equal
```

## Logical Operators

```python
if age >= 18 and has_car:
    print("Roadtrip!")

if is_weekend or is_holiday:
    print("No work today.")

if not is_raining:
    print("You can go outside.")
```
---
# Loops

> range(start, stop, step) Production from 0 to 4

### EXAMPLE

```python
range(5)            # 0, 1, 2, 3, 4 			(stop)
list(range(2, 7))   # [2, 3, 4, 5, 6]			(start, stop)
range(10, 0, -1)    # 10, 9, 8, 7, 6, 5, 4, 3, 2, 1	(start, stop, step)
```
> enumerate() create number

### EXAMPLE

```python
for i, fruit in enumerate(fruits, start=1):	# start with (1)
    print(i, fruit)
# 1 apple
# 2 banana
# 3 cherry
```
```python
names = ["Ali", "Sara", "Reza"]
for i, name in enumerate(names):
    if name == "Sara":
        print(f"Sara in index {i}")   # sara in index 1
```
> break exits the loop; continue skips to the next iteration.

### EXAMPLE

```python
names = ["Ali", "Sara", "Reza", "Mina"]
target = "Reza"

for name in names:
    if name == target:
        print("found it!")
        break
# Once it is found, there is no need to search for the rest.
```

===

## For Loops

```python
# Loop through range
for i in range(5):      # 0, 1, 2, 3, 4
    print(i)

# Loop through collection
fruits = ["apple", "banana"]
for fruit in fruits:
    print(fruit)

# With enumerate for index
for i, fruit in enumerate(fruits):
    print(f"{i}: {fruit}")
```

## While Loops

‍‍```python
while True:
    user_input = input("Enter 'quit' to exit: ")
    if user_input == "quit":
        break
    print(f"You entered: {user_input}")
```

## Loop Control

```python
for i in range(10):
    if i == 3:
        continue  # Skip this iteration
    if i == 7:
        break     # Exit loop
    print(i)
```
---

# Functions

Define functions with def.
Always use () to call a function.
Add return to send values back.
Create anonymous functions with the lambda keyword.

## Defining Functions

```python
def greet():
    return "Hello!"

def greet_person(name):
    return f"Hello, {name}!"

def add(x, y=10):    # Default parameter for y
    return x + y
```

## Calling Functions

```python
greet()                   # "Hello!"
greet_person("Bartosz")   # "Hello, Bartosz"
add(5, 3)                 # 8
add(7)                    # 17
```

## Return Values

```python
def get_min_max(numbers):
    return min(numbers), max(numbers)

minimum, maximum = get_min_max([1, 5, 3])
# (1, 5)
```

## Useful Built-in Functions

```python
callable()  # Checks if an object can be called as a function
dir()       # Lists attributes and methods
globals()   # Get a dictionary of the current global symbol table
hash()      # Get the hash value
id()        # Get the unique identifier
locals()    # Get a dictionary of the current local symbol table
repr()      # Get a string representation for debugging
‍‍‍```
	
### EXAMPLE

```python
# callable()
def my_func():
    return "hello"

callable(my_func)      # True  → my_func() we can call it
callable(print)        # True  → print() this is function
callable(len)          # True  → len() this is function

callable("hello")      # False → "hello"() ❌
callable(42)           # False → 42()      ❌
callable([1, 2])       # False → [1,2]()   ❌ 
----------------------------------------------------------
# dir()
dir("hello")
# ['capitalize', 'casefold', 'center', 'count', 'encode',
#  'endswith', 'find', 'format', 'index', 'isalnum', ...,
#  'lower', 'replace', 'split', 'strip', 'upper', ...]
----------------------------------------------------------
# globals()
x = 10
name = "Ali"

globals()
# {'x': 10, 'name': 'Ali', '__name__': '__main__', ...}
----------------------------------------------------------
#hash()
hash("hello")     # 9070608701297918317
hash("world")     # diffrent number

hash(42)          # 42
hash((1, 2))      # number

hash([1, 2])      # ❌ Error! The list is mutable.
----------------------------------------------------------
# id()
x = 10
id(x)       # 140234567890

y = 10
id(y)       # The same number! Because 10 is a common object.

a = [1, 2]
b = [1, 2]
id(a)       
id(b)       
# diffrent address
----------------------------------------------------------
# local()
def my_func():
    a = 1
    b = 2
    print(locals())   # {'a': 1, 'b': 2}

my_func()
----------------------------------------------------------
# repr()
x = "42"
print(x)         # 42       
print(repr(x))   # '42'     
# you think this is number but this is str.
```

## Lambda Functions
> lambda()  An anonymous one-line function
> map() Applying a function to all elements
```python
square = lambda x: x**2
result = square(5)  # 25

# With map and filter
numbers = [1, 2, 3, 4]
squared = list(map(lambda x: x**2, numbers))		#[1, 4, 9, 16]
evens = list(filter(lambda x: x % 2 == 0, numbers))	#[2, 4]
```
---

# Classes

Classes are blueprints for objects.
You can create multiple instances of one class.
You commonly use classes to encapsulate data.
Inside a class, you provide methods for interacting with the data.
__init__() is the constructor method.
self refers to the instance.

## Defining Classes

```python
class Dog:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def bark(self):
        return f"{self.name} says Woof!"

# Create instance
my_dog = Dog("Frieda", 3)
print(my_dog.bark())  # Frieda says Woof!
```

## Class Attributes & Methods

```python
class Cat:
    species = "Felis catus"   # Class attribute

    def __init__(self, name):
        self.name = name      # Instance attribute

    def meow(self):
        return f"{self.name} says Meow!"

    @classmethod
    def create_kitten(cls, name):
        return cls(f"Baby {name}")
```
## **************************************************
### EXAMPLE for @classmethod

```python
class Date:
    def __init__(self, year, month, day):
        self.year = year
        self.month = month
        self.day = day

    @classmethod
    def from_string(cls, s):        # "2024-01-15"
        y, m, d = map(int, s.split("-"))
        return cls(y, m, d)

    @classmethod
    def today(cls):
        import datetime
        t = datetime.date.today()
        return cls(t.year, t.month, t.day)
```
### Use

```python
d1 = Date(2024, 1, 15)              # معمولی
d2 = Date.from_string("2024-01-15") # از رشته
d3 = Date.today()                   # امروز
```
## **************************************************

## Inheritance

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        pass

class Dog(Animal):
    def speak(self):
        return f"{self.name} barks!"

#d = Dog("Frieda")
#d.name      # Frieda  ← from Animal
#d.speak()   # Frieda barks!  ← from Dog
```
> Rewriting speak in Animal class

---

# Exceptions

When Python runs and encounters an error, it creates an exception.
Use specific exception types when possible.
else runs if no exception occurred.
finally always runs, even after errors.

## Try-Except

```python
try:
    number = int(input("Enter a number: "))
    result = 10 / number
except ValueError:
    print("That's not a valid number!")
except ZeroDivisionError:
    print("Cannot divide by zero!")
else:
    print(f"Result: {result}")
finally:
    print("Calculation attempted")
```
## **************************************************

> ValueError          # Invalid value
```python
int("hello")
```
> TypeError           # Wrong type
```python
"a" + 1
```
> IndexError          # List index out of range
```python
numbers = [10, 20, 30]
# Indexes: 0   1   2   (3 elements)

numbers[0]     # 10  OK
numbers[1]     # 20  OK
numbers[2]     # 30  OK

numbers[3]     # IndexError: list index out of range
```
> KeyError            # Dict key not found
‍‍‍```python
person = {"name": "Ali", "age": 25}

person["name"]     # "Ali"    OK
person["age"]      # 25       OK

person["city"]     # KeyError: 'city'
```
> FileNotFoundError   # File doesn't exist
‍‍```python
open("nope.txt")
```
> SyntaxError 	      # Typographical error
```python
print("hello"
```
> IndentationError    # Nesting error
Wrong spacing
> NameError	      # Undefined name
```python
print(x)
# x not defind
```
> AttributeError      # text = "hello"
```python
text.upper()      # "HELLO"    OK
text.lower()      # "hello"    OK

text.foo()        # AttributeError: 'str' object has no attribute 'foo'
# The string "hello" has no method called foo
```
> ZeroDivisionError   # Division by zero
```python
x = 1 / 0
```
> ImportError 	      # Module not found
```python
import nope
```
> ModuleNotFoundError # Module not install
```python
import pandas
```
> KeyboardInterrupt   # when we use CTRL+C
CTRL+C
> RuntimeError	      # General runtime error
> PermissionError     # dont permission
When opening a system file
> IsADirectoryError   # It is the directory path not folder
```python
open("my_folder")
# IsADirectoryError: [Errno 21] Is a directory: 'my_folder'
```
> TimeoutError        # teme out
Long-duration operation
> ConnectionError     # Error of connection

## **************************************************

## Raising Exceptions

```python
def validate_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative")
    return age
```
---

# Collections

Use len() to get the size of a collection.
You can check if an item is in a collection with the in keyword.

## Lists

```python
# Creating lists
empty = []
nums = [5]
mixed = [1, "two", 3.0, True]

# List methods
nums.append("x")         # Add to end
nums.insert(0, "y")      # Insert at index 0
nums.extend(["z", 5])    # Extend with iterable
nums.remove("x")         # Remove first "x"
last = nums.pop()        # Pop returns last element

# List indexing and checks
fruits = ["banana", "apple", "orange"]
fruits[0]                # "banana"
fruits[-1]               # "orange"
"apple" in fruits        # True
len(fruits)              # 3
```

## Tuples
```python
# Creating tuples
point = (3, 4)
single = (1,)    # Note the comma!
empty = ()

# Basic tuple unpacking
point = (3, 4)
x, y = point 
x                # 3
y                # 4

# Extended unpacking
first, *rest = (1, 2, 3, 4) 
first            # 1
rest             # [2, 3, 4]
```

## Sets

```python
# Creating Sets
a = {1, 2, 3}
b = set([3, 4, 4, 5])
# Remove duplicates from the list

# Set Operations
a | b            # {1, 2, 3, 4, 5}
a & b            # {3}
a - b            # {1, 2}
a ^ b            # {1, 2, 4, 5}
```

## Dictionaries

```python
# Creating Dictionaries
empty = {}
pet = {"name": "Leo", "age": 42}

# Dictionary Operations
pet["sound"] = "Purr!"   # Add key and value
pet["age"] = 7           # Update value
age = pet.get("age", 0)  # Get with default (if its not defind print 0)
del pet["sound"]         # Delete key
pet.pop("age")           # Remove and return

# Dictionary Methods
pet = {"name": "Frieda", "sound": "Bark!"}
pet.keys()         # dict_keys(['name', 'sound'])
pet.values()       # dict_values(['Frieda', 'Bark!'])
pet.items()        # dict_items([('name', 'Frieda'), ('sound', 'Bark!')])
```

# Comprehensions

## List Comprehensions

> `[عبارت for عنصر in دنباله if شرط]` 

```python
# Basic
squares = [x**2 for x in range(10)]			# [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]

# With condition
evens = [x for x in range(20) if x % 2 == 0]		# [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

# Nested
matrix = [[i*j for j in range(3)] for i in range(3)]	# [[0, 0, 0], [0, 1, 2], [0, 2, 4]]
```

## Other Comprehensions

```python
# Dictionary comprehension
word_lengths = {word: len(word) for word in ["hello", "world"]}	# {'hello': 5, 'world': 5}

# Set comprehension
unique_lengths = {len(word) for word in ["who", "what", "why"]}	# {3, 4} delete Duplicate

# Generator expression
sum_squares = sum(x**2 for x in range(1000))			# 332833500 Sum of squares from 0 to 999 — without creating a list, low memory usage.
```

# File I/O

## File Operations

`with` automatically closes the file — even if it gives an error.

```python
# Read an entire file
with open("file.txt", mode="r", encoding="utf-8") as file:
    content = file.read()

# Read a file line by line
with open("file.txt", mode="r", encoding="utf-8") as file:
    for line in file:
        print(line.strip())

# Write a file
with open("output.txt", mode="w", encoding="utf-8") as file:
    file.write("Hello, World!\n")

# Append to a File
with open("log.txt", mode="a", encoding="utf-8") as file:
    file.write("New log entry\n")
```
---

# Imports and Modules

Use aliases for long module names.
Group imports: standard library, third-party libraries, user-defined modules.

## Import Styles

```python
# Import entire module
import math
result = math.sqrt(16)

# Import specific function
from math import sqrt
result = sqrt(16)

# Import with alias
import numpy as np
array = np.array([1, 2, 3])

# Import all (not recommended)
from math import *
```

## Package Imports

```python
# Import from package
import package.module
from package import module
from package.subpackage import module

# Import specific items
from package.module import function, Class
from package.module import name as alias
```
---

# Virtual Environments

Virtual environments are often called “venv”.
Use venvs to isolate project packages from the system-wide Python packages.

## Create Virtual Environment

```bash
python -m venv .venv
```
### Activate Virtual Environment (Windows)
```powershell
.venv\Scripts\activate
```
### Activate Virtual Environment (Linux & macOS)
```shell
source .venv/bin/activate
```
### Deactivate Virtual Environment
```shell
deactivate
```
---

# Packages

## Install Packages

```shell
python -m pip install requests
```

## Save Requirements & Install from File

```shell
# pip freeze = displays a list of all installed packages.
# Get all the installed packages and write them to the file.
python -m pip freeze > requirements.txt		# When your project is complete → Save
# Read from the requirements.txt file and install all those packages.
python -m pip install -r requirements.txt	# When you get someone's project → Install
```
---

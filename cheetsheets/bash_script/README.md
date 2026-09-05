#Bash Scripting Cheat Sheet

A practical and example-driven reference guide for **Bash scripting**.

---

## 📋 Table of Contents

1. [Script Basics - مبانی اسکریپت](#script-basics)
2. [Variables - متغیر ها](#variables)
3. [Special Variables - متغیر های ویژه](#special-variables)
4. [Quoting - نقل قول گذاری](#quoting)
5. [String Operations - عملیات روی رشته ها](#string-operations)
6. [String Concatenation - اتصال رشته ها](#string-concatenation)
7. [Default Values - مقادیر پیش فرض](#default-values)
8. [Arrays - ارایه ها](#arrays)
9. [Arithmetic - محاسبات ریاضی](#arithmetic)
10. [Conditionals - دستورات شرطی](#conditionals)
11. [Test Command - دستور test](#test-command)
12. [Numeric Comparisons - مقایسه عددی](#numeric-comparisons)
13. [File Tests - بررسی فایل ها](#file-tests)
14. [Logical Operators - عملگر های منطقی](#logical-operators)
15. [Case Statement - دستور  case](#case-statement)
16. [For Loop - حلقه for](#for-loop)
17. [While & Until Loops - حلقه های while , untill](#while--until-loops)
18. [Functions - توابع](#functions)
19. [Input/Output - ورودی و خروجی](#inputoutput)
20. [Redirection - تغییر مسیر ورودی و خروجی](#redirection)
21. [Here Documents - اسناد](#here-documents)
22. [Select Menu - منوی انتخاب](#select-menu)
23. [Debugging - اشکال زدایی](#debugging)
24. [Useful Patterns - الگو های کاربردی](#useful-patterns)
25. [Configuration Files - فایل های پیکربندی](#configuration-files)

---

# Script Basics

## Shebang

The **shebang** specifies which interpreter should execute the script.

```bash
#!/bin/bash
```

### Example

```bash
#!/bin/bash

echo "Hello Bash!"
```

### Output

```text
Hello Bash!
```

---

## Portable Shebang

Use `#!/usr/bin/env bash` to find Bash using the user's `PATH`.

```bash
#!/usr/bin/env bash
```

> Useful when Bash may be installed in different locations.

---

## Comment

Use `#` to write comments.

```bash
# This is a comment
```

> Comments are ignored by Bash.

### Example

```bash
# Print username
echo "$USER"
```

---

## Make Script Executable

Use `chmod +x script.sh` to make a script executable.

```bash
chmod +x script.sh
```

---

## Run a Script

Run an executable script with:

```bash
./script.sh
```

> The script needs executable permission.

### Alternative

Run the script explicitly with Bash:

```bash
bash script.sh
```

> This does not require executable permission.

---

## Source a Script

Use `source script.sh` or `. script.sh`.

```bash
source script.sh
```

or:

```bash
. script.sh
```
---

# Variables

Create a variable using:
```bash
name="Ali"
```
> No spaces around `=`.

❌ Wrong:
```bash
name = "Ali"
```

---

## Use a Variable
```bash
echo "$name"
```

### Output
```text
Ali
```
---

## Explicit Variable Expansion

Use `"${name}"` when adding text directly after a variable.
```bash
echo "${name}"
```

### Example

```bash
name="Ali"

echo "${name}_admin"
```

### Output

```text
Ali_admin
```

Without braces:

```bash
echo "$name_admin"
```

Bash looks for a variable called `name_admin`.

---

## Readonly Variable

Use `readonly` to prevent a variable from being modified.

```bash
readonly version="1.0"
```

### Example

```bash
readonly version="1.0"
version="2.0"
```

### Result

```text
bash: version: readonly variable
```

---

## Unset Variable

Use `unset name` to remove a variable.

```bash
unset name
```

### Example

```bash
name="Ali"
unset name

echo "$name"
```

### Output

```text
```

---

## Export Variable

Use `export` to make a variable available to child processes.

```bash
export APP_ENV="production"
```

### Example

```bash
export APP_ENV="production"
bash -c 'echo "$APP_ENV"'
```

### Output

```text
production
```

---

## Environment Variables

Use `env` to display environment variables.

```bash
env
```

Useful examples:

```bash
echo "$HOME"
echo "$USER"
echo "$PATH"
```

---

# Special Variables

Bash provides special variables for script arguments, process information, and exit statuses.

| Variable | Description |
| --- | --- |
| `$0` | Script or shell name |
| `$1` - `$9` | Positional parameters |
| `$?` | Exit status of the last command |
| `$$` | PID of the current shell |
| `$!` | PID of the most recent background process |

---

## `$0` — Script Name

Use `$0` to access the script name.

```bash
echo "$0"
```

Run:

```bash
./script.sh
```

Possible output:

```text
./script.sh
```

---

## `$1`, `$2` — Arguments

`$1`, `$2`, etc. represent positional arguments.

Script:

```bash
echo "Name: $1"
echo "Age: $2"
```

Run:

```bash
./script.sh Ali 25
```

Output:

```text
Name: Ali
Age: 25
```

---

## `$?` — Exit Status

Use `$?` to check the exit status of the last command.

```bash
ls /tmp
echo "$?"
```

If successful:

```text
0
```

> `0` normally means success; a non-zero value indicates failure.

---

## `$$` — Current PID

Use `$$` to get the PID of the current shell.

```bash
echo "PID: $$"
```

Example output:

```text
PID: 12345
```

---

## `$!` — Last Background PID

Use `$!` to get the PID of the most recent background process.

```bash
sleep 10 &
echo "Background PID: $!"
```

Example output:

```text
Background PID: 12346
```

---

# Quoting

Quoting is extremely important in Bash because it controls variable expansion, word splitting, and special-character interpretation.

---

## Double Quotes

Use `"..."` when you want variables and command substitutions to be expanded while preserving most whitespace.

```bash
"$var"
```

### Example

```bash
name="Ali"
echo "Hello $name"
```

Output:

```text
Hello Ali
```

---

## Single Quotes

Use `'...'` when everything should be treated literally.

```bash
'$var'
```

### Example

```bash
name="Ali"
echo 'Hello $name'
```

Output:

```text
Hello $name
```

---

## Escape Character

Use `\` to escape a special character.

```bash
\$
```

### Example

```bash
echo "\$HOME"
```

Output:

```text
$HOME
```

---

## Command Substitution

Old syntax:

```bash
`command`
```

Preferred syntax:

```bash
$(command)
```

### Example

```bash
today=$(date)
echo "$today"
```

> `$(...)` is preferred because it is easier to read and nest.

---

## Arithmetic Expansion

Use `$((...))` for arithmetic expansion.

```bash
$((expression))
```

### Example

```bash
a=10
b=5

echo $((a + b))
```

Output:

```text
15
```

---

# String Operations

## String Length

Use `${#var}` to get the length of a string.

```bash
${#var}
```

### Example

```bash
name="Bash"

echo "${#name}"
```

Output:

```text
4
```

---

## Substring

Use `${var:position:length}` to extract part of a string.

```bash
${var:position:length}
```

### Example

```bash
text="Hello World"

echo "${text:0:5}"
```

Output:

```text
Hello
```

---

## Remove Prefix — Shortest Match

Use `${var#pattern}` to remove the shortest matching prefix.

```bash
${var#pattern}
```

### Example

```bash
file="backup.tar.gz"

echo "${file#*.}"
```

Output:

```text
tar.gz
```

---

## Remove Prefix — Longest Match

Use `${var##pattern}` to remove the longest matching prefix.

```bash
${var##pattern}
```

### Example

```bash
file="backup.tar.gz"

echo "${file##*.}"
```

Output:

```text
gz
```

> `#` removes the shortest matching prefix.  
> `##` removes the longest matching prefix.

---

## Remove Suffix — Shortest Match

Use `${var%pattern}` to remove the shortest matching suffix.

```bash
${var%pattern}
```

### Example

```bash
file="backup.tar.gz"

echo "${file%.*}"
```

Output:

```text
backup.tar
```

---

## Remove Suffix — Longest Match

Use `${var%%pattern}` to remove the longest matching suffix.

```bash
${var%%pattern}
```

### Example

```bash
file="backup.tar.gz"

echo "${file%%.*}"
```

Output:

```text
backup
```

---

## Replace First Match

Use `${var/old/new}` to replace the first match.

```bash
${var/old/new}
```

### Example

```bash
text="apple apple"

echo "${text/apple/orange}"
```

Output:

```text
orange apple
```

---

## Replace All Matches

Use `${var//old/new}` to replace all matches.

```bash
${var//old/new}
```

### Example

```bash
text="apple apple"

echo "${text//apple/orange}"
```

Output:

```text
orange orange
```

---

# String Concatenation

## Concatenate Variables

Variables can be placed next to each other.

```bash
$a$b
```

### Example

```bash
first="Hello"
second="World"

echo "$first $second"
```

Output:

```text
Hello World
```

---

## Safe Concatenation

Use `"${a}${b}"` when concatenating variables directly.

```bash
"${a}${b}"
```

### Example

```bash
a="Linux"
b="Bash"

result="${a}-${b}"

echo "$result"
```

Output:

```text
Linux-Bash
```

---

## Append Literal Text

```bash
"$a and $b"
```

### Example

```bash
a="Linux"
b="Bash"

echo "$a and $b"
```

Output:

```text
Linux and Bash
```

---

## Append to Variable

Use `+=` to append text.

```bash
var+="more"
```

### Example

```bash
text="Hello"
text+=" World"

echo "$text"
```

Output:

```text
Hello World
```

---

# Default Values

These operators are useful when working with optional variables.

---

## `${var:-default}`

```bash
${var:-default}
```

> Use `default` if `var` is unset **or empty**.

### Example

```bash
name=""

echo "${name:-Guest}"
```

Output:

```text
Guest
```

---

## `${var:+value}`

```bash
${var:+value}
```

> Use `value` only if the variable is set and non-empty.

### Example

```bash
name="Ali"

echo "${name:+User exists}"
```

Output:

```text
User exists
```

---

# Arrays

## Create an Array

```bash
arr=("Linux" "Bash" "Python")
```

---

## Set an Element

```bash
arr[0]="Linux"
```

---

## Get an Element

```bash
echo "${arr[0]}"
```

Output:

```text
Linux
```

---

## Get All Elements

```bash
echo "${arr[@]}"
```

---

## Iterate Over an Array

```bash
for item in "${arr[@]}"; do
    echo "$item"
done
```

Output:

```text
Linux
Bash
Python
```

> Prefer `"${arr[@]}"` when you want to preserve individual array elements.

---

## Array Length

```bash
echo "${#arr[@]}"
```

Output:

```text
3
```

---

## Append Elements

```bash
arr+=("Git" "Docker")
```

---

## Delete an Element

```bash
unset 'arr[1]'
```

> Quoting the array subscript is a good habit, especially when used with `unset`.

---

# Arithmetic

Bash supports integer arithmetic using `$((...))` and `((...))`.

---

## Addition

```bash
echo $((a + b))
```

### Example

```bash
a=10
b=5

echo $((a + b))
```

Output:

```text
15
```

---

## Subtraction

```bash
echo $((a - b))
```

Output:

```text
5
```

---

## Multiplication

```bash
echo $((a * b))
```

Output:

```text
50
```

---

## Division

```bash
echo $((a / b))
```

> Bash integer division truncates the decimal part.

### Example

```bash
echo $((7 / 2))
```

Output:

```text
3
```

---

## Modulo

```bash
echo $((a % b))
```

### Example

```bash
echo $((7 % 2))
```

Output:

```text
1
```

---

## Exponent

```bash
echo $((2 ** 3))
```

Output:

```text
8
```

---

## Increment

```bash
((i++))
```

### Example

```bash
i=5
((i++))

echo "$i"
```

Output:

```text
6
```

---

## Decrement

```bash
((i--))
```

---

## Add and Assign

```bash
((i += 5))
```

### Example

```bash
i=10
((i += 5))

echo "$i"
```

Output:

```text
15
```

---

# Conditionals

## If / Elif / Else

```bash
if [[ condition ]]; then
    # code
elif [[ condition ]]; then
    # code
else
    # code
fi
```

### Example

```bash
age=20

if (( age >= 18 )); then
    echo "Adult"
else
    echo "Minor"
fi
```

Output:

```text
Adult
```

---

## Short-Circuit AND

```bash
[[ condition ]] && command
```

### Example

```bash
[[ -f "config.txt" ]] && echo "File exists"
```

> The command runs only if the condition succeeds.

---

## Short-Circuit OR

```bash
[[ condition ]] || command
```

### Example

```bash
[[ -f "config.txt" ]] || echo "File not found"
```

---

# Test Command

Bash commonly uses `[[ ... ]]` for conditional tests.

> `[[ ... ]]` is generally safer and more feature-rich than the older `[ ... ]` syntax.

---
| Variable | Description |
| --- | --- |
| `-z` | Check Empty String |
| `-n` | Check Non-Empty String |
| `==` - `-eq` | Equality |
| `!=` - `-nq` | Inequality |
| `=~` | Regex Match |
| `-lt` | Less Than |
| `-le` | Less Than or Equal |
| `-gt` | Greater Than |
| `-ge` | Greater Than or Equal |


---

## Check Empty String

```bash
[[ -z $str ]]
```

### Example

```bash
str=""

if [[ -z $str ]]; then
    echo "Empty"
fi
```

Output:

```text
Empty
```

---

## Check Non-Empty String

```bash
[[ -n $str ]]
```

### Example

```bash
str="Bash"

[[ -n $str ]] && echo "Not empty"
```

---

## String Equality

```bash
[[ $a == $b ]]
```

### Example

```bash
a="Linux"
b="Linux"

[[ $a == $b ]] && echo "Equal"
```

Output:

```text
Equal
```

---

## String Inequality

```bash
[[ $a != $b ]]
```

---

## Regex Match

```bash
[[ $a =~ regex ]]
```

### Example

```bash
email="user@example.com"

if [[ $email =~ ^[^@]+@[^@]+$ ]]; then
    echo "Valid format"
fi
```

Output:

```text
Valid format
```

---

## Glob Pattern Match

```bash
[[ $a == *pattern* ]]
```

### Example

```bash
file="backup.tar.gz"

if [[ $file == *.gz ]]; then
    echo "Compressed file"
fi
```

Output:

```text
Compressed file
```

---

# Numeric Comparisons

## Equal

```bash
[[ $a -eq $b ]]
```

---

## Not Equal

```bash
[[ $a -ne $b ]]
```

---

## Less Than

```bash
[[ $a -lt $b ]]
```

---

## Less Than or Equal

```bash
[[ $a -le $b ]]
```

---

## Greater Than

```bash
[[ $a -gt $b ]]
```

---

## Greater Than or Equal

```bash
[[ $a -ge $b ]]
```

---

## Arithmetic Comparison

```bash
(( a == b ))
```

### Example

```bash
a=10
b=20

if (( a < b )); then
    echo "$a is smaller"
fi
```

Output:

```text
10 is smaller
```

> For numeric conditions, `(( ... ))` is often cleaner than `[[ $a -lt $b ]]`.

---

# File Tests

---
| Variable | Description |
| --- | --- |
| `-e` | File Exists |
| `-f` | Regular File |
| `-d` | Directory |
| `-L` | Symbolic Link |
| `-r` - `-w` - `-x` | Readable - Writable - Executable |
| `-s` | File Is Not Empty |
---

## File Exists

```bash
[[ -e $file ]]
```

---

## Regular File

```bash
[[ -f $file ]]
```

### Example

```bash
file="config.txt"

if [[ -f $file ]]; then
    echo "Regular file"
fi
```

---

## Directory

```bash
[[ -d $file ]]
```

---

## Symbolic Link

```bash
[[ -L $file ]]
```

---

## Readable

```bash
[[ -r $file ]]
```

---

## Writable

```bash
[[ -w $file ]]
```

---

## Executable

```bash
[[ -x $file ]]
```

---

## File Is Not Empty

```bash
[[ -s $file ]]
```

> True when the file exists and has a size greater than zero.


---

# Logical Operators

## AND

```bash
[[ cond1 && cond2 ]]
```

### Example

```bash
age=25
user="admin"

if [[ $age -ge 18 && $user == "admin" ]]; then
    echo "Access granted"
fi
```

---

## OR

```bash
[[ cond1 || cond2 ]]
```

---

## NOT

```bash
[[ ! cond ]]
```

### Example

```bash
if [[ ! -f config.txt ]]; then
    echo "Config file missing"
fi
```

---

## Grouping

Inside `[[ ... ]]`, use parentheses for grouping when needed.

```bash
[[ ( cond1 || cond2 ) && cond3 ]]
```

### Example

```bash
if [[ ($USER == "root" || $USER == "admin") && -f config.txt ]]; then
    echo "Allowed"
fi
```

---

# Case Statement

`case` is useful when comparing one value against multiple patterns.

```bash
case "$var" in
    pattern1)
        # code
        ;;
    pattern2|pattern3)
        # code
        ;;
    *)
        # default
        ;;
esac
```

### Example

```bash
read -r -p "Enter a command: " cmd

case "$cmd" in
    start)
        echo "Starting..."
        ;;
    stop)
        echo "Stopping..."
        ;;
    restart)
        echo "Restarting..."
        ;;
    *)
        echo "Unknown command"
        ;;
esac
```

---

# For Loop

## Loop Over a List

```bash
for i in 1 2 3; do
    echo "$i"
done
```

Output:

```text
1
2
3
```

---

## Loop Over an Array

```bash
arr=("Linux" "Bash" "Git")

for item in "${arr[@]}"; do
    echo "$item"
done
```

Output:

```text
Linux
Bash
Git
```

---

## Loop Over Files

```bash
for file in *.txt; do
    echo "$file"
done
```

> Expands the pattern to matching `.txt` files.

---

## Brace Expansion

```bash
for i in {1..5}; do
    echo "$i"
done
```

Output:

```text
1
2
3
4
5
```

> `{1..5}` is Bash brace expansion, not a general-purpose numeric loop.

---

## C-Style For Loop

```bash
for ((i=0; i<5; i++)); do
    echo "$i"
done
```

Output:

```text
0
1
2
3
4
```

---

# While & Until Loops

## While

```bash
while [[ condition ]]; do
    # code
done
```

### Example

```bash
i=1

while (( i <= 3 )); do
    echo "$i"
    ((i++))
done
```

Output:

```text
1
2
3
```

---

## Until

```bash
until [[ condition ]]; do
    # code
done
```

### Example

```bash
i=1

until (( i > 3 )); do
    echo "$i"
    ((i++))
done
```

Output:

```text
1
2
3
```

> `while` runs while the condition is true.  
> `until` runs while the condition is false.

---

## Read File Line by Line

```bash
while IFS= read -r line; do
    echo "$line"
done < file.txt
```

> This is a safe common pattern for reading text files line by line.

---

## Infinite Loop

```bash
while :; do
    # code
done
```

### Example

```bash
while :; do
    echo "Running..."
    sleep 1
done
```

Stop with `Ctrl+C`.

---

# Functions

## Define a Function

Use the following syntax to define a function:

```bash
func() {
    # code
}
```

### Example

```bash
hello() {
    echo "Hello!"
}

hello
```

Output:

```text
Hello!
```

---

## Alternative Function Syntax

```bash
function func {
    # code
}
```

> `func() { ...; }` is generally preferred because it is more portable across POSIX-like shells, although this guide targets Bash.

---

## Function Arguments

```bash
greet() {
    echo "Hello $1"
}

greet "Ali"
```

Output:

```text
Hello Ali
```

> Inside a function, `$1`, `$2`, `$#`, `$@`, etc. refer to the function's positional parameters.

---

## Return Status

Use `return` to set a function's exit status.

```bash
return 0
```

### Example

```bash
check_file() {
    [[ -f "$1" ]] || return 1
    return 0
}

check_file "config.txt"

if [[ $? -eq 0 ]]; then
    echo "File exists"
fi
```

---

## Capture Function Output

Use command substitution to capture a function's stdout.

```bash
result=$(func)
```

### Example

```bash
get_name() {
    echo "Ali"
}

name=$(get_name)

echo "$name"
```

Output:

```text
Ali
```

> Command substitution captures the function's stdout. The function's exit status can still be checked separately.

---

# Input / Output

## Echo

```bash
echo "Hello"
```

Output:

```text
Hello
```

---

## Echo Without Newline

```bash
echo -n "Hello"
```

---

## Escape Sequences

```bash
echo -e "A\tB"
```

Possible output:

```text
A       B
```

> For predictable formatted output, `printf` is generally preferred over `echo -e`.

---

## Read Input

```bash
read var
```

### Example

```bash
read name
echo "Hello $name"
```

---

## Read With Prompt

```bash
read -r -p "Name: " name
```

---

## Silent Input

```bash
read -r -s password
```

> Useful for passwords because input is not displayed.

---

## Raw Input

```bash
read -r var
```

> `-r` prevents backslashes from being interpreted as escape characters.

---

# Redirection

## Redirect stdout

```bash
cmd > file
```

### Example

```bash
echo "Hello" > output.txt
```

> Creates the file or overwrites it.

---

## Append stdout

```bash
cmd >> file
```

### Example

```bash
echo "New line" >> output.txt
```

> Appends instead of overwriting.

---

## Redirect stderr

```bash
cmd 2> file
```

### Example

```bash
ls /not-found 2> error.log
```

---

## Redirect stderr to stdout

```bash
cmd 2>&1
```

### Example

```bash
cmd > output.log 2>&1
```

> Redirects both stdout and stderr to the same file.

---

## Redirect stdout and stderr

```bash
cmd &> file
```

> Bash-specific shorthand for redirecting both stdout and stderr.

---

## Redirect stdin

```bash
cmd < file
```

### Example

```bash
wc -l < file.txt
```

---

## Pipe

```bash
cmd1 | cmd2
```

### Example

```bash
ps aux | grep bash
```

> Sends stdout of the first command to stdin of the second command.

---

# Here Documents

## Basic Here Document

```bash
cat <<EOF
Hello
Bash
EOF
```

Output:

```text
Hello
Bash
```

---

## Variable Expansion

```bash
name="Ali"

cat <<EOF
Hello $name
EOF
```

Output:

```text
Hello Ali
```

---

## Disable Expansion

```bash
cat <<'EOF'
Hello $name
EOF
```

Output:

```text
Hello $name
```

> Quoting the delimiter prevents parameter expansion, command substitution, and arithmetic expansion.

---

## Add text in file
```bash
cat <<EOF > output.txt
Hello
Bash
This is a test
EOF
```
> For **Append** Use `cat <<EOF >> output.txt`

---
## Strip Leading Tabs

```bash
cat <<-EOF
	Hello
	Bash
EOF
```

> `<<-` removes leading tab characters from the here-document body.

---

## Here String

```bash
cmd <<< "string"
```

### Example

```bash
wc -c <<< "Hello"
```

> Sends a single string to stdin.

---

# Select Menu

`select` is a Bash-specific construct for creating simple interactive menus.

```bash
select opt in Start Stop Exit; do
    echo "You chose: $opt"
    break
done
```

Example interaction:

```text
1) Start
2) Stop
3) Exit
#?
```

---

## `$REPLY`

```bash
select opt in Start Stop Exit; do
    echo "Option: $opt"
    echo "Input: $REPLY"
    break
done
```

> `$REPLY` contains the user's entered menu number.

---

## Break

```bash
break
```

> Exits the current loop.

---

# Debugging

## Trace Script

Use `bash -x script.sh` to trace command execution.

```bash
bash -x script.sh
```

> Prints commands as Bash executes them.

---

## Enable Tracing

```bash
set -x
```
> Show command befor execute
---

## Disable Tracing

```bash
set +x
```

---

## Print Shell Input

```bash
set -v
```

> Prints shell input lines as they are read.( Like `set -x`)

---

## Exit on Error

```bash
set -e
```

> Causes the shell to exit when a simple command fails, subject to Bash's rules and exceptions.

---

## Error on Unset Variables

```bash
set -u
```

### Example

```bash
set -u

echo "$undefined"
```

> Bash reports an error because the variable is unset.

---

## Pipefail

```bash
set -o pipefail
```

> Makes a pipeline fail if any command in the pipeline fails, rather than only considering the final command.

---

## Recommended Strict Mode

A common Bash scripting pattern is:

```bash
set -Eeuo pipefail
```

> Enables stricter error handling and can help catch bugs earlier.

### Example

```bash
#!/usr/bin/env bash

set -Eeuo pipefail

echo "Script started"
```

---

# Useful Patterns

## Default Value From Command

```bash
${var:-$(cmd)}
```

### Example

```bash
name="${USER:-$(whoami)}"

echo "$name"
```

---

## Source File If It Exists

```bash
[[ -f "$f" ]] && source "$f"
```

### Example

```bash
config="config.sh"

[[ -f "$config" ]] && source "$config"
```

---

## Safely Read Lines

```bash
while IFS= read -r line; do
    echo "$line"
done < file.txt
```

> `IFS=` and `-r` help preserve whitespace and backslashes.

---

## Safe Array Expansion

```bash
"${arr[@]}"
```

### Example

```bash
arr=("hello world" "Linux" "Bash")

for item in "${arr[@]}"; do
    echo "$item"
done
```

Output:

```text
hello world
Linux
Bash
```

---

## Append an Argument

```bash
set -- "$@" newarg
```

### Example

```bash
set -- "$@" backup

printf '<%s>\n' "$@"
```

Output:

```text
<backup>
```

> `set --` replaces the positional parameters. This example appends `backup` to the existing arguments.

---

# Configuration Files

## `~/.bashrc`

`~/.bashrc` is commonly used for interactive non-login Bash shells.

Typical uses:

```bash
alias ll='ls -lah'
export EDITOR=vim
```

---

## `~/.bash_profile`

`~/.bash_profile` is used by Bash login shells when present.

---

## `~/.profile`

`~/.profile` is a generic login-shell configuration file used by many shells and environments.

---

## `~/.bash_aliases`

`~/.bash_aliases` is a common location for user-defined aliases when sourced by `.bashrc`.

---

## `/etc/bash.bashrc`

`/etc/bash.bashrc` is a system-wide Bash configuration file on distributions that provide it.

---

## `/etc/profile`

`/etc/profile` is used for system-wide login-shell configuration.

> ⚠️ Configuration file behavior can vary between Linux distributions and shell startup modes.

---

# 📦 Additional Resources

- [**ShellCheck**](https://www.shellcheck.net/) — Static analysis tool for shell scripts.
- [**Bash Reference Manual**](https://www.gnu.org/software/bash/manual/) — Official Bash documentation.
- [**Bash Hackers Wiki**](https://wiki.bash-hackers.org/) — Bash knowledge and examples.
- [**ExplainShell**](https://explainshell.com/) — Helps explain shell commands.


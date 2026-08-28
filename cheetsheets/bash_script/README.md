# 🚀 Bash Scripting Cheat Sheet

A comprehensive, professional reference guide for Bash scripting.

---

## 📋 Table of Contents

1. [Script Basics](#script-basics)
2. [Variables](#variables)
3. [Special Variables](#special-variables)
4. [Quoting](#quoting)
5. [String Operations](#string-operations)
6. [String Concatenation](#string-concatenation)
7. [Default Values](#default-values)
8. [Arrays](#arrays)
9. [Arithmetic](#arithmetic)
10. [Conditionals](#conditionals)
11. [Test Command](#test-command)
12. [Numeric Comparisons](#numeric-comparisons)
13. [File Tests](#file-tests)
14. [Logical Operators](#logical-operators)
15. [Case Statement](#case-statement)
16. [For Loop](#for-loop)
17. [While & Until Loops](#while--until-loops)
18. [Functions](#functions)
19. [Input/Output](#inputoutput)
20. [Redirection](#redirection)
21. [Here Documents](#here-documents)
22. [Select Menu](#select-menu)
23. [Debugging](#debugging)
24. [Useful Patterns](#useful-patterns)
25. [Configuration Files](#configuration-files)

---

## Script Basics

```bash
#!/bin/bash
```
> Shebang - tells the system which interpreter to use

```bash
#!/usr/bin/env bash
```
> Portable shebang - uses environment's Bash

```bash
# comment
```
> Single line comment

```bash
chmod +x script.sh
```
> Make script executable

```bash
./script.sh
```
> Run script

```bash
source script.sh
```
> Run in current shell

```bash
. script.sh
```
> Same as source

---

## Variables

```bash
var="value"
```
> Assign variable (no spaces!)

```bash
$var
```
> Use variable

```bash
${var}
```
> Use variable (explicit)

```bash
readonly var
```
> Make read-only

```bash
unset var
```
> Delete variable

```bash
export var
```
> Export to environment

```bash
env
```
> List environment vars

---

## Special Variables

| Variable | Description |
|----------|-------------|
| `$0` | Script name |
| `$1` - `$9` | Positional parameters |
| `${10}` | 10th+ parameter |
| `$#` | Number of arguments |
| `$@` | All arguments (separate) |
| `$*` | All arguments (single) |
| `$?` | Last exit status |
| `$$` | Current PID |
| `$!` | Last background PID |

---

## Quoting

```bash
"$var"
```
> Double quotes (expands vars)

```bash
'$var'
```
> Single quotes (literal)

```bash
\$
```
> Escape special char

```bash
`cmd`
```
> Command substitution (old)

```bash
$(cmd)
```
> Command substitution

```bash
$((expr))
```
> Arithmetic expansion

---

## String Operations

```bash
${#var}
```
> String length

```bash
${var:0:5}
```
> Substring (pos 0, len 5)

```bash
${var#pattern}
```
> Remove prefix (shortest)

```bash
${var##pattern}
```
> Remove prefix (longest)

```bash
${var%pattern}
```
> Remove suffix (shortest)

```bash
${var%%pattern}
```
> Remove suffix (longest)

```bash
${var/old/new}
```
> Replace first

```bash
${var//old/new}
```
> Replace all

---

## String Concatenation

```bash
$a$b
```
> Concatenate variables

```bash
"${a}${b}"
```
> Safe concatenation

```bash
"$a and $b"
```
> With literal text

```bash
var+="more"
```
> Append to variable

---

## Default Values

```bash
${var:-default}
```
> Use default if unset

```bash
${var:=default}
```
> Set default if unset

```bash
${var:+value}
```
> Use value if set

```bash
${var:?error}
```
> Error if unset

---

## Arrays

```bash
arr=(a b c)
```
> Declare array

```bash
arr[0]="value"
```
> Set element

```bash
${arr[0]}
```
> Get element

```bash
${arr[@]}
```
> All elements

```bash
${#arr[@]}
```
> Array length

```bash
${!arr[@]}
```
> All indices

```bash
arr+=("d" "e")
```
> Append elements

```bash
unset arr[1]
```
> Delete element

---

## Arithmetic

```bash
$((a + b))
```
> Addition

```bash
$((a - b))
```
> Subtraction

```bash
$((a * b))
```
> Multiplication

```bash
$((a / b))
```
> Division

```bash
$((a % b))
```
> Modulo

```bash
$((a ** b))
```
> Exponent

```bash
((i++))
```
> Increment

```bash
((i--))
```
> Decrement

```bash
((i += 5))
```
> Add and assign

---

## Conditionals

```bash
if [[ cond ]]; then
    # code
elif [[ cond ]]; then
    # code
else
    # code
fi
```
> If-elif-else conditional block

```bash
[[ cond ]] && cmd
```
> Short-circuit and

```bash
[[ cond ]] || cmd
```
> Short-circuit or

---

## Test Command

```bash
[[ -z $str ]]
```
> String is empty

```bash
[[ -n $str ]]
```
> String not empty

```bash
[[ $a == $b ]]
```
> Strings equal

```bash
[[ $a != $b ]]
```
> Strings not equal

```bash
[[ $a =~ regex ]]
```
> Regex match

```bash
[[ $a == *pattern* ]]
```
> Glob pattern match

---

## Numeric Comparisons

```bash
[[ $a -eq $b ]]
```
> Equal

```bash
[[ $a -ne $b ]]
```
> Not equal

```bash
[[ $a -lt $b ]]
```
> Less than

```bash
[[ $a -le $b ]]
```
> Less or equal

```bash
[[ $a -gt $b ]]
```
> Greater than

```bash
[[ $a -ge $b ]]
```
> Greater or equal

```bash
(( a == b ))
```
> Equal (arithmetic)

```bash
(( a < b ))
```
> Less than (arithmetic)

---

## File Tests

```bash
[[ -e $file ]]
```
> File exists

```bash
[[ -f $file ]]
```
> Is regular file

```bash
[[ -d $file ]]
```
> Is directory

```bash
[[ -L $file ]]
```
> Is symlink

```bash
[[ -r $file ]]
```
> Is readable

```bash
[[ -w $file ]]
```
> Is writable

```bash
[[ -x $file ]]
```
> Is executable

```bash
[[ -s $file ]]
```
> Size > 0

```bash
[[ $a -nt $b ]]
```
> a newer than b

---

## Logical Operators

```bash
[[ cond1 && cond2 ]]
```
> AND

```bash
[[ cond1 || cond2 ]]
```
> OR

```bash
[[ ! cond ]]
```
> NOT

```bash
[[ (cond1) ]]
```
> Grouping

---

## Case Statement

```bash
case $var in
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
> Case statement structure

---

## For Loop

```bash
for i in 1 2 3; do
    echo $i
done
```
> Loop over list

```bash
for i in "${arr[@]}"; do
    echo $i
done
```
> Loop over array

```bash
for i in *.txt; do
    echo "$i"
done
```
> Loop over files

```bash
for i in {1..10}; do
    echo $i
done
```
> Loop over range

```bash
for ((i=0; i<10; i++)); do
    echo $i
done
```
> C-style for loop

---

## While & Until Loops

```bash
while [[ cond ]]; do
    # code
done
```
> While loop

```bash
until [[ cond ]]; do
    # code
done
```
> Until loop

```bash
while read -r line; do
    echo "$line"
done < file
```
> Read file lines

```bash
while :; do
    # code
done
```
> Infinite loop

---

## Functions

```bash
func() {
    # code
}
```
> Define function

```bash
function func {
    # code
}
```
> Alternative syntax

```bash
func arg1 arg2
```
> Call function

```bash
$1, $2
```
> Function arguments

```bash
local var="val"
```
> Local variable

```bash
return 0
```
> Return exit code

```bash
result=$(func)
```
> Capture output

---

## Input/Output

```bash
echo "text"
```
> Print with newline

```bash
echo -n "text"
```
> Print without newline

```bash
echo -e "a\tb"
```
> Enable escapes

```bash
printf "%s\n" "$var"
```
> Formatted output

```bash
read var
```
> Read into variable

```bash
read -p "prompt: " var
```
> Read with prompt

```bash
read -s var
```
> Read silently

```bash
read -r var
```
> Raw input (no escapes)

---

## Redirection

```bash
cmd > file
```
> Redirect stdout

```bash
cmd >> file
```
> Append stdout

```bash
cmd 2> file
```
> Redirect stderr

```bash
cmd 2>&1
```
> Stderr to stdout

```bash
cmd &> file
```
> Both to file

```bash
cmd < file
```
> Redirect stdin

```bash
cmd1 | cmd2
```
> Pipe stdout

---

## Here Documents

```bash
cat <<EOF
Multi-line text
EOF
```
> Here document

```bash
cat <<'EOF'
No expansion
EOF
```
> No expansion

```bash
cat <<-EOF
    Strip tabs
EOF
```
> Strip leading tabs

```bash
cmd <<< "string"
```
> Here string

---

## Select Menu

```bash
select opt in a b c; do
    echo "You chose: $opt"
    break
done
```
> Create menu

```bash
$opt
```
> Selected option

```bash
$REPLY
```
> User's input

```bash
break
```
> Exit menu

---

## Debugging

```bash
bash -x script.sh
```
> Trace execution

```bash
set -x
```
> Enable tracing

```bash
set +x
```
> Disable tracing

```bash
set -v
```
> Print input lines

```bash
set -e
```
> Exit on error

```bash
set -u
```
> Error on unset vars

```bash
set -o pipefail
```
> Pipe error status

---

## Useful Patterns

```bash
${var:-$(cmd)}
```
> Default from command

```bash
[[ -f $f ]] && source $f
```
> Source if exists

```bash
while IFS= read -r line
```
> Read lines safely

```bash
"${arr[@]}"
```
> Safe array expansion

```bash
set -- "$@" newarg
```
> Append to args

---

## Configuration Files

```bash
~/.bashrc
```
> Interactive non-login

```bash
~/.bash_profile
```
> Login shell

```bash
~/.profile
```
> Generic login

```bash
~/.bash_aliases
```
> Alias definitions

```bash
/etc/bash.bashrc
```
> System-wide

```bash
/etc/profile
```
> System login

---

## 📦 Additional Resources

- **[ShellCheck](https://www.shellcheck.net/)** - Online Bash linting tool
- **[Bash Reference Manual](https://www.gnu.org/software/bash/manual/)** - Official documentation
- **[Bash Hackers Wiki](https://wiki.bash-hackers.org/)** - Community knowledge base
- **[Explainshell](https://explainshell.com/)** - Explains shell commands

---

## 📝 License

This cheat sheet is open source. Feel free to use, modify, and share!

---

**⭐ Star this repository if you find it useful!**

*Last Updated: 2024*

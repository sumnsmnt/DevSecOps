# 01. Shell Scripting Basics

## What I learn:
* tumx
* for loop
* cut, awk, grep, e-grep
* variable declaration
* aws cli
* writing shell scripting
* debugging

### Task 1: Use Tmux
We can break the console/terminal into multiple screen:
- Useful for monitoring multiple servers or sessions.
- Horizontal Split: `Ctrl + b`, then `Shift + "`.
- Vertical Split: `Ctrl + b`, then `Shift + 5`.

### Task 2: Print Time Repeatedly
Print the date and time every second for 10 seconds:
```bash
for i in {1..10}
do
  echo $(date)
  sleep 1
done
```

> **Note:** To get only the day, date, and time, modify the above script using `awk`:
```bash
for i in {1..10}
do
  echo $(date) | awk -F " " '{print $1, $2, $3, $4}'
  sleep 1
done
```

### Task 3: Understanding Variables in Shell Scripting
Variable declaration is useful for repeated values.
1. Declaring a variable and using it:
   ```bash
   NAME='Suman Samanta'
   echo $NAME
   echo "${NAME}"
   ```

2. Using variables with single and double quotes:
   ```bash
   X=2024
   NAME='Suman Samanta $X'  # Won't expand the variable
   echo $NAME  # Outputs: Suman Samanta $X

   NAME='Suman Samanta $X"  # Will expand the variable
   echo $NAME  # Outputs: Suman Samanta 2024
   ```

---

### Task 4: AWS CLI and Data Manipulation

**S3 Bucket Example:**
1. List the contents of an S3 bucket:
   ```bash
   aws s3 ls
   ```

2. Use `cut` to extract specific fields:
   ```bash
   aws s3 ls | cut -d " " -f 1, 2, 3
   ```

3. Use `awk` for more complex field manipulation:
   ```bash
   aws s3 ls | awk -F " " '{print $3, $2, $1}'
   ```

4. Use `grep` to find specific patterns:
   ```bash
   aws s3 ls | grep -E www[.]
   ```

---

**Shell Script Example:** `get_bucket.sh`

```bash
#!/bin/bash
aws s3 ls | cut -d " " -f 3 | grep -E ^www[.]
echo "Hello, Welcome to DevSecOps!"
```

**Debugging Scripts**

To enable debugging in a script:
```bash
#!/bin/bash
set -x  # Enable debugging
```

This will print each command before executing it, helping you to debug.
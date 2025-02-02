# PowerShell Touch Alias

A PowerShell function that emulates the Unix/Linux `touch` command with an added twist: you can provide optional file content. This alias allows you to quickly create new files (or update existing ones) with content in a new project folder—boosting your productivity.

## Quick-Start

**What It Does:** </br>
Provides a touch command for PowerShell that creates or updates files in a way similar to Unix/Linux for a very fast way to create files of different types with of without initial text content.

**Installation:** </br>
Add the contents from the .ps1 script to your PowerShell profile via `notepad $PROFILE` and ensure scripts are allowed by setting an appropriate execution policy.

**Execution Policy Options:** </br>
Use either the global `Set-ExecutionPolicy RemoteSigned` (or with the `-scope CurrentUser` scope limiter)

**How to Use:**
```powershell
touch script1.py print("Hello World!")
```

---

## Table of Contents

- [Overview](#Overview)
- [Features](#Features)
- [Usage](#Usage)
- [Installation](#Installation)
- [Help & Documentation](#Help--Documentation)
- [Credits](#Credits)
- [License](#License)

---

## Overview

This project provides a single PowerShell function, `touch`, which parses the full raw command line to extract a file name and optional content.  
- **Without content:** The function behaves like the traditional `touch` command by updating the file's timestamp or creating an empty file if it doesn't exist.
- **With content:** The function creates or overwrites the file with the provided content.

---

## Features

- **Quick File Creation:** </br>
  Create or update files with a single command.
  
- **Optional Content:**  </br>
  Supply content directly from the command line—ideal for bootstrapping new project files.

- **Raw Input Parsing:**  </br>
  Uses `$MyInvocation.Line` to capture the full command line, allowing for flexible parameter usage.

---

## Usage

### Basic Syntax in powershell
```powershell
touch $filePath [$fileContent]
```

### Examples
Create or update a file without content (touch only updates the timestamp or creates an empty file):
```powershell
touch script1.py
```

### Create or update a file with content:
```powershell
touch script1.py print("Hello World!")
```

This command creates (or updates) script1.py with the exact content:
```
print("Hello World!")
```
---

## Installation
To add the `touch` function to your PowerShell profile:

1. Open your PowerShell profile:
```powershell
notepad $PROFILE
```

2. Copy and paste the entire script from the `Microsoft.PowerShell_profile.ps1` script file inside your profile file (above step)

3. Save the file and restart your PowerShell session.

4. (might be required) If powershell gives you error about scripts not being allowed to run, you need to either allow locally made (not from internet) scripts to be ran by any user, or just the current user

    To do this, open your powershell as an administrator (`CTRL` + `SHIFT` when opening the powershell or when creating a new tab in Terminal)

### **For any user:**
```powershell
Set-ExecutionPolicy RemoteSigned
```
### **For current user only:**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Now, the `touch` function should be available in every new session.

---

## Help--Documentation

```
.SYNTAX
    touch $filename [$content]

.SYNOPSIS
    Emulates the Unix/Linux touch command in PowerShell, and adds the ability to add a string content for the file as an optional parameter.
    Allows for fast creation of files of any extension in a new project folder.
    Very useful for example when creating file/folder structure for a new project in VSCode

.DESCRIPTION
    This function parses the full raw command line to extract the file name and optional content.
    - The first token is taken as the file name.
    - Everything following the file name is treated as file content.
    
    If content is provided, the file is created or overwritten with that content.
    If no content is provided, the function updates the file''s last modified timestamp (if it exists)
    or creates an empty file if it does not.

.EXAMPLE
    touch script1.py print("Hello World!")
    Creates (or updates) a file named "script1.py" with the content:
    print("Hello World!")
```

---

## Credits

Developed by **Santtu Kähkönen - KnightOwls** </br>
https://github.com/Songfugel</br>
Available at https://github.com/Songfugel/Powershell-Touch-Alias

Inspired by the Unix/Linux "touch" command.

---

## License

```
Copyright (c) [2025] Santtu Kähkönen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

### Enjoy your new PowerShell alias! If you have any issues or suggestions, feel free to open an issue or contribute.



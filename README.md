# PowerShell Touch Alias

A PowerShell function that emulates the Unix/Linux `touch` command with an added twist: you can provide optional file content. This alias allows you to quickly create new files (or update existing ones) with content in a new project folder—boosting your productivity.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [Help & Documentation](#help--documentation)
- [Credits](#credits)
- [License](#license)

---

## Overview

This project provides a single PowerShell function, `touch`, which parses the full raw command line to extract a file name and optional content.  
- **Without content:** The function behaves like the traditional `touch` command by updating the file's timestamp or creating an empty file if it doesn't exist.
- **With content:** The function creates or overwrites the file with the provided content.

---

## Features

- **Quick File Creation:**  
  Create or update files with a single command.
  
- **Optional Content:**  
  Supply content directly from the command line—ideal for bootstrapping new project files.

- **Raw Input Parsing:**  
  Uses `$MyInvocation.Line` to capture the full command line, allowing for flexible parameter usage.

---

## Usage

### Basic Syntax in powershell
touch <filePath> [fileContent]

### Examples
Create or update a file without content (touch only updates the timestamp or creates an empty file):
**touch script1.py**

### Create or update a file with content:
**touch script1.py print("Hello World!")**

This command creates (or updates) script1.py with the exact content:
_print("Hello World!")_

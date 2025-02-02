function touch {
<#
.Name
touch

.Synopsis
Emulates the Unix/Linux touch command in PowerShell, and adds the ability to add a string content for the file as an optional parameter. Allows for fast creation of files in a new project folder.

.Syntax
touch <fileName> ["Content"]

.Description
This function parses the full raw command line to extract the file name and optional content.
- The first token is taken as the file name.
- Everything following the file name is treated as file content.
If content is provided, the file is created or overwritten with that content.
If no content is provided, the function updates the file's last modified timestamp (if it exists) or creates an empty file if it does not.

.Example
touch script1.py print("Hello World!")
Creates (or updates) a file named "script1.py" with the content: print("Hello World!")

.Credits
Developed by Santtu Kahkonen - KnightOwls
https://github.com/Songfugel
Inspired by the Unix/Linux "touch" command.

.Link
https://github.com/Songfugel/Powershell-Touch-Alias

.License
Copyright (c) [2025] Santtu Kähkönen.
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

.Notes
This function does not declare any explicit parameters; it relies on parsing the raw input ia $MyInvocation.Line with optional parameters.

.Version
1.0
#>

    [CmdletBinding()]
    param (
	[Parameter(Mandatory=$true)]
        [string]$fileName,
        [string]$Content
    )

    # Get the full raw command line that invoked the function.
    $line = $MyInvocation.Line.Trim()

    # Remove the command name ("touch") and following whitespace.
    if ($line -match '^touch\s+(.+)$') {
        $argsPart = $matches[1]
    }
    else {
        Write-Error "Could not parse command line."
        return
    }

    # Now, extract the file name and the rest as content.
    # This regex expects the file name first (which may be quoted) and then the content.
    $regex = '^(?:"([^"]+)"|''([^'']+)''|(\S+))\s*(.*)$'
    if ($argsPart -match $regex) {
        # Determine which capture group got the file name.
        $FilePath = if ($matches[1]) { $matches[1] } elseif ($matches[2]) { $matches[2] } else { $matches[3] }
        $Content = $matches[4]
    }
    else {
        Write-Error "Could not parse arguments."
        return
    }

    if ($Content -ne "") {
        Set-Content -Path $FilePath -Value $Content
    }
    else {
        if (Test-Path $FilePath) {
            (Get-Item $FilePath).LastWriteTime = Get-Date
        }
        else {
            New-Item $FilePath -ItemType File | Out-Null
        }
    }
}

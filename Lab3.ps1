<#

Purpose: Lab 3 
Using: Here-Strings, Piping commands, Writing and Reading files, Conditional logic


Author: Yona Cooperman
File: Lab3.ps1
Date: Feb 24, 2020

#>

Clear-Host

Set-Location $env:USERPROFILE

Get-ChildItem -Include *.txt -Recurse | Format-Table -Property Name, Length

$menu = @"
What do you want to do?
    1. Write a contact entry to a file
    2. Display all files last written to after a given date
    3. Read a specified text file


"@
$menu

$choice = Read-Host "Enter the number of your choice"

if ($choice -eq 1) {
    $name = Read-Host "Full contact name"
    $number = Read-Host "Number"
    $email = Read-Host "Email address"
    $cfile = Read-Host "Name the entry file"
    Add-Content -Path "$cfile.txt" -Value "`n$name, `n$number, `n$email, `n"
}

elseif ($choice -eq 2) {
    $date = Read-Host "What is the earliest date for LastWriteTime"
    Get-ChildItem  | Format-Table -Property Name, LastWriteTime
}

elseif ($choice -eq 3) {
    $file = Read-Host "What file would you like to read"
    $exists = Test-Path $env:userprofile\$file
    if ($exists -eq $True) {Get-Content $env:userprofile\$file}
    else {Write-Host "The file $file does not exist."}

}

else {
    Write-Output "$env:username entered an invalid response on $env:computername"
}
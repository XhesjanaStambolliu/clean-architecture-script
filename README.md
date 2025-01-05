# Clean Architecture Project Setup Script

This script helps you create a Clean Architecture project using .NET, automating the process of setting up the solution, projects, and dependencies.

## Features

- Creates a solution and projects (`API`, `Application`, `Domain`, `Persistence`) following Clean Architecture principles.
- Automatically adds projects to the solution.
- Sets up project references between layers.
- Restores dependencies with `dotnet restore`.

## Prerequisites

- [Install .NET SDK](https://dotnet.microsoft.com/download)
- PowerShell installed on your system (comes pre-installed on Windows).

## How to Use

1. **Download the script**:
   Save the script as `create-clean-architecture-project.ps1`.

2. **Open PowerShell**:
   Open PowerShell and navigate to the directory where you saved the script.

3. **Run the script**:
   Execute the script with the following command:
   ```powershell
   .\create-clean-architecture-project.ps1

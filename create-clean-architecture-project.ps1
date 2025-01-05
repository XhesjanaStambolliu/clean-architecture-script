# Prompt the user to set the name of the project
$ProjectName = Read-Host "Set the name of your project"

# Check if the user provided a valid project name
if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    Write-Host "You must provide a valid project name. Exiting..." -ForegroundColor Red
    exit
}

# Define the base path where the project will be created
$BasePath = "$env:USERPROFILE\source\repos"
$ProjectPath = Join-Path -Path $BasePath -ChildPath $ProjectName

# Check if the base path exists, if not, create it
if (-Not (Test-Path -Path $BasePath)) {
    Write-Host "The base path $BasePath does not exist. Creating it..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $BasePath
}

# Create the project directory
Write-Host "About to create the directory $ProjectPath" -ForegroundColor Green
New-Item -ItemType Directory -Path $ProjectPath -Force
Set-Location -Path $ProjectPath

# Create the solution and projects
Write-Host "About to create the solution and projects" -ForegroundColor Green
dotnet new sln -n $ProjectName
dotnet new webapi -n API --use-controllers
dotnet new classlib -n Application
dotnet new classlib -n Domain
dotnet new classlib -n Persistence

# Add the projects to the solution
Write-Host "Adding projects to the solution" -ForegroundColor Green
dotnet sln add API/API.csproj
dotnet sln add Application/Application.csproj
dotnet sln add Domain/Domain.csproj
dotnet sln add Persistence/Persistence.csproj

# Add project references
Write-Host "Adding project references" -ForegroundColor Green
Set-Location -Path "API"
dotnet add reference ../Application/Application.csproj
Set-Location -Path "../Application"
dotnet add reference ../Domain/Domain.csproj
dotnet add reference ../Persistence/Persistence.csproj
Set-Location -Path "../Persistence"
dotnet add reference ../Domain/Domain.csproj
Set-Location -Path ..

# Run dotnet restore
Write-Host "Executing dotnet restore" -ForegroundColor Green
dotnet restore

# Notify the user of completion
Write-Host "Finished! Your Clean Architecture project has been created in $ProjectPath" -ForegroundColor Green

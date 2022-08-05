# dev-aliases
My development environment commands' aliases for Windows

## Installation

### Step 1: Pull the files

- Go to the root folder of the `C:\` drive (or whatever your root folder is) then create `aliases` folder
- Clone this repository to the `aliases` folder (hint: use `git clone https://github.com/EgoistDeveloper/dev-aliases-windows`)

### Step 2: Define environment variables

- Press `Win Key + S` and search for `Environment Variables`
- Click `Environment Variables...` button (right bottom)
- In `System Variables` section find `Path` record and open with double click
- Press `New` button and add new record as your aliases folder path
- Confirm all screen with `OK` button

### Apply changes

- Restart your all CMD and PowerShell instances
- Also when you add new command `alias.bat` you may need to restart your CMD and PowerShell instances

See more info: [Source](https://stackoverflow.com/a/39459404/6940144)

## Usage

Long command is `php artisan serve`. Short command is `pas`. We are calling aliases by file name.
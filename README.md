# OKBackup
This script backs up your OKCupid profile content to a local git repository, for full version control. Each essay answer on your profile is assigned to a separate text file.

## Backup location
A new folder will be created in your home directory called `~/.okcupid`. After your first backup, your essays will be located under `~/.okcupid/backup/<okcupid_username>/_content`. Any HTML formatting found in your essay content will be preserved with HTML markup.

## Installation
Clone the repository
`git clone https://github.com/prokizzle/okbackup && cd okbackup`

Install dependencies
`bundle install`

_Chromedriver will be installed automatically._

To set up your backup directory and git repository, simply run `rake backup:init`

## Usage
run `rake backup:start` to backup your profile content. This will update the files and create a commit with the message 'profile backup'
require 'highline/import'
require_relative 'lib/ok_backup'

namespace :backup do
  task :init do
    path = "#{ENV['HOME']}/.okcupid/"
    unless File.directory?("#{path}/.git")
      puts %x{mkdir -p #{path};}
      puts %x{cd #{ENV['HOME']}/.okcupid/; git init; git add .;git commit -m 'profile backup'}
    else
      puts "Backup directory already initiated."
    end

  end

  task :start do

    if File.directory?("#{ENV['HOME']}/.okcupid/")
      username = ask("username: ")
      password = ask("password: "){|q| q.echo = "*"}
      path = "#{ENV['HOME']}/.okcupid/backup/#{username}/_content"
      %x{mkdir -p #{path}}
      versioner = OKBackup::EssayVersions.new(username, password)
      versioner.backup_profile(path)
      puts %x{cd #{path}; git add .;git commit -m 'profile backup';}
      #backup essays to text files
    else
      puts "No backup directory found. Please run 'rake backup:init' first."
    end
  end
end

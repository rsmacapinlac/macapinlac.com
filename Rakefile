require 'dotenv/tasks'

task :clean do
  sh "bundle exec jekyll clean"
end

task :build => [:clean] do
  sh "bundle exec jekyll build"
end

task :serve => [:clean] do
  sh "bundle exec jekyll server -D -H 0.0.0.0"
end

task :publish => [:build, :dotenv] do
  command = "ncftpput -R -v -u " + ENV['FTPUSERNAME'] + " -p " + ENV['FTPPASSWORD'] + " " + ENV['FTPSERVER'] + " " + ENV['FTPREMOTEFOLDER'] + " _site"
  sh command
end


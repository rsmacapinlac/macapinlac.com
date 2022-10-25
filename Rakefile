require 'dotenv/tasks'
require 'rake'

namespace 'site' do
  task :clean do
    sh "bundle exec jekyll clean"
  end

  task :build => [:clean] do
    sh "bundle exec jekyll build"
  end

  desc 'Run the local webserver'
  task :serve => [:clean] do
    sh "bundle exec jekyll server -D -H 0.0.0.0 --lsi --trace"
  end

  desc 'FTP the _site folder (configuration via dotenv)'
  task :publish => [:build, :dotenv] do
    command = "ncftpput -R -v -u " + ENV['FTPUSERNAME'] + " -p " + ENV['FTPPASSWORD'] + " " + ENV['FTPSERVER'] + " " + ENV['FTPREMOTEFOLDER'] + " _site/*"
    sh command
  end
end

namespace 'post' do
  desc 'Create a new post (in the _drafts) folder (ex rake \'post:new[new post title]\')'
  task :new, [:title] do |t, args|
    @title = args[:title]
    @slug = build_slug(args[:title])

    FileUtils.mkdir '_drafts' unless File.exist? '_drafts'

    FileUtils.touch("_drafts/#{@slug}.md")
    open("_drafts/#{@slug}.md", 'a' ) do |file|
      file.puts "---"
      file.puts "layout: post"
      file.puts "title: #{@title}"
      # file.puts "description: maximum 155 char description"
      # file.puts "category: blog"
      # file.puts "tag: blog"
      file.puts "\n"
      file.puts "---"
    end
  end

  desc 'Ready a post for publishing, leave date empty for today (eg rake post:ready[\'post title\', \'2021-03-11\'])'
  task :ready, [:title, :postdate] do |t, args|
    @slug = build_slug(args[:title])
    @file_name = build_filename(args[:title])
    @drafts_path = File.join  "_drafts", @file_name 
    return unless File.exist? @drafts_path

    @postdate = args[:postdate]
    if @postdate.nil?
      @postdate = Time.now.strftime("%F") 
    end

    dest_path = File.join "_posts", "blog", "#{@postdate}-#{@file_name}"
    FileUtils.mv @drafts_path, dest_path
  end

  def build_slug(slug)
    @slug = slug
    @slug = @slug.tr('ÁáÉéÍíÓóÚú', 'AaEeIiOoUu')
    @slug = @slug.downcase.strip.gsub(' ', '-')

    return @slug
  end
  def build_filename(slug)
    "#{build_slug(slug)}.md"
  end
end


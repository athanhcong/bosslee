require 'rubygems'
require 'optparse'
require 'yaml'
 
task :np do
  OptionParser.new.parse!
  ARGV.shift
  title = ARGV.join(' ')
 
  path = "_posts/#{Date.today}-#{title.downcase.gsub(/[^[:alnum:]]+/, '-')}.md"
  
  if File.exist?(path)
  	puts "[WARN] File exists - skipping create"
  else
    File.open(path, "w") do |file|
      file.puts YAML.dump(
        {
          'layout' => 'post',
          'published' => false,
          'title' => title,
          'categories' => false,
          'post-link' => false,
        }
          )
      file.puts "---"
    end
  end
  `open -a Byword.app #{path}`
 
  exit 1
end
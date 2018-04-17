require "hashnamer_ruby/version"
require "digest"

module HashnamerRuby

  puts "This will rename all files in the directories you specified, are you sure?"
  got = STDIN.gets.chomp
  if got != "yes"
    puts "ok, cancelling"
    exit -1
  end

  md5 = Digest::MD5.new
  $*.each {|dir_to_search|
    Dir.entries(dir_to_search).select {|f| !File.directory?(f)}.each do |file|
      File.open("#{dir_to_search}/#{file}") do |filecontent|
        newname = "#{dir_to_search}/##{md5.hexdigest(filecontent.to_s)}#{(
        if !file.include?(".")
          ""
        else
          ".#{file.split(".").last}"
        end)}"
        puts ":: " + newname
        File.rename("#{dir_to_search}/#{file}", newname)
      end
    end
  }
  exit 1
end

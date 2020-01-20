#!/usr/bin/env ruby
require 'fileutils'

working_dir = File.expand_path File.dirname(__FILE__)
["mipmap-xxxhdpi","mipmap-xxhdpi","mipmap-xhdpi", "mipmap-hdpi", "mipmap-tvdpi", "mipmap-mdpi"].each do |dir|
 directory = "#{working_dir}/#{dir}"
# FileUtils.rm_rf(directory)
# FileUtils.mkdir_p(directory)
FileUtils.mkdir_p(directory)
end

Dir.entries(working_dir).each do |filename|    
if filename =~ /(.*)_(x{0,3}h|m|tv)(\..*)$/
   new_file_name = "#{$1}#{$3}"
   FileUtils.mv("#{working_dir}/#{filename}", "#{working_dir}/mipmap-#{$2}dpi/#{new_file_name}", :force => true)
 end
end
#!/usr/bin/env ruby

class Rename
  attr_accessor :target_dir, :app_dir, :app_name, :dash_name, :snake_name, :camel_name, :title_name

  def initialize(dir, name)
    @target_dir     = dir
    @app_dir        = File.expand_path(target_dir.strip.to_s)
    @app_name       = name
    @dash_name      = app_name.gsub('_', '-')
    @snake_name     = app_name.gsub('-', '_')
    @camel_name     = camelize(snake_name)
    @title_name     = titleize(snake_name)
  end

  def rename_new_app
    puts "renaming in #{app_dir}"
    Dir.chdir(app_dir) do
      {
        'Mefkit'  => camel_name,
        # 'app-prototype' => dash_name,
        'mefkit' => snake_name,
        '| Mefkit' => "| #{title_name}"
      }.each do |proto_name, new_name|
        shell "find . -type f -print | xargs #{sed_i} 's/#{proto_name}/#{new_name}/g'"
      end
    end
  end
end

Rename.new(ARGV[0], ARGV[1]).rename_new_app
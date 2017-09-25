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
        shell "LC_CTYPE=C && LANG=C && #{find_with_excludes} | xargs #{sed_i} 's/#{proto_name}/#{new_name}/g'"
      end
    end
  end

  def find_with_excludes
    "find . -not \( -path ./.git -prune \) -not \( -path ./node_modules -prune \) -type f -print"
  end

  def camelize(string)
    result = string.sub(/^[a-z\d]*/) { $&.capitalize }
    result.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }
  end

  def titleize(underscored_string)
    result = underscored_string.gsub(/_/, ' ')
    result.gsub(/\b('?[a-z])/) { $1.capitalize }
  end

  # Distinguish BSD vs GNU sed with the --version flag (only present in GNU sed).
  def sed_i
    @sed_format ||= begin
      %x{sed --version &> /dev/null}
      $?.success? ? "sed -i" : "sed -i ''"
    end
  end

  # Run a shell command and raise an exception if it fails.
  def shell(command)
    %x{#{command}}
    raise "#{command} failed with status #{$?.exitstatus}." unless $?.success?
  end

end

Rename.new(ARGV[0], ARGV[1]).rename_new_app
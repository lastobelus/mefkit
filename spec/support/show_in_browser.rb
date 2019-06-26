def show_in_browser(s)
  s = s.gsub(%r{\btest-assets/}, "file://#{Rails.public_path.to_s}/test-assets/")
  file = Tempfile.new(["rspec-results", ".html"])
  begin
    puts "writing contents to tempfile #{file.path}"

    file.write(s)
    `open #{file.path}`
  ensure
    file.close
  end
end

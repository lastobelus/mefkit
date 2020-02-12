RSpec.configure do |config|
  config.before :all do
    unless File.exist?(Rails.root.join("public/packs-test"))
      case self.class.metadata[:type]
      when :feature, :view, :request
        STDOUT.write "Precompiling assets..."

        system "bundle exec rake webpacker:compile > /dev/null 2>&1"

        STDOUT.puts "\n Done."
      end
    end
  end
end

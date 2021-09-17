namespace :build do
  desc "Run each feature file in an isolated Headless Chrome Browser"
  task :chrome do
    files = Dir['features/**/*.{feature}']
    threads = []
    files.each do |port|
      threads << Thread.new(port) do |feature_path|
        system "cucumber #{feature_path} HEADLESS=true"
      end
    end
    threads.each { |thread| thread.join }
  end
end



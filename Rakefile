desc 'Hello world'
task :hello_world do
  puts 'hello world'
end

namespace :generator do
  desc 'generate a csv file'
  task :csv do
    require './lib/generator'

    generator = Generator.new

    File.open('tmp/new.csv', 'wb') { |file| file.write(generator.to_csv) }
  end
end

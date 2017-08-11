desc 'Hello world'
task :hello_world do
  puts 'hello world'
end

namespace :generator do
  desc 'generate a csv file'
  task :csv do
    require './lib/generator'

    number_of_users = ENV['NUMBER_OF_USERS']

    generator = Generator.new(number_of_users)

    File.open('tmp/new.csv', 'wb') { |file| file.write(generator.to_csv) }
  end
end

namespace :haha do
  puts 'wow!!'
end

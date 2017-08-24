desc 'Hello world'
task :hello_world do
  puts 'hello world'
end

namespace :generator do
  desc 'generate a csv file'
  task :csv do
    require './lib/generator'
    require 'benchmark'

    number_of_users = ENV['USERS'] || 50

    generator = Generator.new(number_of_users: number_of_users)

    File.open('tmp/new.csv', 'wb') do |file|
      elapsed = Benchmark.realtime do
        file.write(generator.to_csv)
      end

      puts "Elapsed: #{format('%3.5f', elapsed)}s"
    end
  end
end

namespace :haha do
  task :wow do
    puts 'wow!!'
  end
end

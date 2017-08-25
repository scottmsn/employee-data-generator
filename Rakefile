begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  task :default => :spec
rescue LoadError
  # no rspec available
end

namespace :generator do
  desc 'generate a csv file'
  task :csv do
    require './lib/generator/comma_separated'
    require 'benchmark'
    require 'csv'

    number_of_users = ENV['USERS']&.to_i || 5000
    demographic_template = CSV.read(ENV['TEMPLATE'] || './template/source_template.csv')

    puts "Generating: #{number_of_users} users"

    generator = Generator::CommaSeparated.new(
      number_of_users: number_of_users,
      demographic_template: demographic_template)

    elapsed = Benchmark.realtime do
      File.open('tmp/new.csv', 'wb') do |file|
        file.write(generator.to_csv)
      end
    end
    puts "Elapsed: #{format('%3.5f', elapsed)}s"
  end
end


desc 'Hello world'
task :hello_world do
  puts 'hello world'
end

namespace :generator do
  desc 'generate a csv file'
  task :csv do
    require 'csv'
    csv_string = CSV.generate do |csv|
      csv << ['first', 'row', 'of', 'data']
      csv << ['second', 'row', 'of', 'data']
    end

    File.open('tmp/new.csv', 'wb') { |file| file.write(csv_string) }
  end
end

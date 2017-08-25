require './lib/generator/employee'
require './lib/generator/date'
require './lib/generator/demographic'

module Generator
  class CommaSeparated
    def initialize(
      number_of_users:,
      demographic_template:,
      employee_generator: Generator::Employee.new,
      date_generator: Generator::Date.new
    )
      @number_of_users = number_of_users
      @demographic_generators = demographic_generators(demographic_template)
      @employee_generator = employee_generator
      @date_generator = date_generator
    end

    def to_csv
      require 'csv'
      require 'faker'

      CSV.generate do |csv|
        csv << ['Name', 'Employee Id', 'Email', 'Date of Birth', 'Start Date', 'End Date', 'Language'] + @demographic_generators.map(&:name)

        @number_of_users.to_i.times do |idx|
          csv << @employee_generator.generate + @date_generator.generate + ['en'] + @demographic_generators.map(&:pick_demographic)
        end
      end
    end

    private

    def demographic_generators(demographic_template)
      demographic_template.map do |row|
        Generator::Demographic.new(name: row[0], max_options: row[1].to_i)
      end
    end
  end
end

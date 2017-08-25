module Generator
  class Employee
    require 'faker'

    def initialize(index: 1)
      @index = index
    end

    def generate(email_domain: 'example.com')
      name = Faker::Name.name
      employee_id = @index
      @index = @index + 1
      email = "#{name.downcase.tr(' ', '.')}.#{employee_id}@#{email_domain}"

      [name, employee_id, email]
    end
  end
end

module Generator
  class Employee
    def initialize(index: 1)
      @index = index
    end

    def generate(email_postfix: 'example.com')
      name = Faker::Name.name
      employee_id = @index
      @index = @index + 1
      email = "#{name.downcase.tr(' ', '.')}.#{employee_id}@#{email_postfix}"

      [name, employee_id, email]
    end
  end
end

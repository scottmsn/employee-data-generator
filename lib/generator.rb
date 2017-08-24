class Generator
  def initialize(number_of_users:)
    @number_of_users = number_of_users
    @max_dob = Time.new(2007, 1, 1)
    @min_dob = Time.new(1917, 1, 1)
    @now = Time.now
    @max_sd = @now + (60*60*24*7)
    @max_ed = @now + (60*60*24*365)
  end

  def to_csv
    require 'csv'
    require 'faker'

    CSV.generate do |csv|
      csv << ['Name', 'Employee Id', 'Email', 'Date of Birth', 'Start Date', 'End Date', 'Language']

      @number_of_users.to_i.times do |number|
        name = Faker::Name.name
        dob, sd, ed = generate_dates
        csv << [name, number + 1, email(name), dob, sd, ed, 'en']
      end
    end
  end

  private

  def email(name)
    "#{name.downcase.tr(' ', '.')}@example.com"
  end

  def generate_dates
    # a random date of birth
    dob = time_rand(@min_dob, @max_dob)

    # random start date after date of birth
    sd = time_rand(dob, @max_sd)

    # random end date or nil
    ed = (rand(100) > 95) ? time_rand(@now, @max_ed) : nil

    [dob.strftime("%b %d, %Y"), sd.strftime("%b %d, %Y"), ed&.strftime("%b %d, %Y")]
  end

  def time_rand(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
  end
end

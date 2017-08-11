class Generator
  def initialize(number_of_users)
    @number_of_users = number_of_users
  end

  def to_csv
    require 'csv'
    CSV.generate do |csv|
      @number_of_users.to_i.times do
        csv << ['row', 'of', 'data']
      end
    end
  end
end

class Generator
  def initialize
  end

  def to_csv
    require 'csv'
    CSV.generate do |csv|
      csv << ['first', 'row', 'of', 'data']
      csv << ['second', 'row', 'of', 'data']
    end
  end
end

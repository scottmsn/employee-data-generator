class DemographicGenerator
  require 'faker'

  attr_reader :name, :option_prefix

  def initialize(name:, max_options: 818, option_prefix: 'Option_')
    @name = name
    @max_options = max_options
    @option_prefix = option_prefix
  end

  def pick_demographic
    options.sample
  end

  private

  def options
    @options ||= begin
      (0..@max_options).map do |number|
        "#{option_prefix}#{number}"
      end
    end
  end
end

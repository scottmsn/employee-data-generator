module Generator
  class Demographic
    require 'faker'

    attr_reader :name

    def initialize(name:, max_options:)
      @name = name
      @max_options = max_options
    end

    def pick_demographic
      options.sample
    end

    private

    def options
      @options ||= begin
        (0..@max_options).map do |number|
          "#{name}_#{number}"
        end
      end
    end
  end
end

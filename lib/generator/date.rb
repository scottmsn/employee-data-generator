module Generator
  class Date
    def initialize(
      max_dob: Time.new(2007, 1, 1),
      min_dob: Time.new(1917, 1, 1),
      max_sd: Time.now + (60*60*24*7),
      max_ed: Time.now + (60*60*24*365)
    )
      @max_dob = max_dob
      @min_dob = min_dob
      @max_sd = max_sd
      @max_ed = max_ed
      @now = Time.now
    end

    def generate
      dob = date_of_birth
      sd = start_date(dob)
      [dob.strftime("%b %d, %Y"), sd.strftime("%b %d, %Y"), end_date&.strftime("%b %d, %Y")]
    end

    private

    def date_of_birth
      # a random date of birth
      time_rand(@min_dob, @max_dob)
    end

    def start_date(dob)
      # random start date after date of birth
      time_rand(dob, @max_sd)
    end

    def end_date
      # random end date or nil
      (rand(100) > 95) ? time_rand(@now, @max_ed) : nil
    end

    def time_rand(from = 0.0, to = @now)
      Time.at(from + rand * (to.to_f - from.to_f))
    end
  end
end

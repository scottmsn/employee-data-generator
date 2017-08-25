require './lib/generator/date'
require 'date'

describe Generator::Date do
  let(:generator) { Generator::Date.new }

  it 'always returns date of birth and start date' do
    dob, sd = generator.generate

    expect(dob).to_not be_nil
    expect(sd).to_not be_nil
  end

  it 'formats the date into Month day, YEAR' do
    dob, sd = generator.generate

    expect { Date.parse(dob) }.to_not raise_error
    expect { Date.parse(sd) }.to_not raise_error
  end
end

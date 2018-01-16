require './lib/generator/employee'

describe Generator::Employee do
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  let(:generator) { Generator::Employee.new }

  it 'returns an array of 3 string' do
    name, employee_id, email = generator.generate(email_domain: 'batman.com')

    expect(name).to_not be_nil
    expect(employee_id).to_not be_nil
    expect(email).to_not be_nil
  end

  it 'increment employee_id by 1 everytime generate is called' do
    _, employee_id_1 = generator.generate(email_domain: 'batman.com')
    _, employee_id_2 = generator.generate(email_domain: 'batman.com')

    expect(employee_id_2.to_i).to eq employee_id_1.to_i + 1
  end

  it 'returns email in proper format' do
    _, _, email = generator.generate(email_domain: 'batman.com')

    expect(email =~ VALID_EMAIL_REGEX).to be_truthy
  end

  it 'returns email with whatever postfix provided' do
    _, _, email = generator.generate(email_domain: 'batman.com')

    expect(email).to include 'batman.com'
  end
end

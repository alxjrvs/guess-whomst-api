require 'securerandom'

class PersonCreator
  include HTTParty
  base_uri 'https://thispersondoesnotexist.com'

  def self.create!
    new.create!
  end

  def create!
    src = parsed_page.at('img')['src']
    resp = self.class.get(src)
    filename = "#{SecureRandom.hex}.jpeg"
    binding.pry
    person.avatar.attach(io: Base64. resp.to_s, filename: filename)

    binding.pry
  end

  private

  def person
    Person.new
  end

  def html
    self.class.get('')
  end

  def parsed_page
    Nokogiri::HTML(html)
  end
end

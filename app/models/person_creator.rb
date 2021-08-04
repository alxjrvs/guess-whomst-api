require 'securerandom'

class PersonCreator
  include HTTParty
  base_uri 'https://thispersondoesnotexist.com'
  def self.create!
    new.create!
  end


  def create!
    person.avatar.attach(io: image_file, filename:filename)
    person.save!
  end

  private

  def person
    @person ||= Person.new
  end

  def filename
    "#{SecureRandom.hex}.jpeg"
  end

  def image
    self.class.get('/image').body
  end

  def image_file
    file = Tempfile.new
    file.binmode
    file.write(image)
    file.rewind
    file
  end

end

namespace :person do
  task populate: :environment do
    puts "Starting"
    24.times do |i|
      puts "Creating ##{i+1}..."
      PersonCreator.create!
      puts "Created ##{i+1}!"
    end
    puts "Ended"
  end

  task mass_populate: :environment do
    puts "Starting"
    250.times do |i|
      puts "Creating ##{i+1}..."
      PersonCreator.create!
      puts "Created ##{i+1}!"
    end
    puts "Ended"
  end
end

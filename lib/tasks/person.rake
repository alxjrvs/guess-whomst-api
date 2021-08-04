namespace :person do
  task create: :environment do
    puts "Starting"
    24.times do |i|
      puts "Creating ##{i+1}..."
      PersonCreator.create!
      puts "Created ##{i+1}!"
    end
    puts "Ended"
  end
end

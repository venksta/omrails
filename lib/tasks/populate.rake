namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    60.times do |n|
      puts "[DEBUG] creating user #{n+1} of 60"
      name = Faker::Name.name
      email = "user-#{n+1}@seelam.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end

    User.all.each do |user|
      puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"
      5.times do |n|
        image = File.open(Dir.glob(File.join(Rails.root, 'Sampleimages', '*')).sample)
        description = %w(cool awesome crazy wow adorbs incredible sexy beautiful pretty super hellyeah pretty retro bomb digging).sample
        user.pins.create!(image: image, description: description)
      end
    end
  end
end


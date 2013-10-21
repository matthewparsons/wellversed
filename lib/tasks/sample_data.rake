namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    9.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    admin = User.create!(name: "Matt Parsons",
                 email: "matthew.r.parsons@gmail.com",
                 password: "password",
                 password_confirmation: "password")
    admin.toggle!(:admin)

    5.times do |n|
      name = Faker::Name.name
      author = Author.create!(name: name)
      10.times do |n|
        title = Faker::Lorem.words(2).join(" ").to_s.capitalize
        author_id = author.id
        filename = "lorem_ipsum.txt"
        content = File.open("data/" + filename).read
        Piece.create!(author_id: author_id, 
          title: title, 
          filename: filename, 
          content: content)
      end
    end

   

  end
end

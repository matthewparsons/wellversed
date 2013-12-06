namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_pieces
    make_studies
  end
end

def make_users
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
end

def make_pieces
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

def make_studies
  users = User.all
  user = users.first
  pieces = Piece.all
  studied_pieces = pieces[3..8]
  studied_pieces.each { |piece| user.study!(piece) }

end

def load_poems
	
end

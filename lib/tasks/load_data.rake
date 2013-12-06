require 'xmlsimple'
namespace :db do
  desc "Load data"
  task upload: :environment do
    upload_poems
  end
end

def comment_text
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

def upload_poems
	Dir.glob("data/*.xml") do |file|
    puts file
    data = XmlSimple.xml_in(File.open(file, 'r'))
    author = data['author'].first
    if Author.find_by_name(author)
      author_id = Author.find_by_name(author).id
    else
      author_id = Author.create!(name: author).id
    end
    puts author_id
    title = data['title'].first
    content = data['text'].first
    puts title
    Piece.create!(author_id: author_id, 
          title: title, 
          filename: file, 
          content: content)
  end
end


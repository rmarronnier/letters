require "csv"
require "json"

corpum = Dir.open("corpum")
Dir.cd("corpum")
csv_array = [] of Array(String)
csv = CSV.new("id, content, author", headers: true)

corpum.each_child do |author|
  puts author
  content = File.read(author)
  id = 1
  corpus = content.split("====================", remove_empty: true)
  corpus.each do |letter|
  csv_array << [id.to_s, letter, author]
  id = id + 1
  end
end

letters = CSV.build do |csv|
  csv.row "id", "content", "author"
  csv_array.each do |letter|
  csv.row letter
  end
end




#File.write("letters.csv", letters)

Dir.cd("..")
profiles = Dir.open("profiles")
Dir.cd("profiles")
json_array = Array(Hash(String, (String|Int32|Bool))).new
profiles.each_child do |author|
  puts author
  body = File.read(author)
  id = 1
  json_hash = { "id"=> id, "email" => author + "@famous.com", "password" => "password", "name" => author, "role" => "bot", "body" => body, "published" => true }
  id = id + 1
  json_array << json_hash
end
File.write("authors.json", json_array.to_json)

# corpum.each_child do |author|
# content = File.read(author)
# id = 1
# corpus = content.split("====================", remove_empty: true)
# corpus.each do |letter|
# csv.build.row id, letter, author
# id = id + 1
# end
# end
# File.write("letters.csv", csv)

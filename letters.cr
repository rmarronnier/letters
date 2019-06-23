require "csv"

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

File.write("letters.csv", letters)

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

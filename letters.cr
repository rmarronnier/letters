require "csv"

corpum = Dir.open("corpum")

csv = CSV.new("id, content, author", headers: true)

corpum.each do |author|
id = 1
corpus = author.read.split("====================", remove_empty: true)
corpus.each do |letter|
csv.row id, letter, author
id = id + 1
end
end
File.write("letters.csv", csv)

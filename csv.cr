require "csv"
require "json"

content = File.read("lyrics.csv")

# lyrics = CSV.new(content, headers: true)

artist = "eminem"

# puts lyrics.headers

lyrics = "The beatles lyrics\n"

# lyrics_file = File.new("eminem.txt")

CSV.each_row(content) do |row|
    lyrics += row[5] unless row[3] != artist
end

#File.write("beatles.json", lyrics.to_json)
File.write("eminem2.txt", lyrics)



# lyrics.each_row do |row|
#     if row["artist"] == artist
#         puts row[0]
#     end
# end


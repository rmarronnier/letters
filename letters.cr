content = File.read("1.txt").split("====================", remove_empty: true)

content.each do |t|

puts t + "*******"

end

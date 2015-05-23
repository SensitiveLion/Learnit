# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "Who")
Category.create(name: "What")
Category.create(name: "When")
Category.create(name: "Where")
Category.create(name: "Why")
Category.create(name: "How")

require "nokogiri"
require 'open-uri'

count = 0
9876.times do
  doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Special:Random"))
  Thing.create(name: doc.css('.firstHeading').text)
  count += 1
  print count
end

# 1.times do
#   text = []
#   doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Special:Random"))
#   doc.css('p').each do |p|
#     if p.text.length != 0
#       text << p.text
#     end
#   end
#   binding.pry
#   Learipedia.create(name: doc.css('.firstHeading').text, body: text)
#   # count += 1
#   # print count
# end

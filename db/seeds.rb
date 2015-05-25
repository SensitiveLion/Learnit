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
9999.times do
  doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Special:Random"))
  Thing.create(name: doc.css('.firstHeading').text)
  count += 1
  print count
end

second_count = 0
1000.times do
  doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Special:Random"))
  lexicon = Lexicon.create(title: doc.css('.firstHeading').text)
  if Lexicon.exist?(title: doc.css('.firstHeading').text)
    doc.css('p').each do |p|
      if p.text.length != 0
        LexiconLesson.create(lexicon: lexicon, body: p.text)
      end
    end
    second_count += 1
    print second_count
  end
end

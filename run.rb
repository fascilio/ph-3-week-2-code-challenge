require_relative './lib/author'
require_relative './lib/magazine'
require_relative './lib/article'


author1 = Author.new('Charlies Byse')
author2 = Author.new('Garfield Lynn')
magazine1 = Magazine.new('Science Weekly', 'Science')
magazine2 = Magazine.new('Fashion Weekly', 'Fashion')
article1 = Article.new(author1, magazine1, 'Article 1')
article2 = Article.new(author1, magazine2, 'Article 2')
article3 = Article.new(author2, magazine1, 'Article 3')

puts "Author name: #{author1.name}"
puts "Articles by #{author1.name}:"
puts author1.articles.map(&:title)
puts "Magazines for #{author1.name}:"
puts author1.magazines.map(&:name)
puts "Topic areas for #{author1.name}:"
puts author1.topic_areas

puts "Magazine name: #{magazine1.name}"
puts "Contributors for #{magazine1.name}:"
puts magazine1.contributors.map(&:name)
puts "Article titles for #{magazine1.name}:"
puts magazine1.article_titles
puts "Contributing authors for #{magazine1.name}:"
puts magazine1.contributing_authors.map(&:name)


# author1 = Author.new('Charlies Byse')
# author2 = Author.new('Garfield Lynn')
# magazine1 = Magazine.new('Magazine A', 'Category X')
# magazine2 = Magazine.new('Magazine B', 'Category Y')
# article1 = Article.new(author1, magazine1, 'Article 1')
# article2 = Article.new(author1, magazine2, 'Article 2')
# article3 = Article.new(author2, magazine1, 'Article 3')


# puts "Author name: #{author1.name}"
# puts "Articles by #{author1.name}:"
# puts author1.articles.map(&:title)
# puts "Magazines for #{author1.name}:"
# puts author1.magazines.map(&:name)
# puts "Topic areas for #{author1.name}:"
# puts author1.topic_areas

# puts "Magazine name: #{magazine1.name}"
# puts "Contributors for #{magazine1.name}:"
# puts magazine1.contributors.map(&:name)
# puts "Article titles for #{magazine1.name}:"
# puts magazine1.article_titles
# puts "Contributing authors for #{magazine1.name}:"
# puts magazine1.contributing_authors.map(&:name)
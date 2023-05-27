require_relative 'author'
require_relative 'magazine'
require_relative 'Article'

# Create instances of Author, Magazine, and Article
author3 = Author.new('James Willies')
author4 = Author.new('June Dutch')
magazine3 = Magazine.new('Magazine c', 'Category c')
magazine4 = Magazine.new('Magazine d', 'Category d')
article6 = Article.new(author3, magazine3, 'Article 6')
article7 = Article.new(author3, magazine4, 'Article 7')
article8 = Article.new(author4, magazine3, 'Article 8')

# Test the methods
puts "Author name: #{author3.name}"
puts "Articles by #{author3.name}:"
puts author3.articles.map(&:title)
puts "Magazines for #{author3.name}:"
puts author3.magazines.map(&:name)
puts "Topic areas for #{author3.name}:"
puts author3.topic_areas

puts "Magazine name: #{magazine3.name}"
puts "Contributors for #{magazine3.name}:"
puts magazine3.contributors.map(&:name)
puts "Article titles for #{magazine3.name}:"
puts magazine3.article_titles
puts "Contributing authors for #{magazine3.name}:"
puts magazine3.contributing_authors.map(&:name)


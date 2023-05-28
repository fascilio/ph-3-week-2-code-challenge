# class Article
#     attr_reader :author, :magazine, :title
  
#     def initialize(author, magazine, title)
#       @author = author
#       @magazine = magazine
#       @title = title
  
#     end
  
#     def self.all
#       ' SELECT articles.title, authors.name AS author_name, magazines.name AS magazine_name, magazines.category
#         FROM articles
#         JOIN authors ON articles.author_id = authors.id
#         JOIN magazines ON articles.magazine_id = magazines.id'
      
  
#       results = execute_query(query)
#       results.map do |row|
#         author = Author.new(row['author_name'])
#         magazine = Magazine.new(row['magazine_name'], row['category'])
#         Article.new(author, magazine, row['title'])
#       end
#     end
  
#     def title
#       @title
#     end
  
#     def author
#       @author
#     end
  
#     def magazine
#       @magazine
#     end
#   end

require 'sqlite3'

class Article
  attr_reader :author, :magazine, :title

  def initialize(author, magazine, title)
    @author = author
    @magazine = magazine
    @title = title
  end

  def self.all
    query = <<~SQL
      SELECT articles.title, authors.name AS author_name, magazines.name AS magazine_name, magazines.category
      FROM articles
      JOIN authors ON articles.author_id = authors.id
      JOIN magazines ON articles.magazine_id = magazines.id
    SQL

    db = SQLite3::Database.new('magazine.db')
    results = db.execute(query)
    db.close

    results.map do |row|
      author = Author.new(row[1])
      magazine = Magazine.new(row[2], row[3])
      Article.new(author, magazine, row[0])
    end
  end

  def author
    @author
  end  

  def magazine
    @magazine
  end

  def title
    @title
  end
end


# require 'sqlite3'

# class Article
#   attr_reader :author, :magazine, :title

#   def initialize(author, magazine, title)
#     @author = author
#     @magazine = magazine
#     @title = title
#   end

#   def articles
#     Article.all.select { |article| article.author.name == name }
#   end

#   def self.all
#     query = <<~SQL
#       SELECT articles.title, authors.name AS author_name, magazines.name AS magazine_name, magazines.category
#       FROM articles
#       JOIN authors ON articles.author_id = authors.id
#       JOIN magazines ON articles.magazine_id = magazines.id
#     SQL

#     db = SQLite3::Database.new('magazine.db') # Replace 'your_database_name.db' with your SQLite database file name
#     results = db.execute(query)
#     db.close

#     results.map do |row|
#       author = Author.new(row[1])
#       magazine = Magazine.new(row[2], row[3])
#       Article.new(author, magazine, row[0])
#     end
    
#   end

#   def title
#     @title
#   end

#   def author
#     @author
#   end

#   def magazine
#     @magazine
#   end
# end

 
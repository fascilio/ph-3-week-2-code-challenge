# class Article
#     attr_reader :author, :magazine, :title
  
#     @@all = []
  
#     def initialize(author, magazine, title)
#       @author = author
#       @magazine = magazine
#       @title = title
#       @@all << self
#     end
# end

class Article
    attr_reader :author, :magazine, :title
  
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
  
    end
  
    def self.all
      ' SELECT articles.title, authors.name AS author_name, magazines.name AS magazine_name, magazines.category
        FROM articles
        JOIN authors ON articles.author_id = authors.id
        JOIN magazines ON articles.magazine_id = magazines.id'
      
  
      results = execute_query(query)
      results.map do |row|
        author = Author.new(row['author_name'])
        magazine = Magazine.new(row['magazine_name'], row['category'])
        Article.new(author, magazine, row['title'])
      end
    end
  
    def title
      @title
    end
  
    def author
      @author
    end
  
    def magazine
      @magazine
    end
  end
  

# class Article
#     attr_reader :author, :magazine, :title
  
#     @@all = []
  
#     def initialize(author, magazine, title)
#       @author = author
#       @magazine = magazine
#       @title = title
#       @@all << self
#     end
  
#     def self.all
#       @@all
#     end
  
#     def self.find_by_author(author)
#       @@all.select { |article| article.author == author }
#     end
  
#     def self.find_by_magazine(magazine)
#       @@all.select { |article| article.magazine == magazine }
#     end
#   end
  
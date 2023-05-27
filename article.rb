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
  
    @@all = []
  
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_author(author)
      @@all.select { |article| article.author == author }
    end
  
    def self.find_by_magazine(magazine)
      @@all.select { |article| article.magazine == magazine }
    end
  end
  
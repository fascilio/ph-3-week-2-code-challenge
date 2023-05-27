class Article
    attr_reader :author, :magazine, :title
  
    @@all = []
  
    def initialize(author, magazine, title)
      @author = author
      @magazine = magazine
      @title = title
      @@all << self
    end
end
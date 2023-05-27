# class Magazine
#     attr_reader :name, :category
  
#     @@all = []
  
#     def initialize(name, category)
#       @name = name
#       @category = category
#       @@all << self
#     end
# end
class Magazine
    attr_reader :name, :category
  
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.find_by_name(name)
      @@all.find { |magazine| magazine.name == name }
    end
  
    def contributors
      Article.all.select { |article| article.magazine == self }.map(&:author)
    end
  
    def article_titles
      Article.all.select { |article| article.magazine == self }.map(&:title)
    end
  
    def contributing_authors
      authors = Article.all.select { |article| article.magazine == self }.map(&:author)
      authors.select { |author| author.articles.count > 2 }.uniq
    end
  end
  
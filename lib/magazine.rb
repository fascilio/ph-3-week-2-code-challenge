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
      'SELECT * FROM magazines WHERE name = ?
      LIMIT 1'
        # this returns the name of the magazine
    end
  
    def contributors
      Article.all.select { |article| article.magazine == self }.map(&:author)
      ' SELECT DISTINCT authors.id, authors.name
      FROM authors
      JOIN author_magazines ON author_magazines.author_id = authors.id
      WHERE author_magazines.magazine_id = '
    #   Returns an array of Author instances who have written for this magazine
    end
  
    def article_titles
      Article.all.select { |article| article.magazine == self }.map(&:title)
      'SELECT articles.title
      FROM articles
      WHERE articles.magazine_id = '
    #   this returns the article_titles
    end
  
    def contributing_authors
      authors = Article.all.select { |article| article.magazine == self }.map(&:author)
      authors.select { |author| author.articles.count > 2 }.uniq
      ' SELECT DISTINCT authors.id, authors.name
      FROM authors
      JOIN author_magazines ON author_magazines.author_id = authors.id
      WHERE author_magazines.magazine_id = 
      LIMIT 2'
    #   Returns an array of authors who have written more than 2 articles for the magazine
    end
  end
  
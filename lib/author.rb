# class Author
#     attr_reader :name
  
#     def initialize(name)
#       @name = name
#     end
  
#     def articles
#       Article.all.select { |article| article.author == self }
#       'SELECT articles.id, articles.title, articles.author_id, articles.magazine_id
#       FROM articles
#       WHERE articles.author_id ='
#     #   Returns an array of Article instances the author has written
#     end
  
#     def magazines
#       articles.map { |article| article.magazine }.uniq
#       'SELECT DISTINCT magazines.id, magazines.name, magazines.category
#       FROM magazines
#       JOIN author_magazines ON author_magazines.magazine_id = magazines.id
#       WHERE author_magazines.author_id = ?'
#     #   this returns the magazine when the author id is passed 
#     end
  
#     def add_article(magazine, title)
#       new_article = Article.new(self, magazine, title)
#       ' INSERT INTO articles (title, author_id, magazine_id)
#       VALUES (?, ?, ?);'
#     #   this adds a new article
#     end
  
#     def topic_areas
#       magazines.map { |magazine| magazine.category }.uniq
#       'SELECT DISTINCT magazines.category
#       FROM magazines
#       JOIN author_magazines ON author_magazines.magazine_id = magazines.id
#       WHERE author_magazines.author_id = ?'
#     #   Returns a unique array of strings with the categories of the magazines the author has contributed to
#     end
#   end
  require 'sqlite3'

  class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def articles
      Article.all.select { |article| article.author.name == name }
    #    'SELECT articles.id, articles.title, articles.author_id, articles.magazine_id
    #    FROM articles
    #    WHERE articles.author_id ='
    #  #   Returns an array of Article instances the author has written
    end
  
    def magazines
      query = <<~SQL
        SELECT DISTINCT magazines.id, magazines.name, magazines.category
        FROM magazines
        JOIN author_magazines ON author_magazines.magazine_id = magazines.id
        WHERE author_magazines.author_id = ?
      SQL
  
      db = SQLite3::Database.new('magazine.db')
      results = db.execute(query, self.object_id)
      db.close
  
      results.map do |row|
        Magazine.new(row[1], row[2])
      end
    end
  
    def add_article(magazine, title)
      query = <<~SQL
        INSERT INTO articles (title, author_id, magazine_id)
        VALUES (?, ?, ?)
      SQL
  
      db = SQLite3::Database.new('magazine.db')
      db.execute(query, title, self.object_id, magazine.object_id)
      db.close
    end
  
    def topic_areas
      magazines.map { |magazine| magazine.category }.uniq
      # 'SELECT DISTINCT magazines.category
      #  FROM magazines
      #  JOIN author_magazines ON author_magazines.magazine_id = magazines.id
      #  WHERE author_magazines.author_id = ?'
     #   Returns a unique array of strings with the categories of the magazines the author has contributed to

    end
  end
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
end

 
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
    query = <<~SQL
    SELECT *
    FROM magazines
    WHERE name = ?
    LIMIT 1
    SQL

    db = SQLite3::Database.new('magazine.db')
    results = db.execute(query, name)
    db.close

    if results.any?
      row = results.first
      Magazine.new(row[1], row[2])
    else
      nil
    end
  end

  def contributors
    query = <<~SQL
      SELECT DISTINCT authors.id, authors.name
      FROM authors
      JOIN articles ON articles.author_id = authors.id
      JOIN magazines ON articles.magazine_id = magazines.id
      WHERE magazines.name = ?
    SQL

    db = SQLite3::Database.new('magazine.db')
    results = db.execute(query, self.name)
    db.close

    results.map do |row|
      Author.new(row[1])
    end
  end

  def article_titles
    query = <<~SQL
      SELECT articles.title
      FROM articles
      JOIN magazines ON articles.magazine_id = magazines.id
      WHERE magazines.name = ?
    SQL

    db = SQLite3::Database.new('magazine.db')
    results = db.execute(query, self.name)
    db.close

    results.flatten
  end

  def contributing_authors
    authors = contributors
    authors.select { |author| author.articles.count > 2 }.uniq
  #   ' SELECT DISTINCT authors.id, authors.name
  #   #  FROM authors
  #   #  JOIN author_magazines ON author_magazines.author_id = authors.id
  #   #  WHERE author_magazines.magazine_id = 
  #   #  LIMIT 2'
  #  #   Returns an array of authors who have written more than 2 articles for the magazine
  # end
  end
end
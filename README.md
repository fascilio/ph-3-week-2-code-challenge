# ph-3-week-2-code-challenge
This program is a simple database system for managing articles, authors, and magazines. It allows you to
perform various operations such as retrieving information, adding articles, and finding contributors 
based on the provided data. You can do all this using the `run.rb` file.

## Installation
1. Clone this repository to your local machine or download the source code.
2.Make sure you have Ruby and SQLite3 installed on your system.
3.Install the required gem dependencies by running the following command:
`gem install sqlite3`

# Classes
## Article
This class represents an article and provides methods to retrieve information about the article.

Attributes
`author` : The author of the article.
`magazine` : The magazine the article belongs to.
`title` : The title of the article.
## Methods
`initialize(author, magazine, title)`: Initializes a new `Article` instance with the given author, magazine, and title.
`self.all`: Returns an array of all articles in the database. Each article is represented as an `Article` instance.

## Author
This class represents an author and provides methods to retrieve information about the author, their articles, and magazines they have contributed to.

Attributes
`name` (read-only): The name of the author.
Methods
`initialize(name)`: Initializes a new `Author` instance with the given name.
`articles`: Returns an array of `Article` instances written by the author.
`magazines`: Returns an array of `Magazine` instances the author has contributed to.
`add_article(magazine, title)`: Adds a new article to the database with the specified magazine and title.
`topic_areas`: Returns a unique array of strings representing the categories of the magazines the author has contributed to.

## Magazine
This class represents a magazine and provides methods to retrieve information about the magazine, its contributors, and articles.

Attributes
`name` : The name of the magazine.
`category` : The category of the magazine.
Methods
`initialize(name, category)`: Initializes a new `Magazine` instance with the given name and category.
`self.all`: Returns an array of all magazines in the database. Each magazine is represented as a `Magazine` instance.
`self.find_by_name(name)`: Finds a magazine by its name and returns a `Magazine` instance if found, otherwise `nil`.
`contributors`: Returns an array of `Author` instances who have contributed to the magazine.
`article_titles`: Returns an array of titles of articles published in the magazine.
`contributing_authors`: Returns an array of authors who have written more than two articles for the magazine.

## Database
The program uses an SQLite database named `magazine.db` to store the information about articles, authors, and magazines. The database schema includes the following tables:

`articles`: Stores information about articles, including the article title, author ID, and magazine ID.
`authors`: Stores information about authors, including the author name.
`magazines`: Stores information about magazines, including the magazine name and category.

## author
Samuel Karanja.
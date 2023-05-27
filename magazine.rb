class Magazine
    attr_reader :name, :category
  
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
end
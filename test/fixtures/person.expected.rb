class Person
  def initialize(name, title = nil)
    @name = name
    @title = title
  end
  
  def to_s
    return "#{title} #{name}" if title
    name
  end
end

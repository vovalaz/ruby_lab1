class Book
  attr_accessor :id, :author, :title, :subjects, :language, :release_date
  def initialize(id, author, title, subjects, language, release_date)
    @id              = id
    @author          = author
    @title           = title
    @subjects        = subjects
    @language        = language
    @release_date    = release_date
  end

  def info(block)
    yield self if block_given?
  end

  def as_json(options = nil)
    {
      id: @id,
      author: @author,
      title: @title,
      subjects: @subjects,
      language: @language,
      release_date: @release_date,
    }
  end

  def to_s()
    return "Book information:\n# - #{id}, \nauthor - #{author}, \ntitle - #{title}, \nsubjects - #{subjects}, \nlanguage - #{language}, \nrelease date - #{release_date})"
  end
end
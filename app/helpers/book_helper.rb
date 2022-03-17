module BookHelper
  def get_authors
    authors = User.all.map {|author| [author.name, author.id]}
  end
end
# frozen_string_literal: true

module BookHelper
  def author_select_options
    User.all.map { |author| [author.name, author.id] }
  end
end

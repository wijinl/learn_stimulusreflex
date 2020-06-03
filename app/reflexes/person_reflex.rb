# frozen_string_literal: true

class PersonReflex < ApplicationReflex
  def search
    @query = element[:value]
    @people = Person.search(@query)
  end
end

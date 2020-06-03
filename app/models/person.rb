class Person < ApplicationRecord
  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
  }
end

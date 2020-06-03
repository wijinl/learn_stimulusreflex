# frozen_string_literal: true

class TodoReflex < ApplicationReflex
  def toggle
    @todo = Todo.find_by(id: element.dataset[:id])
    @todo.update(finish: !@todo.finish)
  end
end

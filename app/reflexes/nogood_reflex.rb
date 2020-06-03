# frozen_string_literal: true

class NogoodReflex < ApplicationReflex
  def show
    @show = element[:value]
  end
end

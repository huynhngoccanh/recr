class Highlights::SearchesController < ApplicationController
  def index
    @highlights = Highlight::Search.new(params).search
  end
end

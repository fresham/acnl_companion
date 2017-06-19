class FishController < ApplicationController
  def index
    @fish_names = Fish.pluck(:name)
  end
end

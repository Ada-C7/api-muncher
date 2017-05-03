class HomepagesController < ApplicationController
  def index
    @channels = EdamamApiWrapper.getChannel()
  end
end

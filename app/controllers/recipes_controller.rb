require 'recipe_search'

class RecipesController < ApplicationController

  def index
  end

end

require 'slack_channel'

class ChatsController < ApplicationController

  def index
    @channels = SlackChannel.all
  end

  def new_message
    @channel = SlackChannel.new(params[:channel])
  end

  def send_message
    channel = SlackChannel.new(params[:channel])
    channel.send(params[:message])
    redirect_to chats_path
  end
end

class SystemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @systems = current_user.systems
  end
end

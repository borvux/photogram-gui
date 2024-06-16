class UsersController < ApplicationController
  def index
    # get the list of users
    @list_of_users = User.all.order({ :username => :asc })

    # render the page
    render({ :template => "users_templates/index" })
  end

  def show
    # get the params 
    parameter = params.fetch("path_username")

    @user = User.where({ :username => parameter }).at(0)
    
    render({ :template => "users_templates/show" })
  end
end

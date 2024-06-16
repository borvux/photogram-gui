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

  def add_user
    input_username = params.fetch("query_username")

    add_user = User.new
    add_user.username = input_username
    add_user.save

    redirect_to("/users/#{input_username}")
  end

  def update
    id = params.fetch("path_id")
    input_username = params.fetch("query_username")

    update_username = User.where({ :id => id }).at(0)
    update_username.username = input_username
    update_username.save

    redirect_to("/users/#{input_username}")
  end
end

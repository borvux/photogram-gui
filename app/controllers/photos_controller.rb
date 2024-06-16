class PhotosController < ApplicationController
  def index
    @all_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_templates/index" })
  end

  def show
    id = params.fetch("path_id")

    @the_photo = Photo.where({ :id => id }).at(0)

    render({ :template => "photos_templates/show" })

  end

  def delete
    id = params.fetch("path_id")
    the_photo = Photo.where({ :id => id }).at(0).destroy

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    insert_photo = Photo.new

    insert_photo.image = input_image
    insert_photo.caption = input_caption
    insert_photo.owner_id = input_owner_id

    insert_photo.save

    redirect_to("/photos/#{insert_photo.id}")
  end

  def update
    id = params.fetch("path_id")

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    update_photo = Photo.where({ :id => id }).at(0)
    update_photo.image = input_image
    update_photo.caption = input_caption

    update_photo.save

    redirect_to("/photos/#{id}")
  end

  def add_comment
    input_photo_id = params.fetch("query_photo_id")
    input_author_id = params.fetch("query_author_id")
    input_comment = params.fetch("query_comment")

    add_comment = Comment.new

    add_comment.photo_id = input_photo_id
    add_comment.author_id = input_author_id
    add_comment.body = input_comment

    add_comment.save    

    redirect_to("/photos/#{input_photo_id}")
  end
end

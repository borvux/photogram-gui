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
end

class PhotosController < ApplicationController
  def index
    @all_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_templates/index" })
  end

  def show
    parameter = params.fetch("path_id")

    @the_photo = Photo.where({ :id => parameter }).at(0)

    render({ :template => "photos_templates/show" })
  end
end

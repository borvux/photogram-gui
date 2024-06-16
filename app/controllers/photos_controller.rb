class PhotosController < ApplicationController
  def index
    @all_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_templates/index" })
  end

  def show
    render({ :template => "photos_templates/show" })
  end
end

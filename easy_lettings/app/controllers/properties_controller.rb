class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    if current_user.admin?
      @property = Property.new
      render 'new'
    else
      flash.alert = "Please sign in as an admin"
      redirect_to '/'
    end
  end

  def create
    @property = Property.new(property_params)



    # @property.gallery.picture.create(picture_params)
    # Picture.create(params[:image],gallery_id: @property.gallery)
    if @property.save
      @picture = Picture.create(picture_params)
      @property.pictures << @picture
      redirect_to '/'
    else
      render 'new'
    end
  end

private

def property_params
    params.require(:property).permit(:name, :description, :price)
end

def picture_params
    params.require(:property).permit(:image)
end


end

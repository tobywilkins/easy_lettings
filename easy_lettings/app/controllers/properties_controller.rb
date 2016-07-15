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
    if @property.save
      if params[:pictures]
        params[:pictures][:images].each do |image|
          @picture = @property.pictures.create!(image: image)

        end
      end
      redirect_to '/'
    else
      render 'new'
    end
  end

private

  def property_params
      params.require(:property).permit(:name, :description, :price, pictures_attributes: [:images])
  end

end

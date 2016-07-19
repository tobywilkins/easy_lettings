class PropertiesController < ApplicationController

  def index
    @properties = Property.all
    @properties.each do |property|
    end
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

  def show
    @property = Property.find(params[:id])
    @googleurl = Property.generate_google_maps_url(@property.postcode)
    p @googleurl
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      if params[:pictures]
        params[:pictures][:images].each do |image|
          @picture = @property.pictures.create!(image: image)
        end
      end
      if params[:property][:postcode]
        @property.pictures.create!(image: Property.create_google_image(params[:property][:postcode]))
      end
    redirect_to '/'
    else
      render 'new'
    end
  end

  def edit
  @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to '/'
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    flash[:notice] = "Property deleted successfully"
    redirect_to '/'
  end

private

  def property_params
      params.require(:property).permit(:name, :postcode, :description, :delete_image, :price, pictures_attributes: [:images])
  end

end

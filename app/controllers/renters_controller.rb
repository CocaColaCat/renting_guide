class RentersController < ApplicationController
  include NearRentify

  def index
    @renters = Renter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @renters }
    end
  end

  def show
    @renter = Renter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @renter }
    end
  end

  def new
    @renter = Renter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @renter }
    end
  end

  def edit
    @renter = Renter.find(params[:id])
  end

  def create
    @renter = Renter.new(params[:renter])
      
    respond_to do |format|
      if @renter.save
      
		  if(is_within_5_miles(@renter[:postcode]))
			  @within_5_miles = true
			  #coordinates = get_coordinates(@renter[:postcode])
			  #@link_to_map = "<img src=\"#{create_link(coordinates)}\" class=\"img-circle\">"
		   end
		   
		   DownloadNotifier.downloaded(@renter).deliver	   
		   format.js 
		   format.html { redirect_to @renter, notice: 'Renter was successfully created.' }
		   format.json { render json: @renter, status: :created, location: @renter }
      else
	  	   format.js {@render} 
        format.html { render action: "new" }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /renters/1
  # PUT /renters/1.json
  def update
    @renter = Renter.find(params[:id])

    respond_to do |format|
      if @renter.update_attributes(params[:renter])
        format.html { redirect_to @renter, notice: 'Renter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @renter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /renters/1
  # DELETE /renters/1.json
  def destroy
    @renter = Renter.find(params[:id])
    @renter.destroy

    respond_to do |format|
      format.html { redirect_to renters_url }
      format.json { head :no_content }
    end
  end
  
  def download
  	file_path = Rails.root + "public/Ultimate_Renting_Guide.pdf"
  	send_file file_path, filename: "Ultimate_Renting_Guide.pdf", disposition: "attachment"
  end
end

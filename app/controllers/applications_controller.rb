class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def new
  end

  def create
    application = Application.new(application_params)

    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/new"
      flash[:alert] = "Error: ALL sections must be completed"
    end
  end

private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zip, :description, :status)
  end
end
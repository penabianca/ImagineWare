class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end
  def show
    id = params[:id]
    @hospital = Hospital.find(id)
  end
  def new
    #default: render 'new' template
  end
  def create
    @hospital = Hospital.create!(params[:hospital])
    flash[:notice] = "#{@hospital.name} was successfully created."
    redirect_to hospitals_path
  end
  def edit
    @hospital = Hospital.find params[:id]
  end
  def update
    @hospital = Hospital.find params[:id]
    @hospital.update_attributes!(params[:hospital])
    flash[:notice] = "#{@hospital.name} was successfully updated."
    redirect_to hospital_path(@hospital)
  end
  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    flash[:notice] = "Hospital '#{@hospital.name}' deleted."
    redirect_to hospitals_path
  end
end

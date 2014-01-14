class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all[0..8] # only 9 activities - this should probably be in the form of a consistency check in the Activity model.
  end

  def create
    @activity = Activity.new(params[:activity])
    @activity.save

    respond_to do |format|
      format.html { redirect_to activities_path }
      format.json {
        render :text => @activity.id
      }
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    
    respond_to do |format|
      format.html { redirect_to activities_path }
      format.json { head :no_content }
    end
  end

  def checkit
    puts 'CHECKITTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT'
    puts params
    @activity = Activity.find(params[:id])
    @activity.update_attributes(:checked => params[:checked])
    @activity.save

    respond_to do |format|
      format.html { redirect_to activities_path }
      format.json { head :no_content }
    end
  end

end

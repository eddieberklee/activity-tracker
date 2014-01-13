class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all[0..8] # only 9 activities - this should probably be in the form of a consistency check in the Activity model.
  end

  def create
    puts 'CREAAAAAAAAAAAAAAAAAAAATE'
    puts params
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

end

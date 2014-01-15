class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all[0..8] # only 9 activities - this should probably be in the form of a consistency check in the Activity model.
    @today = "#{Time.now.to_date.strftime('%b')} #{Time.now.to_date.day}"
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

    # create a new log object
    @activity = Activity.find(params[:activity_id])
    @log = @activity.logs.new()
    
    # Parsing params[:checked], string->boolean parsing
    if params[:checked] == 'true'
      checked = true
    else
      checked = false
    end

    @log.update_attributes({:checked => checked})

    respond_to do |format|
      if @log.save
        format.html { redirect_to activities_path, :notice => 'Activity was successfully checked off.' }
        # format.json { head :no_content }
        format.json { render :json => @log, :status => :created }
      else
        format.html { redirect_to activities_path }
        format.json { render :json => @log.errors, :status => :unprocessable_entity }
      end
    end
  end

end

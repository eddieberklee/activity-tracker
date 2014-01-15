class Log < ActiveRecord::Base
  attr_accessible :activity_id, :checked, :fordate
  belongs_to :activity

  after_save :delete_existing_log_with_same_day

  def delete_existing_log_with_same_day
    logs = Activity.find(self.activity_id).logs
    logs.each do |l|
      puts self.created_at.to_date
      puts l.created_at.to_date
      puts self.created_at.to_date == l.created_at.to_date
      if self.created_at.to_date == l.created_at.to_date and self != l
        l.destroy
      end
    end
  end
end


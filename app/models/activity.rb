class Activity < ActiveRecord::Base
  attr_accessible :title, :checked
  has_many :logs

  def today_log
    ordered = self.ordered_logs
    l = ordered[-1]
    if l
      if l.created_at.to_date == Time.now.to_date
        l
      else
        nil
      end
    end
  end

  def ordered_logs
    self.logs.order('created_at')
  end
end


class Activity < ActiveRecord::Base
  attr_accessible :title, :checked
  has_many :logs

  def today_log
    ordered = self.ordered_logs
    ordered[-1]
  end

  def ordered_logs
    self.logs.order('created_at')
  end
end


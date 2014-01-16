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

  def last_n_logs(n)
    if n > 0
      ordered = self.ordered_logs
      if !ordered.nil? and ordered.size > n
        return ordered[-n..-1]
      elsif !ordered.nil?
        return ordered
      else
        return []
      end
    end
  end

  def ordered_logs
    self.logs.order('created_at')
  end
end


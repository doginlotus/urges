class Urge < ApplicationRecord

  before_save :set_date

  


# DATA QUERIES
  def self.urges_date_count(date)
    Urge.where(date: date).count
  end

  def self.since_last
    @last_urge_time_in_db = Urge.all.order(datetime: :desc).first.datetime

    Time.now - @last_urge_time_in_db
  end  

  def self.urges_per_day(number_of_days)
    @end = Date.today
    @start = Date.today - number_of_days
    arrs = []
    (@start..@end).each{|date|
      arrs << [date, urges_date_count(date)]
    }
    return arrs
  end


  private

  def set_date
    self.date = self.datetime.to_date
  end
end

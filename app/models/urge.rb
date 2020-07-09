class Urge < ApplicationRecord

  before_save :set_date

  

  def self.since_last
    @last_urge_time_in_db = Urge.all.order(datetime: :desc).first.datetime

    Time.now - @last_urge_time_in_db
  end


  private

  def set_date
    self.date = self.datetime.to_date
  end
end

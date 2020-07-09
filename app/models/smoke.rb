class Smoke < ApplicationRecord
  before_save :set_date

  


  def self.since_last
    @most_recent = Smoke.all.order(datetime: :desc).first.datetime

    Time.now - @most_recent
  end


  private

  def set_date
    self.date = self.datetime.to_date
  end















end

class Smoke < ApplicationRecord
  before_save :set_date

  

# DATA QUERIES
  def self.smokes_date_count(date)
    Smoke.where(date: date).count
  end

  def self.since_last
    @most_recent = Smoke.all.order(datetime: :desc).first.datetime

    Time.now - @most_recent
  end

  def self.smokes_per_day(number_of_days)
    # @end = Date.today
    @start = Date.today - number_of_days
    daily_smokes = []

    until @start > Date.today
      daily_smokes << [@start, smokes_date_count(@start)]
      @start += 1
    end
      
    return daily_smokes
  end

  def self.date_of_first_data
    Smoke.all.order(date: :asc).first.date
  end


  private

  def set_date
    self.date = self.datetime.to_date
  end















end

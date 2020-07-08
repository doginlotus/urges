class Urge < ApplicationRecord

  before_save :set_date

  private

  def set_date
    self.date = self.datetime.to_date
  end
end

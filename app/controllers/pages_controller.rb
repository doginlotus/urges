class PagesController < ApplicationController
  def home
    # TODAY
    @smokes_today = Smoke.smokes_date_count(Date.today)
    @urges_today = Urge.urges_date_count(Date.today)
    @mins_since_last_smoke = Smoke.since_last
    @mins_since_last_urge = Urge.since_last


    # CHART
    
    data_table = GoogleVisualr::DataTable.new

    # Add Column Headers
    data_table.new_column('date', 'date' )
    data_table.new_column('number', 'Urges')
    data_table.new_column('number', 'Smokes')
    

    # Add Rows and Values
    @s = Smoke.smokes_per_day(14)
    @u = Urge.urges_per_day(14)
    @data = []
    @u.each{|urge_arr|
      @match = @s.select{|smoke_ar| smoke_ar[0] == urge_arr[0]}
      @new_arr = [urge_arr[0], urge_arr[1], @match[0][1] ]
      @data << @new_arr
    }

    data_table.add_rows(@data.reject{|arr| arr[0] < Smoke.date_of_first_data })
    options = {material: true, bars: "vertical", chart: {title: "Urges & Smokes per Day" , subtitle: "since #{}"}, colors: ["#FF9000", "#6EC5B8"] }
    
    
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, options)

  end

  def feed
  end

  def past
  end

  def data
  end

  def quitting
  end
end

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
    data_table.new_column('number', 'Smokes')
    data_table.new_column('number', 'Urges')

    # Add Rows and Values
    @s = Smoke.smokes_per_day(30)
    @u = Urge.urges_per_day(30)
    @data = []
    @u.each{|urge_arr|
      @match = @s.select{|smoke_ar| smoke_ar[0] == urge_arr[0]}
      @new_arr = [urge_arr[0], urge_arr[1], @match[1] ]
      @data << @new_arr
    }

    data_table.add_rows(@data)
    options ={ title: 'Urges & Smokes per day', width: "100%", height: "100%", material: true, background_color: {fill: "black"} }
    # @chart = GoogleVisualr::BarChart.new(data_table, options)
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

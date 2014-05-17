class GuestsController < ApplicationController
  before_filter :block_unauthenticated_users, except: [:show]

  def index
    @guests = User.all

    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'City')
    data_table.new_column('number', 'Number of guests')

    locations = User.group(:location).count
    data_table.add_rows(locations.count)

    locations.each_with_index do |location, index|
      data_table.set_cell(index, 0, location[0])
      data_table.set_cell(index, 1, location[1])
    end

    opts   = {
      :width => 800,
      :height => 500,
      displayMode: 'markers',
      region: '155',
      colorAxis: {colors: ['#fff', '#000']}
    }
    @chart = GoogleVisualr::Interactive::GeoChart.new(data_table, opts)
  end

  def guest_list
    @guests = User.all
    render json: @guests
  end

  def show
    @guest = User.find(params[:guest_id])
    render json: @guest, root: :guest
  end

  def achievements
    @achievements = User.find(params[:guest_id]).achievements
    render json: @achievements, root: :achievements
  end
end

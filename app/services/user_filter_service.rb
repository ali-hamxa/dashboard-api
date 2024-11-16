# frozen_string_literal: true

class UserFilterService
  def initialize(params)
    @params = params
  end

  def run
    users = User.all
    users = users.where(continent: @params[:continents]) if @params[:continents]
    users = users.where(country: @params[:countries]) if @params[:countries]
    users = users.where(state: @params[:states]) if @params[:states]
    users = users.where(city: @params[:cities]) if @params[:cities]
    users
  end
end

# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    render json: { users: User.all }
  rescue StandardError
    render json: { error: 'Unable to fetch users' }, status: :internal_server_error
  end

  def populate_filter_options
    filter_options = User.filter_options
    render json: {
      continents: filter_options[:continents],
      countries: filter_options[:countries],
      states: filter_options[:states],
      cities: filter_options[:cities],
      status: :ok
    }
  rescue StandardError
    render json: { error: 'Unable to populate the filters' }, status: :internal_server_error
  end

  def filter_users
    return render json: { message: 'Unprocessable Request' }, status: :unprocessable_entity unless params[:user]

    render json: { filtered_users: UserFilterService.new(user_params).run }
  rescue StandardError
    render json: { error: 'Unable to filter the users' }, status: :internal_server_error
  end

  private

  def user_params
    params.require(:user).permit(continents: [], countries: [], states: [], cities: [])
  end
end

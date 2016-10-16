class MoviesController < ApplicationController

  def show
    @movie = Movie.includes(:movie_details)
                 .where(id: params[:id]).first
  end

  def get_movies
    @selected_region = params[:region].present? ? params[:region] : '全部'
    @selected_movie_tag = params[:movie_tag].present? ? params[:movie_tag] : '全部'
    @selected_movie_type = params[:movie_type].present? ? params[:movie_type] : '全部'

    conditions = []
    values = []
    if params[:region].present? && params[:region] != '全部'
        conditions << "region = ?"
        values << params[:region]
    end

    if params[:movie_tag].present? && params[:movie_tag] != '全部'
        conditions << "movie_tag like ? "
        values << "%#{params[:movie_tag]}%"
    end

    if params[:movie_type].present? && params[:movie_type] != '全部'
      conditions << "movie_type = ? "
      values << params[:movie_type]
    end

    @movies = Movie.includes(:movie_details).where(conditions.join(' and '),*values)
                  .paginate(:page => params[:page], :per_page => 10)
    render 'homes/index'
  end


end

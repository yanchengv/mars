class MoviesController < ApplicationController
  layout "movie_layout"

  def index
    @selected_region = params[:region].present? ? params[:region] : '全部'
    @selected_movie_tag = params[:movie_tag].present? ? params[:movie_tag] : '全部'
    @selected_movie_type = params[:movie_type].present? ? params[:movie_type] : '全部'
    @movies = Movie.order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @movie_comment = MovieComment.new
    @movie_comments = MovieComment.includes(:user, :movie).where(movie_id: params[:id])
    @movie = Movie.includes(:movie_details)
                 .where(id: params[:id]).first

  end

  def get_movies
    @selected_region = params[:region].present? ? params[:region] : '全部'
    @selected_movie_tag = params[:tag].present? ? params[:tag] : '全部'
    @selected_movie_type = params[:type].present? ? params[:type] : '全部'

    conditions = []
    values = []
    if params[:region].present? && params[:region] != '全部'
      conditions << "region = ?"
      values << params[:region]
    end

    if params[:tag].present? && params[:tag] != '全部'
      conditions << "movie_tag like ? "
      values << "%#{params[:tag]}%"
    end

    if params[:type].present? && params[:type] != '全部'
      conditions << "movie_type = ? "
      values << params[:type]
    end

    if params[:grade].present?
      @movies = Movie.includes(:movie_details).where(conditions.join(' and '), *values).order('grade desc')
                    .paginate(:page => params[:page], :per_page => 10)
    elsif params[:created_at].present?

      @movies = Movie.includes(:movie_details).where(conditions.join(' and '), *values).order('created_at desc')
                    .paginate(:page => params[:page], :per_page => 10)
    else
      @movies = Movie.includes(:movie_details).where(conditions.join(' and '), *values)
                    .paginate(:page => params[:page], :per_page => 10)
    end
    render 'homes/index'
  end


  def search
    @movies = Movie.includes(:movie_details).where('name like ?', "%#{params[:name]}%")
                  .paginate(:page => params[:page], :per_page => 10)
    render 'movies/index'
  end

end

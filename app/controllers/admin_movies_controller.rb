class AdminMoviesController < ApplicationController
  layout "admin_layout"
  before_action :is_log?
  before_action :is_admin?


  def new

  end
  def create
    @movie = Movie.create(movie_params)
    movie_tag = params[:movie_tags].join(',')
    @movie.update_attributes({movie_tag: movie_tag})
    redirect_to '/admin_movies/'+@movie.id.to_s

  end


  def index
    current_page = params[:page].present? ? params[:page] : 1
    per_page = 20
    @movie_tags,@movie_types,@movie_regions=Tag.get_tags

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
                  .paginate(:page => current_page, :per_page => per_page)


  end

  def show
    @movie = Movie.includes(:movie_details).where(id: params[:id]).first
  end

  def get_movie_by_id
    @movie = Movie.includes(:movie_details).where(id: params[:movie_id]).first
    render json: @movie
  end

  #显示编辑movie的表单
  def edit
    @movie_tags,@movie_types,@movie_regions=Tag.get_tags
    @movie = Movie.find(params[:id])
  end

  # 更新提交
  def update
    movie_tag = params[:movie_tags].join(',')
    @movie = Movie.find(params[:movie_id])
    @movie.update_attributes(movie_params)
    @movie.update_attributes({movie_tag: movie_tag})
    redirect_to :back
  end

  def delete_movie
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to :back
  end


  def is_not_all
    @movies = Movie.includes(:movie_details).where('is_all = ? ', false)
                  .paginate(:page => params[:page], :per_page => 20)
    render 'admin_movies/index'
  end


  def search
    @movies = Movie.includes(:movie_details).where('name like ?', "%#{params[:name]}%")
                  .paginate(:page => params[:page], :per_page => 20)
    render 'admin_movies/index'
  end
  private

  def movie_params
    params.permit(:name, :sort, :region, :grade, :actors, :abstract, :image_url, :show_time, :movie_tag,:is_all, :movie_type, :number)
  end
end

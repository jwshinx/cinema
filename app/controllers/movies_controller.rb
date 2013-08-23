class MoviesController < ApplicationController      
  include Europe 
  include Flare
  
  def find_year
    #@movies = Movie.find_xxx_yyy 'gggg', 'uuuuu'
    #@movies = Movie.send "find_all_made_in_#{params[:year]}"
    @movies = Movie.find_all_by_year params[:year].to_i
  end
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all     
    puts with_dots { 'sddd'}  
    puts "---> 1 #{Movie.first.to_s}"   
    
    Movie.instance_eval { include Decoration }
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end   
  
  def revenues
    Movie.instance_eval { include Europe::Currency } 
    @movies = Movie.all             
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    @movie.extend Europe::Currency
    #class << @movie
    #  include Europe::Currency
    #end          
                                                                           
    pre = lambda { "In a world, "}
    post = lambda { " is one man..."}
    @decorator = MovieDecorator.new @movie.actors.first.fullname, pre, post 

    if request.path != movie_path(@movie)  
      redirect_to @movie, status: :moved_permanently
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end
end

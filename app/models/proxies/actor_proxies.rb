module ActorProxies
  class FavoriteActorProxy
    def initialize object, fan_type
      @object = object          
      @type = fan_type
      if @type == 'adult'     
        @to_year = (Date.today-10.years).year       
        @from_year = (Date.today-40.years).year   
      elsif @type == 'teenager'
        @to_year = Date.today.year       
        @from_year = (Date.today-10.years).year
      elsif @type == 'senior'       
        @to_year = (Date.today-40.years).year       
        @from_year = (Date.today-80.years).year   
      else
        @to_year, @from_year = Date.today.year, Date.today.year     
      end
      @movies = {:movies => '', :favorite_movie => ''}
    end
    
    def to_s
      @object.to_s
    end
    
    def method_missing(name, *args)
      if name =~ /^best_of_(teenager|adult|senior|.*)/        
        @movies[:movies] = @object.movies.between(@from_year, @to_year).by_oldest.all
        @movies[:favorite_movie] = @object.movies.between(@from_year, @to_year).by_oldest.first 
        return @movies
      end
      super
    end
  end
end
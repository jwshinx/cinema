class FavoritesController < ApplicationController
  include ActorProxies
  
  def favorite_actor
                  
    @actor = Actor.find params[:id]
    @fap = FavoriteActorProxy.new @actor, params[:type]      
    @info = @fap.send( "best_of_#{params[:type]}")                                               

  end
end

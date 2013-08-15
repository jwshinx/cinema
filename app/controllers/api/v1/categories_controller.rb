module Api
  module V1
    class CategoriesController < ApplicationController  
      #skip_before_filter :verify_authenticity_token, :only => [:create]
                                                                               
      before_filter :restrict_access
      
      respond_to :json
            
      def index
        respond_with Category.select('name, description').all
      end                     
      
      def show
        respond_with Category.select('name, description').find(params[:id])
      end 
      def create
        respond_with Category.create(params[:category])
      end
      def update
        respond_with Category.update(params[:id], params[:category])
      end
      def destroy
        respond_with Category.destroy(params[:id])
      end
      
    private
      #def restrict_access
      #  api_key = ApiKey.find_by_access_token(params[:access_token])
      #  head :unauthorized unless api_key
      #end
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token)
        end
      end  
    end
  end
end
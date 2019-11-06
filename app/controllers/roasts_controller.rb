class RoastsController < ApplicationController

  before_action :authenticate_user!, :except => [ :show, :index ]

def authenticate_admin!
  unless current_user.admin?
    redirect_to new_user_session_path
  end
end

before_action :authenticate_admin!

    def index
        @roasts = Roast.all
      end
    def show
        @roast = Roast.find(params[:id])
      end
  
    def new
      if current_user.admin?
      end
    end
  
    def edit
      if current_user.admin?
      @roast = Roast.find(params[:id])
    end
    end
  
    def create
      if current_user.admin?

        @roast = Roast.new(roast_params)
      
        @roast.save
        redirect_to @roast
      end
      end
  
      def update
        if current_user.admin?
          @roast = Roast.find(params[:id])
      
        @roast.update(roast_params)
        redirect_to @roast
      end
      end
  
      def destroy
        if current_user.admin?
          @roast = Roast.find(params[:id])
        @roast.destroy
      
        redirect_to root_path
      end
      end
  end

  private
  def roast_params
    params.require(:roast).permit(:name)
  end

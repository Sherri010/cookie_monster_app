class DessertsController < ApplicationController
   before_action :authorize, only: [:show, :favorite, :save_as_favorite]
  before_action :set_favorite_dessert_id, only: [:show, :favorite]
  # GET /desserts
  def index
    @desserts = Dessert.all
  end

  # GET /desserts/1
  def show

    ## CHALLENGE 4: This is my favorite dessert!
    ### Detect whether the dessert the user is viewing
    ### is their favorite_dessert, and add the words
    ### 'FAVORITE dessert' in the `views/desserts/show.html.erb` template

    @dessert = Dessert.find(params[:id])
    render "show"
  end

  # GET /desserts/favorite
  # Shows the user's favorite dessert (if set in the session)
  def favorite

    ## CHALLENGE 3: Render my favorite_dessert!
    ### Check my session for my `favorite_dessert_id`
    ### and then render my favorite dessert
    ### AS-IS this will raise an error



    @dessert = Dessert.find(favorite_dessert_id)
    render 'show'
  end

  # POST /desserts/1/save_as_favorite
  # Sets the user's favorite dessert in their session
  def save_as_favorite

    session[:favorite_dessert_id] = params[:id] # SET favorite
    flash[:notice] = "dessert #{params[:id]} saved in session as favorite!"
    #redirect_to root_path
    redirect_to show_dessert_path
  end

  private

  def set_favorite_dessert_id
    @favorite_dessert_id = session[:favorite_dessert_id]
  end
end

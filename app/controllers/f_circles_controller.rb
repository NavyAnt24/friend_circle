class FCirclesController < ApplicationController

  def new
    render :new
  end

  def create
    params[:f_circle][:user_id] = current_user.id
    @fcircle = FCircle.new(params[:f_circle])

    if @fcircle.save
      redirect_to f_circle_url(@fcircle)
    else
      flash[:errors] = @fcircle.errors.full_messages
      redirect_to new_f_circle_url
    end
  end

  def show
    @fcircle = FCircle.find(params[:id])

  end

end

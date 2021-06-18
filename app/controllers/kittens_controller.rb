class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)

    if @kitten.save
      flash[:notice] = 'Your kitten has been added.'
      redirect_to kitten_path(@kitten)
    else
      flash.now[:alert] = "Your kitten couldn't be created!"
      render :new
    end
  end

  def edit
  end

  def uptdate
  end

  def destroy
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end

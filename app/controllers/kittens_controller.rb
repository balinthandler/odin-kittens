class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @kitten }
    end    
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
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    redirect_to root_path
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end

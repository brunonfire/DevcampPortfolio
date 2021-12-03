class PortfoliosController < ApplicationController
  def index
    @portfolio_item = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
        format.json { render :show, status: :created, location: portfolios_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully edited." }
        format.json { render :show, status: :ok, location: portfolios_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])

  end

  def destroy
    # perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record was removed." }
      format.json { head :no_content }
      end
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end

end

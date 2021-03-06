class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end 
    
    def new
        @portfolio_items = Portfolio.new
    end
    
     def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new }
      end
    end
     end
     
     
def edit
  @portfolio_item = Portfolio.find(params[:id])
end
    
  def update
    @portfolio_item = Portfolio.find(params[:id])  
      
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

    def show 
        @portfolio_item = Portfolio.find(params[:id])
    end
    
    def destroy
        #this is going to perform the look up 
     @portfolio_item = Portfolio.find(params[:id])
        #Destry/delte the records
    @portfolio_item.destroy
    
    #redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
    end 
end 


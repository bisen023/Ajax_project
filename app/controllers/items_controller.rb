class ItemsController < ApplicationController
  def index
      @items = Item.page(params[:page]).per(10).order(created_at: :desc)
  end

  def filter
    @items = Item.by_category(params[:category]).page(params[:page]).per(10)
    respond_to do |format|
      format.js
      format.html { render partial: "items", locals: { items: @items } }
    end
  end

  def show
    @item = Item.find(params[:id])
     respond_to do |format|
      format.js
    end
end

def edit
  @item = Item.find(params[:id])
  respond_to do |format|
    format.js
  end

end

def update
  @item = Item.update(items_params)
  if @item.update
    respond_to do |format|
    format.js
    end
end
end

def new
  @item = Item.new
    respond_to do |format|
    format.js
  end
end

def create
  @item = Item.create(items_params)
  if @item.save
    respond_to do |format|
      format.turbo_stream
    end
  end
end

def edit
  @item = Item.find(params[:id])
end

def update
  @item = Item.find(params[:id])
  if @item.update(items_params)
    respond_to do |format|
      format.js
      end
  end
end

def destroy
  @item = Item.find(params[:id])
  @item.destroy
      respond_to do |format|
      format.js 
    end
end
private 
def items_params
    params.require(:item).permit(:name, :category)
end
end

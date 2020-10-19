class NotesController < ApplicationController
  def index
    @notes = Note.all.order('created_at DESC')
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @note_shop = NoteShop.new
  end

  def create
    @user = current_user
    @note_shop = NoteShop.new(note_params)
    if @note_shop.valid?
      @note_shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    gon.note = @note
    @shop = Shop.find(params[:id])
    gon.shop = @shop
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      redirect_to root_path
    end
  end

  private

  def note_params
    params.require(:note_shop).permit(:name, :rating, :image, :comment, :bitter, :acidity, :aroma, :body, :roast_date, :grams, :price, :shop_name, :purchase_date, :location).merge(user_id: current_user.id)
  end

end

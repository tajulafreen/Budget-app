class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: %i[show edit update destroy]

  def index
    @records = Record.all
  end

  def show; end

  def new
    @attributes = []
    @record = Record.new
    @attributes << @record
    @categories = current_user.categories
    @attributes << @categories
  end

  def edit
    @attributes = []
    @attributes << @record
    @categories = current_user.categories
    @attributes << @categories
  end

  def create
    @attributes = []
    @record = Record.new(record_fields)
    # @record.author = current_user
    @record.author_id = current_user.id
    category_id = params[:record][:category_id]
    if category_id.present?
      category = Category.find(category_id)
      @record.categories << category
    end
    @attributes << @record
    @categories = current_user.categories
    @attributes << @categories
    respond_to do |format|
      if @record.save
        format.html do
          redirect_to category_url(@record.categories[0]), notice: 'Record was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_fields)
        format.html { redirect_to purchase_url(@record), notice: 'Record was successfully updated.' }

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Record was successfully deleted.' }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_fields
    params.require(:record).permit(:name, :amount)
  end
end

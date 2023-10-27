class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: %i[show edit update destroy]
  
    def index
      @categories = current_user.categories.includes(:records)
    end
  
    def show
      @records = @category.records.order(created_at: :desc)
    end
  
    def new
      @category = Category.new
    end
  
    def edit; end
  
    def create
      @category = Category.new(category_input)
      @category.user = current_user
  
      respond_to do |format|
        if @category.save
          handle_uploaded_icon_file if category_input[:icon].present?
          format.html { redirect_to categories_path, notice: 'Category successfully.' }
          
        else
          format.html { render :new, status: :unprocessable_entity }
          
        end
      end
    end
  
    def update
      respond_to do |format|
        if @category.update(category_input)
          handle_uploaded_icon_file if category_input[:icon].present?
          format.html { redirect_to category_url(@category), notice: 'Category updated.' }
         
        else
          format.html { render :edit, status: :unprocessable_entity }
         
        end
      end
    end
  
    def destroy
      @category.destroy
  
      respond_to do |format|
        format.html { redirect_to categories_url, notice: 'Category deleted.' }
        
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_input
      params.require(:category).permit(:name, :icon)
    end
  
    def handle_uploaded_icon_file
      uploaded_file = category_input[:icon]
      file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
  
      File.binwrite(file_path, uploaded_file.read)
  
      @category.update(icon: File.join('/uploads', uploaded_file.original_filename))
    end
  end
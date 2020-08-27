class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  def index
    @reviews = @book.reviews
  end

  def show
  end

  def new
    @review = @book.reviews.new

    render :_form
  end
  
  def create
    @review = @book.reviews.new(review_params)

    if @review.save
      redirect_to [@book, @review]
      # book_review_path(@book, @review)
    else
      render :new
    end
  end

  def edit
    render :_form
  end

  def update
    if @review.update(review_params)
      redirect_to [@book, @review]
       # book_review_path(@book, @review)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to book_reviews_path
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :author, :body)
    end
end

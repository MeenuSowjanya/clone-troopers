class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @article_to_clone_id = params[:article_id]
    @edit = params[:edit]
    @clone = params[:clone]
    puts "ppppppppppppppppppppp"
    puts (@edit.to_i == 1)
    puts @clone

    if @article_to_clone_id.to_i != 0
      @article_record_to_clone = Article.find(@article_to_clone_id)
      @title = (@clone.to_i == 1) ? "Clone of #{@article_record_to_clone.title}" : @article_record_to_clone.title
      @description = @article_record_to_clone.description 
      @header = (@clone.to_i == 1) ? "New Article" : "Edit Article"
      @footer = (@clone.to_i == 1) ? "Create Article" : "Update Article"
    elsif @article_to_clone_id.to_i == 0
      @title = ""
      @description = ""
      @header = "New Article"
      @footer = "Create Article"
    end
    
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :folder_id)
    end
end

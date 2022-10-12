# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
    @article_to_clone_id = params[:article_id]
    unless @article_to_clone_id.nil?
      @article_record_to_clone = Article.find(@article_to_clone_id)
      @title = "Clone of #{@article_record_to_clone.title}"
      @description = @article_record_to_clone.description
    end
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: 'Article was successfully created.' }
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
        format.html { redirect_to article_url(@article), notice: 'Article was successfully updated.' }
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
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def solution_article_new
    @article = Article.new
    @ticket = Ticket.find(params[:ticket_id])
    @title = params[:title]
    @option = params[:redirect_to]
    case @option.to_i
    when 1
      @description = @ticket.description
    when 2
      @description = @ticket.notes.last.description
    when 3
      @description = @ticket.replies.last.description
    end
    puts "wdcjosqo;qsjopqj'dpkqs[d',qlwmklsw"
    puts @description
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

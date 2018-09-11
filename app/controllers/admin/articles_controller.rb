class Admin::ArticlesController < ApplicationController
  layout 'admin'
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    journal = Journal.find(params[:journal_id])
    @issue = journal.issues.find(params[:issue_id])
    @articles = @issue.articles.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    @article = issue.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    @article = issue.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin, @article.issue.journal, @article.issue, @article], notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @article.issue.journal, @article.issue, @article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_journal_issue_articles_url(@article.issue.journal, @article.issue), notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      journal = Journal.find(params[:journal_id])
      issue = journal.issues.find(params[:issue_id])
      @article = issue.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:issue, :title, :abstract, :paper)
    end
end

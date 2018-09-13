class Admin::KeywordsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_keyword, only: [:show, :edit, :update, :destroy]

  # GET /keywords
  # GET /keywords.json
  def index
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    @article = issue.articles.find(params[:article_id])
    @keywords = @article.keywords.all
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
  end

  # GET /keywords/new
  def new
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    article = issue.articles.find(params[:article_id])
    @keyword = article.keywords.new
  end

  # GET /keywords/1/edit
  def edit
  end

  # POST /keywords
  # POST /keywords.json
  def create
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    article = issue.articles.find(params[:article_id])
    @keyword = article.keywords.new(keyword_params)

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to admin_journal_issue_article_keywords_url(@keyword.article.issue.journal, @keyword.article.issue, @keyword.article), notice: '关键词保存成功！' }
        format.json { render :show, status: :created, location: @keyword }
      else
        format.html { render :new }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keywords/1
  # PATCH/PUT /keywords/1.json
  def update
    respond_to do |format|
      if @keyword.update(keyword_params)
        format.html { redirect_to admin_journal_issue_article_keywords_url(@keyword.article.issue.journal, @keyword.article.issue, @keyword.article), notice: '关键词修改成功！' }
        format.json { render :show, status: :ok, location: @keyword }
      else
        format.html { render :edit }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to admin_journal_issue_article_keywords_url(@keyword.article.issue.journal, @keyword.article.issue, @keyword.article), notice: 'Keyword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keyword
      journal = Journal.find(params[:journal_id])
      issue = journal.issues.find(params[:issue_id])
      article = issue.articles.find(params[:article_id])
      @keyword = article.keywords.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keyword_params
      params.require(:keyword).permit(:article_id, :keyword)
    end
end

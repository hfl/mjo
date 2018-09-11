class Admin::AuthorsController < ApplicationController
  layout 'admin'
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    article = issue.articles.find(params[:article_id])
    @authors = article.authors.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
  end

  # GET /authors/new
  def new
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    article = issue.articles.find(params[:article_id])
    @author = article.authors.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    journal = Journal.find(params[:journal_id])
    issue = journal.issues.find(params[:issue_id])
    article = issue.articles.find(params[:article_id])
    @author = article.authors.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to [:admin, @author.article.issue.journal, @author.article.issue, @author.article, @author], notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to [:admin, @author.article.issue.journal, @author.article.issue, @author.article, @author], notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to admin_journal_issue_article_authors_url(@author.article.issue.journal, @author.article.issue, @author.article), notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      journal = Journal.find(params[:journal_id])
      issue = journal.issues.find(params[:issue_id])
      article = issue.articles.find(params[:article_id])
      @author = article.authors.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :unit, :introduce, :order)
    end
end

class TwitterAccountsController < ApplicationController
  before_action :admin_only
  before_action :set_twitter_account, only: [:show, :edit, :update, :destroy]

  # GET /twitter_accounts
  def index
    @twitter_accounts = TwitterAccount.all
  end

  # GET /twitter_accounts/1
  def show
  end

  # GET /twitter_accounts/new
  def new
    @twitter_account = TwitterAccount.new
  end

  # GET /twitter_accounts/1/edit
  def edit
  end

  # POST /twitter_accounts
  def create
    @twitter_account = TwitterAccount.new(twitter_account_params)

    if @twitter_account.save
      redirect_to @twitter_account, notice: 'Twitter account was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /twitter_accounts/1
  def update
    if @twitter_account.update(twitter_account_params)
      redirect_to @twitter_account, notice: 'Twitter account was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /twitter_accounts/1
  def destroy
    @twitter_account.destroy
    redirect_to twitter_accounts_url, notice: 'Twitter account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_account
      @twitter_account = TwitterAccount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def twitter_account_params
      params.require(:twitter_account).permit(:handle, :access_token, :access_secret, :hash_tags, :veggie_id)
    end
end

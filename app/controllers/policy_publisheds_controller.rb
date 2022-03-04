class PolicyPublishedsController < ApplicationController
  before_action :set_policy_published, only: %i[ show edit update destroy ]

  # GET /policy_publisheds or /policy_publisheds.json
  def index
    @policy_publisheds = PolicyPublished.all
  end

  # GET /policy_publisheds/1 or /policy_publisheds/1.json
  def show
  end

  # GET /policy_publisheds/new
  def new
    @policy_published = PolicyPublished.new
  end

  # GET /policy_publisheds/1/edit
  def edit
  end

  # POST /policy_publisheds or /policy_publisheds.json
  def create
    @policy_published = PolicyPublished.new(policy_published_params)

    respond_to do |format|
      if @policy_published.save
        format.html { redirect_to policy_published_url(@policy_published), notice: "Policy published was successfully created." }
        format.json { render :show, status: :created, location: @policy_published }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @policy_published.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policy_publisheds/1 or /policy_publisheds/1.json
  def update
    respond_to do |format|
      if @policy_published.update(policy_published_params)
        format.html { redirect_to policy_published_url(@policy_published), notice: "Policy published was successfully updated." }
        format.json { render :show, status: :ok, location: @policy_published }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @policy_published.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_publisheds/1 or /policy_publisheds/1.json
  def destroy
    @policy_published.destroy

    respond_to do |format|
      format.html { redirect_to policy_publisheds_url, notice: "Policy published was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy_published
      @policy_published = PolicyPublished.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def policy_published_params
      params.require(:policy_published).permit(:domain, :adkim, :aspf, :p, :pct)
    end
end

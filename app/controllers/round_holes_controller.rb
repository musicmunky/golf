class RoundHolesController < ApplicationController
  before_action :set_round_hole, only: [:show, :edit, :update, :destroy]

  # GET /round_holes
  # GET /round_holes.json
  def index
    @round_holes = RoundHole.all
  end

  # GET /round_holes/1
  # GET /round_holes/1.json
  def show
  end

  # GET /round_holes/new
  def new
    @round_hole = RoundHole.new
  end

  # GET /round_holes/1/edit
  def edit
  end

  # POST /round_holes
  # POST /round_holes.json
  def create
    @round_hole = RoundHole.new(round_hole_params)

    respond_to do |format|
      if @round_hole.save
        format.html { redirect_to @round_hole, notice: 'Round hole was successfully created.' }
        format.json { render :show, status: :created, location: @round_hole }
      else
        format.html { render :new }
        format.json { render json: @round_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /round_holes/1
  # PATCH/PUT /round_holes/1.json
  def update
    respond_to do |format|
      if @round_hole.update(round_hole_params)
        format.html { redirect_to @round_hole, notice: 'Round hole was successfully updated.' }
        format.json { render :show, status: :ok, location: @round_hole }
      else
        format.html { render :edit }
        format.json { render json: @round_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /round_holes/1
  # DELETE /round_holes/1.json
  def destroy
    @round_hole.destroy
    respond_to do |format|
      format.html { redirect_to round_holes_url, notice: 'Round hole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round_hole
      @round_hole = RoundHole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_hole_params
      params.require(:round_hole).permit(:round_id, :course_hole_id, :score, :putts)
    end
end

class TaxCalculationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tax_calculation, only: [:show, :edit, :update, :destroy]

  # GET /tax_calculations
  # GET /tax_calculations.json
  def index
    @tax_calculations = current_user.tax_calculations.includes(:tax_rule).all.order(created_at: :desc)
  end

  # GET /tax_calculations/1
  # GET /tax_calculations/1.json
  def show
  end

  # GET /tax_calculations/new
  def new
    @tax_calculation = current_user.tax_calculations.new
  end

  # GET /tax_calculations/1/edit
  def edit
  end

  # POST /tax_calculations
  # POST /tax_calculations.json
  def create
    @tax_calculation = current_user.tax_calculations.new(tax_calculation_params)
    tax_rule = current_user.tax_rules.where('(min_value IS NOT NULL AND max_value IS NOT NULL) AND (min_value <= ? AND max_value >= ?)', params[:tax_calculation][:value], params[:tax_calculation][:value])&.first
    tax_rule = current_user.tax_rules.where('(min_value IS NOT NULL AND max_value IS NULL) AND (min_value <= ?)', params[:tax_calculation][:value])&.first if tax_rule.blank?
    if tax_rule.present?
      @tax_calculation.tax_rule = tax_rule
      @tax_calculation.tax_amount = params[:tax_calculation][:value].to_f * (tax_rule.percentage.to_f / 100.to_f)
      respond_to do |format|
        if @tax_calculation.save
          format.html  {
            flash[:success] = 'Tax calculation was successfully created.'
            redirect_to @tax_calculation
          }
          format.json { render :show, status: :created, location: @tax_calculation }
        else
          error_messages = []
          @tax_calculation.errors.messages.each do |attribute, message|
            error_messages << "#{attribute.to_s} #{message.to_s}"
          end
          format.html {
            flash[:error] = error_messages.join(', ').presence || 'There was an error, try again'
            render :new
          }
          format.json { render json: @tax_calculation.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'There is no range to cover this value. Add it in the tax rules'
          render :new
        }
        format.json { render json: { message: 'There is no range to cover this value. Add it in the tax rules' }, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tax_calculations/1
  # PATCH/PUT /tax_calculations/1.json
  def update
    tax_rule = current_user.tax_rules.where('(min_value IS NOT NULL AND max_value IS NOT NULL) AND (min_value <= ? AND max_value >= ?)', params[:tax_calculation][:value], params[:tax_calculation][:value])&.first
    tax_rule = current_user.tax_rules.where('(min_value IS NOT NULL AND max_value IS NULL) AND (min_value <= ?)', params[:tax_calculation][:value])&.first if tax_rule.blank?
    if tax_rule.present?
      @tax_calculation.tax_rule = tax_rule
      @tax_calculation.tax_amount = params[:tax_calculation][:value].to_f * (tax_rule.percentage.to_f / 100.to_f)
      respond_to do |format|
        if @tax_calculation.update(tax_calculation_params)
          format.html {
            flash[:success] = 'Tax calculation was successfully updated.'
            redirect_to @tax_calculation
          }
          format.json { render :show, status: :ok, location: @tax_calculation }
        else
          error_messages = []
          @tax_calculation.errors.messages.each do |attribute, message|
            error_messages << "#{attribute.to_s} #{message.to_s}"
          end
          format.html {
            flash[:error] = error_messages.join(', ').presence || 'There was an error, try again'
            render :edit
          }
          format.json { render json: @tax_calculation.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = 'There is no range to cover this value. Add it in the tax rules'
          render :edit
        }
        format.json { render json: { message: 'There is no range to cover this value. Add it in the tax rules' }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_calculations/1
  # DELETE /tax_calculations/1.json
  def destroy
    @tax_calculation.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = 'Tax calculation was successfully destroyed.'
        redirect_to tax_calculations_url
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_calculation
      @tax_calculation = current_user.tax_calculations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tax_calculation_params
      params.require(:tax_calculation).permit(:value)
    end
end

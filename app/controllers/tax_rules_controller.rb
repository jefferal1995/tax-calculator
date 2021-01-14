class TaxRulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tax_rule, only: [:show, :edit, :update, :destroy]

  # GET /tax_rules
  # GET /tax_rules.json
  def index
    @tax_rules = current_user.tax_rules.all.order(min_value: :asc)
  end

  # GET /tax_rules/1
  # GET /tax_rules/1.json
  def show
  end

  # GET /tax_rules/new
  def new
    @tax_rule = current_user.tax_rules.new
  end

  # GET /tax_rules/1/edit
  def edit
  end

  # POST /tax_rules
  # POST /tax_rules.json
  def create
    @tax_rule = current_user.tax_rules.new(tax_rule_params)

    respond_to do |format|
      if @tax_rule.save
        format.html {
          flash[:success] = 'Tax rule was successfully created.'
          redirect_to @tax_rule
        }
        format.json { render :show, status: :created, location: @tax_rule }
      else
        error_messages = []
        @tax_rule.errors.messages.each do |attribute, message|
          error_messages << "#{attribute.to_s} #{message.to_s}"
        end
        format.html {
          flash[:error] = error_messages.join(', ').presence || 'There was an error, try again'
          render :new
        }
        format.json { render json: @tax_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tax_rules/1
  # PATCH/PUT /tax_rules/1.json
  def update
    respond_to do |format|
      if @tax_rule.update(tax_rule_params)
        format.html {
          flash[:success] = 'Tax rule was successfully updated.'
          redirect_to @tax_rule
        }
        format.json { render :show, status: :ok, location: @tax_rule }
      else
        error_messages = []
        @tax_rule.errors.messages.each do |attribute, message|
          error_messages << "#{attribute.to_s} #{message.to_s}"
        end
        format.html {
          flash[:error] = error_messages.join(', ').presence || 'There was an error, try again'
          render :edit
        }
        format.json { render json: @tax_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_rules/1
  # DELETE /tax_rules/1.json
  def destroy
    @tax_rule.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Tax rule was successfully destroyed.'
        redirect_to tax_rules_url
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_rule
      @tax_rule = current_user.tax_rules.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tax_rule_params
      params.require(:tax_rule).permit(:min_value, :max_value, :percentage)
    end
end

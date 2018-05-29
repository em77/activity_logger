class LogsController < ApplicationController
  before_action :require_login
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :set_referer, only: [:destroy, :edit, :new]
  after_action :verify_authorized

  attr_accessor :log, :logs, :date_field_value, :css_id
  helper_method :log, :logs, :date_field_value, :css_id

  def index
    @logs = search_handler
    authorize @logs
    @logs = @logs.send(params[:status_sort].to_sym) if params[:status_sort]
    @logs = filter_handler(@logs)
    @logs = @logs.paginate(page: params[:page])
  end

  def toggle_processed
    @log = Log.find(params.require(:log_id))
    @css_id = params.require(:css_id)
    authorize Log
    respond_to do |format|
      format.js
    end
  end

  def search_handler
    if params[:search].nil? || params[:search].empty?
      flash.now[:success] = "Displaying all logs"
      return Log.all
    end

    result = Log.search(params[:search])

    if result.empty?
      flash.now[:error] = "No search result(s) for \"#{params[:search]}\"" +
        " - Displaying all logs"
      Log.all
    else
      flash.now[:success] = "#{result.count} search result(s) for" +
        " \"#{params[:search]}\""
      result
    end
  end

  def show
    authorize @log
  end

  def new
    @log = Log.new
    @date_field_value = Time.zone.now.strftime("%m-%d-%Y")
    authorize @log
  end

  def create
    @log = Log.new(log_params)
    @log.date = Date.strptime(log_params[:date], '%m-%d-%Y')
    authorize @log

    if @log.valid?
      @log.save
      redirect_to(new_log_path, notice: "Log submitted successfully")
    else
      flash[:error] = @log.errors.full_messages.to_sentence
      redirect_to(session.delete(:return_to))
    end
  end

  def edit
    authorize @log
    @date_field_value = @log.date.strftime("%m-%d-%Y")
  end

  def update
    authorize @log
    if @log.update(log_params)
      flash[:success] = "Log updated successfully"
      redirect_to logs_path
    else
      redirect_to logs_path, error: "Log update failed"
    end
  end

  def destroy
    authorize @log
    log.destroy
    redirect_to logs_path, notice: "Log deleted"
  end

  def destroy_logs
    authorize Log
    time_period = (params.require(:older_than).to_i).weeks.ago
    destroy_set = Log.where("created_at < ?", time_period)
    destroy_set.destroy_all
    redirect_to logs_path, notice: "Logs deleted in specified time period"
  end

  def filter_handler(logs)
    if params[:order]
      orderer(logs, params[:order], params[:order_direction])
    else
      orderer(logs, "created_at", "desc")
    end
  end

  def orderer(logs, order_by, order_direction = "asc")
    logs.reorder("#{order_by} #{order_direction}")
  end

  private
    def set_log
      @log = Log.find(params.require(:id))
    end

    def log_params
      params.require(:log).permit(:staff_last_name, :member_last_name,
        :member_first_name, :duration, :end_time, :education_support,
        :pre_vocational, :transitional_employment,
        :intensive_supported_employment, :ongoing_supported_employment,
        :psychosocial_rehabilitation, :habilitation, :family_support,
        :face_to_face, :activity_log, :follow_up, :date, :nbs)
    end
end

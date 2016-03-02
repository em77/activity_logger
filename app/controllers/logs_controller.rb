class LogsController < ApplicationController
  before_action :require_login,
    only: [:new, :create, :edit, :destroy, :update]
  before_action :set_log, only: [:show, :edit, :update, :destroy, :show]
  before_action :set_referer, only: [:destroy, :edit, :new]
  after_action :verify_authorized

  attr_accessor :log, :logs, :date_field_value, :css_id
  helper_method :log, :logs, :date_field_value, :css_id

  def index
    @logs = Log.all
    authorize @logs
    @logs = status_filter(@logs, params[:status_sort])
    @logs = filter_handler(@logs)
    @logs = @logs.paginated(params[:page])
  end

  def toggle_processed
    @log = Log.find(params[:log_id])
    @css_id = params[:css_id]
    authorize Log
    respond_to do |format|
      format.js
    end
  end

  def show
    authorize @log
  end

  def new
    @log = Log.new
    @date_field_value = Time.now.strftime("%m-%d-%Y")
    authorize @log
  end

  def create
    @log = Log.new(log_params)
    authorize @log

    if @log.valid?
      @log.save
      redirect_to(session.delete(:return_to) || root_path, notice:
        "Log submitted successfully")
    else
      flash[:error] = @log.errors.full_messages.to_sentence
      redirect_to(session.delete(:return_to))
    end
  end

  def edit
    authorize @log
    @date_field_value = @log.date
  end

  def update
    authorize @log
    if @log.update(log_params)
      flash[:success] = "Log updated successfully"
      redirect_to logs_path
    else
      redirect_to logs_path, alert: "Log update failed"
    end
  end

  def destroy
    authorize @log
    log.destroy
    redirect_to logs_path, notice: "Log deleted"
  end

  def filter_handler(logs)
    # logs = show_open_jobs(logs) if params[:open_jobs]
    if params[:order]
      logs = orderer(logs, params[:order], params[:order_direction])
    else
      logs = orderer(logs, "created_at", "desc")
    end
    logs
  end

  def orderer(logs, order_by, order_direction = "asc")
    logs.order("#{order_by} #{order_direction}")
  end

  def status_filter(logs, status = "all")
    case status
    when "processed"
      logs.where("status = ?", 1)
    when "not_processed"
      logs.where("status = ?", 0)
    else
      logs
    end
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end

    def log_params
      params.require(:log).permit(:staff_last_name, :member_last_name,
        :member_first_name, :duration, :start_time, :education_support,
        :pre_vocational, :transitional_employment,
        :intensive_supported_employment, :ongoing_supported_employment,
        :psychosocial_rehabilitation, :habilitation, :family_support,
        :face_to_face, :activity_log, :follow_up, :date)
    end
end

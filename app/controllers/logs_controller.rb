class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  before_action :set_referer, only: [:destroy, :edit, :new]

  attr_accessor :log
  helper_method :log

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.valid?
      @log.save
      redirect_to(session.delete(:return_to) || root_path, notice:
        "Log submitted successfully")
    else
      flash[:error] = @log.errors.full_messages.to_sentence
      redirect_to(session.delete(:return_to))
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

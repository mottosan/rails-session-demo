class SampleSessionsController < ApplicationController
  def index
    @sample_sessions = session.to_h
    render "index"
  end

  def create
    @sample_session = SampleSession.new(session_params)

    if @sample_session.valid?
      session[@sample_session.key] = @sample_session.value
      redirect_to sample_sessions_path
    else
      render :new
    end
  end

  def new
    @sample_session = SampleSession.new
    render "new"
  end

  def destroy
    session.delete(params[:id])
    redirect_to sample_sessions_path
  end

  private

  def session_params
    params.require(:sample_session).permit(:key, :value)
  end
end

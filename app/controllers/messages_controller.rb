class MessagesController < ApplicationController
  include CableReady::Broadcaster
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all.order(id: :desc)
    @message = Message.new
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.create(message_params)
    cable_ready["message"].insert_adjacent_html(
      selector: "#message",
      position: "afterbegin",
      html: render_to_string(partial: "message", locals: {message: @message})
    )
    cable_ready.broadcast
    redirect_to messages_path
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end

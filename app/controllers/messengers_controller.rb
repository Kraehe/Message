class MessengersController < ApplicationController
  before_action :set_messenger, only: [:show, :edit, :update, :destroy]

  # GET /messengers
  # GET /messengers.json
  def index
    @messenger = Messenger.new
    @messengers = Messenger.all
  end

  # GET /messengers/1
  # GET /messengers/1.json
  def show
    @messenger.destroy
    respond_to do |format|
      format.html { redirect_to messengers_url, notice: 'Your message has been sent.' }
      format.json { head :no_content }
    end
  end

  # GET /messengers/new
  def new
    @messenger = Messenger.new
  end

  # GET /messengers/1/edit
  def send_message

  end

  # POST /messengers
  # POST /messengers.json
  def create
    @messenger = Messenger.new(messenger_params)

    respond_to do |format|
      if @messenger.save
        @client = Twilio::REST::Client.new
        @client.messages.create(
          from: '+19293252653',
          to: '+1' + @messenger.phone,
          body: @messenger.message
          )

        format.html { redirect_to @messenger, notice: 'Messenger was successfully created.' }
        format.json { render :show, status: :created, location: @messenger }

      else
        format.html { render :new }
        format.json { render json: @messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messengers/1
  # PATCH/PUT /messengers/1.json
  def update
    respond_to do |format|
      if @messenger.update(messenger_params)
        format.html { redirect_to @messenger, notice: 'Messenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @messenger }
      else
        format.html { render :edit }
        format.json { render json: @messenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messengers/1
  # DELETE /messengers/1.json
  def destroy
    @messenger.destroy
    respond_to do |format|
      format.html { redirect_to messengers_url, notice: 'Messenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messenger
      @messenger = Messenger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messenger_params
      params.require(:messenger).permit(:email, :phone, :message)
    end
end

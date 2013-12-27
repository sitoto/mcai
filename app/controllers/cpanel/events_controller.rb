class Cpanel::EventsController < Cpanel::ApplicationController
  def index
    @cpanel_events = Event.all.desc(:id).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cpanel_events }
    end
  end

  def show
    @cpanel_event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cpanel_event }
    end
  end

  def new
    @cpanel_event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cpanel_event }
    end
  end

  def edit
    @cpanel_event = Event.find(params[:id])
  end

  def create
    @cpanel_event = Event.new(params[:cpanel_event])

    respond_to do |format|
      if @cpanel_event.save
        format.html { redirect_to @cpanel_event, notice: 'Event was successfully created.' }
        format.json { render json: @cpanel_event, status: :created, location: @cpanel_event }
      else
        format.html { render action: "new" }
        format.json { render json: @cpanel_event.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @cpanel_event = Event.find(params[:id])

    respond_to do |format|
      if @cpanel_event.update_attributes(params[:cpanel_event])
        format.html { redirect_to @cpanel_event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cpanel_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cpanel_event = Event.find(params[:id])
    @cpanel_event.destroy

    respond_to do |format|
      format.html { redirect_to cpanel_events_url }
      format.json { head :no_content }
    end
  end
end

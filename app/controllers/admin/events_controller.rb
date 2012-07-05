class Admin::EventsController < ApplicationController
  # GET /admin/events
  # GET /admin/events.json
  def index
    @admin_events = Admin::Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_events }
    end
  end

  # GET /admin/events/1
  # GET /admin/events/1.json
  def show
    @admin_event = Admin::Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_event }
    end
  end

  # GET /admin/events/new
  # GET /admin/events/new.json
  def new
    @admin_event = Admin::Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_event }
    end
  end

  # GET /admin/events/1/edit
  def edit
    @admin_event = Admin::Event.find(params[:id])
  end

  # POST /admin/events
  # POST /admin/events.json
  def create
    @admin_event = Admin::Event.new(params[:admin_event])

    respond_to do |format|
      if @admin_event.save
        format.html { redirect_to @admin_event, notice: 'Event was successfully created.' }
        format.json { render json: @admin_event, status: :created, location: @admin_event }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/events/1
  # PUT /admin/events/1.json
  def update
    @admin_event = Admin::Event.find(params[:id])

    respond_to do |format|
      if @admin_event.update_attributes(params[:admin_event])
        format.html { redirect_to @admin_event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/events/1
  # DELETE /admin/events/1.json
  def destroy
    @admin_event = Admin::Event.find(params[:id])
    @admin_event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_url }
      format.json { head :no_content }
    end
  end
end

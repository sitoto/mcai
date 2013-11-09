class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def douban_group
    if params[:q].blank?
      return
    else
      search_url = params[:q]
    end
    topic_url = search_url
    from_c = "utf-8"
    to_c = "utf-8"
    regEx_douban_1 = /douban\.com\/group\/topic\/[0-9]*/
    if regEx_douban_1 =~ topic_url
      @topic_url = ("http://www." << regEx_douban_1.match(topic_url).to_s << "/")
    else
      @topic_url = topic_url
      return
    end

    @douban_group = DoubanGroup.new(@topic_url)
    @article = @douban_group.dehydrate_topic(@topic_url)
    if @article
      @article.update_attribute(:from_ip, remote_ip)
      @article.events.create(from_ip: remote_ip, name: @article.title, note: @article.from_url, status: "new")
    else
     @error = Event.last 
    end
  end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def preview
    @task = Task.find(params[:id])
    @result = SignelPage.new(@task).result
  end
end

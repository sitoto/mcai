#encoding: utf-8
require 'nokogiri'
require 'open-uri'
class Admin::TasksController < AdminController
  # GET /admin/tasks
  # GET /admin/tasks.json
  def index
    @admin_tasks = Admin::Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_tasks }
    end
  end
	
	def douban_group
    url = "http://www.douban.com/group/youzhaopin/discussion"
		#url =	"http://www.douban.com/group/Junko/discussion"	
		from_c = "utf-8"
		to_c = "utf-8"
		@douban_group = DoubanGroup.new
		@douban_group.init(url)
  	@content =  @douban_group.get_page_content
		@lists = @douban_group.get_all_topics
		@do_lists = @douban_group.do_or_not
		@douban_group.save_topics_html
#		@douban_group.

	
	end
  # GET /admin/tasks/1
  # GET /admin/tasks/1.json
  def show
    @admin_task = Admin::Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_task }
    end
  end

  # GET /admin/tasks/new
  # GET /admin/tasks/new.json
  def new
    @admin_task = Admin::Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_task }
    end
  end

  # GET /admin/tasks/1/edit
  def edit
    @admin_task = Admin::Task.find(params[:id])
  end

  # POST /admin/tasks
  # POST /admin/tasks.json
  def create
    @admin_task = Admin::Task.new(params[:admin_task])

    respond_to do |format|
      if @admin_task.save
        format.html { redirect_to @admin_task, notice: 'Task was successfully created.' }
        format.json { render json: @admin_task, status: :created, location: @admin_task }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/tasks/1
  # PUT /admin/tasks/1.json
  def update
    @admin_task = Admin::Task.find(params[:id])

    respond_to do |format|
      if @admin_task.update_attributes(params[:admin_task])
        format.html { redirect_to @admin_task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tasks/1
  # DELETE /admin/tasks/1.json
  def destroy
    @admin_task = Admin::Task.find(params[:id])
    @admin_task.destroy

    respond_to do |format|
      format.html { redirect_to admin_tasks_url }
      format.json { head :no_content }
    end
  end
end

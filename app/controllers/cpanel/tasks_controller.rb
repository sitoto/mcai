#encoding: utf-8
require 'nokogiri'
require 'open-uri'
class Cpanel::TasksController < Cpanel::ApplicationController
  def index
    @cpanel_tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cpanel_tasks }
    end
  end

  def douban_group
    if params[:q].blank?
      return
    else
      @search_url = params[:q]
    end
    topic_url = @search_url
    from_c = "utf-8"
    to_c = "utf-8"

    @douban_group = DoubanGroup.new(topic_url)
    @article = @douban_group.dehydrate_topic(topic_url)
    @article.update_attribute(:from_ip, remote_ip)
    @article.events.create(from_ip: remote_ip, name: @article.title)


  end
  def douban_list
    url = "http://www.douban.com/group/youzhaopin/discussion"
    @douban_group = DoubanGroup.new(url)
    @content =  @douban_group.get_page_content
    @lists = @douban_group.get_all_topics
    @do_lists = @douban_group.do_or_not
 
  end

  def show
    @cpanel_task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cpanel_task }
    end
  end

  def new
    @cpanel_task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cpanel_task }
    end
  end

  def edit
    @cpanel_task = Task.find(params[:id])
  end

  def create
    @cpanel_task = Task.new(params[:cpanel_task])

    respond_to do |format|
      if @cpanel_task.save
        format.html { redirect_to @cpanel_task, notice: 'Task was successfully created.' }
        format.json { render json: @cpanel_task, status: :created, location: @cpanel_task }
      else
        format.html { render action: "new" }
        format.json { render json: @cpanel_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cpanel_task = Task.find(params[:id])

    respond_to do |format|
      if @cpanel_task.update_attributes(params[:cpanel_task])
        format.html { redirect_to @cpanel_task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cpanel_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cpanel_task = Task.find(params[:id])
    @cpanel_task.destroy

    respond_to do |format|
      format.html { redirect_to cpanel_tasks_url }
      format.json { head :no_content }
    end
  end
end

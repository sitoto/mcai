#encoding: UTF-8 
module ApplicationHelper 
  def default_meta_tags 
		{
			:title       => '只看楼主,直播小说,脱水吧',
			:description => '论坛脱水工具, 阅读热贴好工具。',
			:keywords    => '论坛脱水工具, 贴吧脱水 , 脱水版, 脱水工具, 脱水小说, 只看楼主, 天涯易读, 豆瓣小组, 猫扑脱水, 天涯脱水,搜狐社区脱水,凯迪社区',
			:separator   => "&mdash;".html_safe,
		}
	end

  MOBILE_USER_AGENTS =  'palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
                        'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
                        'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
                        'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
                        'webos|amoi|novarra|cdm|alcatel|pocket|iphone|mobileexplorer|mobile'
  def mobile?
    agent_str = request.user_agent.to_s.downcase
    return false if agent_str =~ /ipad/
    agent_str =~ Regexp.new(MOBILE_USER_AGENTS)
  end
  def render_page_title
    title = @page_title ? "#{@page_title} | 只看楼主,社区直播小说" : "只看楼主,社区直播小说" rescue "脱水吧"
    content_tag("title", title, nil, false)
  end

  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
  end

  def stylesheet(*args)
    content_for(:styles) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:styles) { javascript_include_tag(*args) }
  end
	
	def format_text(text, options ={})
	  sanitize markdown(link_mentions(text.to_s, options[:mention_names]))
	end
  @@html_render  = Redcarpet::Render::HTML.new :hard_wrap => true, :no_styles => true
  @@markdown     = Redcarpet::Markdown.new @@html_render, :autolink => true, :no_intra_emphasis => true
  def markdown(text)
    @@markdown.render(text)
  end

  def link_mentions(text, mention_names)
    if mention_names && mention_names.any?
      text.gsub(/@(#{mention_names.join('|')})(?![.\w])/) do
        username = $1
        %Q[@<a href="/~#{username}">#{username}</a>]
      end
    else
      text
    end
  end

  def notice_message
    flash_messages = []

    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close", 'data-dismiss' => "alert") + message, :class => "alert alert-#{type}")
      flash_messages << text if message
    end

    flash_messages.join("\n").html_safe
  end

  def baidu_analytics(always = false)
    %Q{<script type="text/javascript">
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F48d7fc41f505853420d1a656661892cc' type='text/javascript'%3E%3C/script%3E"));
    </script>}.html_safe if (always || Rails.env.to_sym == :production)

  end

  def google_analytics account = GOOGLE_ANALYTICS_KEY, always = false
    # This helper should be called at end of the <head> tag
    "<script>var _gaq=_gaq || [];_gaq.push(['_setAccount','#{account}']);_gaq.push(['_trackPageview']);(function(){var ga=document.createElement('script');ga.async=true;ga.src=('https:'==document.location.protocol?'https://ssl':'http://www')+'.google-analytics.com/ga.js';(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);})();</script>".html_safe if (always || Rails.env.to_sym == :production)
  end
end

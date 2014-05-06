class BaiduTiebaJob < Struct.new(:article_id, :current_url, :i, :category, :lz, :title)
  def perform
    puts "* "*50
    @article = Article.find(article_id)
    puts  i 
    puts @article.author
    posts2, all_words_count = BaiduTiebaPage.new(current_url , @article.author).get_author_content(current_url)
    topic2 = Topic.new(title: title, tags: [category, lz], author: lz, words_count: all_words_count,
                       url: current_url,   page_num: i , posts_count: posts2.length, posts: posts2)
    topic2.save

    @article.inc(posts_count: posts2.length, words_count: all_words_count)
    @article.topics.push(topic2)
    @article.save

  end

end

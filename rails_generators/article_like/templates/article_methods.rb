module ArticleMethods
  def article_show
    @article = Article.find_or_create_by_alias_and_locale params[:alias], I18n.locale.to_s
    #@article ||= Article.create(:alias => params[:alias],
    #                            :title=> I18n.t(params[:alias]),
    #                            :locale => I18n.locale.to_s )
    view = params[:default_view]? "show" : params[:alias]
    render :template => "articles/#{view}"
  end
end
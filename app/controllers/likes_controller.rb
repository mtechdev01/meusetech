class LikesController < ApplicationController

  def like
    @like = Like.new do | record |
        record.user =  current_user
        if params[:model] == 'project'
            record.project =  Project.find( params[:id] )
        elsif params[:model] == 'article'
            record.blog_article = BlogArticle.find( params[:id] )
        end
    end
    if !liked? @like # si ce n'est pas déjà aimé par ce user
      @like.save! # je sauvegarde dans la table likes
    end
    render json: @like

  end

private

  def liked? newlike # Je regarde si le like que je créé est déjà existant ou non
    @liked = Like.where( { user_id: newlike.user_id, blog_article_id: newlike.blog_article_id, project_id: newlike.project_id  } ).last
    if @liked != nil # si le like existe déjà, je retourne VRAI et le like ne sera pas sauvegardé et je supprime le like actuel
      @liked.destroy!
      return true
    else
      return false # ce n'est pas déjà aimé, donc je retourne FAUX pour que le like soit sauvegardé
    end
  end

end

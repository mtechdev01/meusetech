module Meusetech

  module Commentable

    def self.saveComment? params
      @comment = Comment.new params
      if !self.isFirstComment? @comment
        @comment.is_valid = true
      end
      if @comment.save
        return true
      end
      return false
    end

    def self.setValid id
      @comment = Comment.find id
      @comment.is_valid = true
      if @comment.save
        Comment.where({ user_id: @comment.user_id, is_valid: false }).find_each do | comment |
          comment.is_valid = true
          comment.save
        end
        return true
      end
      return false
    end

    private

    def self.isFirstComment? params
      @comments = Comment.where( { user_id: params.user_id, is_valid: true } ).first
      if @comments
        return false
      end
      return true
    end

  end #module Commentable

end

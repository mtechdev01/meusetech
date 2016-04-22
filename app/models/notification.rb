class Notification < ActiveRecord::Base

  belongs_to :comment, -> { where model: 'Comment' }, class_name: "Comment", foreign_key: "key"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver"
  belongs_to :sender, class_name: "User", foreign_key: "sender"

  def getRelationData
    @data = eval(self.model).find( self.key )
    
    if ( self.model == "BlogArticle" )
      return @data.title
    elsif ( self.model == "Project")
      return @data.name
    end
  end

end

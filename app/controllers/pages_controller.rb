class PagesController < ApplicationController
  
  def home
    @projects = Project.mostActive
  end

end

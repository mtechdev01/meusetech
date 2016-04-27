module Meusetech
  class Facebookpublisher

    def oauth_page_token
      @page_token = "CAACEdEose0cBAHwZCuOo4LZAZC96MpHYVbZAZCTq6QYejfL8YprAZBqy1vjt0ZCUUc3HjfSwgKTgSEc8NPH1YoMTBjCJ2U8zWPWv76gtM7NSatxsZAmgsErgKrgjtKttYerUK06iGpVQlywV1uJMNCjwABPLltdB6FDp20p1kgYuYKqXLjwz9ZCcpLZBEjXGLfOi7QwBqCxgA33QZDZD"
    end

    def page_id
      self.page_id = "1162349303777261"
    end

    def test
      redirect_to @oauth.url_for_oauth_code

    end

    def me
      self.graph.get_object("me")
    end
    def publish( data )
      @page_graph.put_connections( @page_id, 'feed',  :message => data[:message],
                                            :name => data[:title],
                                            :description => data[:title],
                                            :picture => "http://local.dev:3000/#{data[:picture]}",
                                            :link => data[:link] )
    end

    def getWall
      @graph.get_connection('me', 'feed')
    end

  end

end

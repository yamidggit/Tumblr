class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy] 
    
    def index
        @pots=Post.all.order('created_at DESC')
    end
   
    def new
        @post=Post.new  
    end
    
    def create
        @post= Post.new(post_params)
        if @post.save
            redirect_to @post
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
            render "new" # it uses render instead of redirect because render doesn't make a http request
                        # if we make an http and the content haven't been save it will delete everything
        end
    end
    def show
       
    end
    def edit
         
    end
    
    def update
        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def destroy
        @post.destroy
        redirect_to root_path
    end

    private
    
    def post_params
       params.require(:post).permit(:title,:content) 
    end
    
    def find_post
       @post=Post.find(params[:id]) 
    end

end

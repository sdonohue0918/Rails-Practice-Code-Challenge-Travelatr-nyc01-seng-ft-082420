class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.create(blog_params)
        if @blogger.valid?
            redirect_to blogger_path(@blogger)
        else
           flash[:errors] = @blogger.errors.full_messages
        end
    end

    private

    def blog_params
        params.require(:blogger).permit(:name, :age, :bio)
    
    end

end

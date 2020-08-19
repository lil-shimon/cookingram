class BookmarksController < ApplicationController

      def create
        @bookmark = current_user.bookmarks.create(recipe_id: params[:recipe_id])
        redirect_back(fallback_location: root_path)
      end
      
      def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @bookmark = current_user.bookmarks.find_by(recipe_id: @recipe.id)
        @bookmark.destroy
        redirect_back(fallback_location: root_path)
      end
      
end

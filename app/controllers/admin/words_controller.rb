# frozen_string_literal: true

module Admin
  class WordsController < AdminController
    def index
      @words = Word.where(category_id: params[:category_id])
    end

    def new
      category = Category.find(params[:category_id])
      @word = category.words.build
      3.times do
        @word.choices.build
      end
    end

    def create
      category = Category.find(params[:category_id])
      @word = category.words.build(word_params)
      if @word.save
        redirect_to admin_category_words_url
      else
        render 'new'
      end
    end

    def show
      @word = Word.find(params[:id])
    end

    def edit
      @word = Word.find(params[:id])
    end

    def update
      @word = Word.find(params[:id])
      if @word.update_attributes(word_params)
        redirect_to admin_category_words_url
      else
        render 'edit'
      end
    end

    def destroy
      @word = Word.find(params[:id]).destroy
      redirect_to admin_category_words_url
    end

    private

    def word_params
      params.require(:word).permit(:content, choices_attributes: %i[id content correct])
    end
  end
end

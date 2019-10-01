# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @most_viewed_documents = Document.all.order("view_count DESC")
  end

  def help
  end

  def about
  end
end

# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :check_if_logged_in

  def home
    @most_viewed_documents = Document.all.order("view_count DESC").limit(6)
    @latest_documents = Document.all.order("created_at DESC").limit(6)
  end

  def help
  end

  def about
  end
end

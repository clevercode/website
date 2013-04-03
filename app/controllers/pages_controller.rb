class PagesController < ApplicationController

  def home
  end

  def work
  end

  def contact
  end

  def email
    CleverContact.contact_email(params).deliver
    respond_to do |format|
      format.json { render json: { params: params }, status: :ok }
    end
  end
end

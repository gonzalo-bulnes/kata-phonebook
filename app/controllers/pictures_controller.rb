class PicturesController < ApplicationController
  def edit
    @picture = Contact.find(params[:contact_id]).picture
  end
end

class Public::HomesController < ApplicationController
  before_action :authenticate_user!,only:[:top]
  def top
  end
end

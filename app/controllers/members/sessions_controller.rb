class Members::SessionsController < Devise::SessionsController

  def new
    super do |resouce|
      resouce.build_profile_member
    end
  end
end

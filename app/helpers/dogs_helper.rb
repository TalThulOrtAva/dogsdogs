module DogsHelper
  def allow_edit?(dog, current_user)
    current_user.present? && !dog.user.nil? && dog.user.id == current_user.id
  end
end

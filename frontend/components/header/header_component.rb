# frozen_string_literal: true

module HeaderComponent
  extend ComponentHelper

  def links
    items = []
    if current_user.present?
      items << {name: 'My workspace', href: after_sign_in_path(current_user)}
      items << {name: 'Logout', href: destroy_user_session_path, options: {method: :delete}}
    else
      items << {name: 'Sign in', href: new_user_session_path}
      items << {name: 'Register', href: new_user_registration_path}
    end
    items
  end
end

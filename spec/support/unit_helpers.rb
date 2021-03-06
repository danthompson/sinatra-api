module UnitHelpers
  # Mail Helpers
  def last_email
    Mail::TestMailer.deliveries.last
  end

  def clear_email
    Mail::TestMailer.deliveries.clear
  end

  def get_jwt(payload)
    jwt_token = JWT.encode(payload, ENV['JWT_SECRET_KEY'], "HS512")
  end

  # Trying things
  #
  # it { must :respond_to, :name }
  #
  # def must(matcher, *args)
  #   subject.send("must_#{matcher.to_s}".to_sym, *args)
  # end
end

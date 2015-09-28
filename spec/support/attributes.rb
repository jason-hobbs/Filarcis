  def user_attributes(overrides = {})
    {
      id: 1,
      name: "William Wallace",
      email: "william.wallace@scotland.com",
      password: "Testing1"
    }.merge(overrides)
  end

  def project_attributes(overrides = {})
    {
      name: "inbox-system",
      user_id: 1
    }.merge(overrides)
  end

Configus.build Rails.env do
  env :production do
    owner do
      login "admin"
      password "admin_pass"
    end
  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
  end
end
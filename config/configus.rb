Configus.build Rails.env do
  env :production do
  end

  env :development, parent: :production do
    basic_auth do
      name "dhh"
      password "secret"
    end
  end

  env :test, parent: :production do
    basic_auth do
      name "dhh"
      password "secret"
    end
  end
end
Configus.build Rails.env do
  env :production do
    host 'example.com'
    mailer do
      from "noreply@example.com"
    end
    owner do
      username "admin"
    end
  end

  env :development, parent: :production do
  end

  env :test, parent: :production do
  end
end

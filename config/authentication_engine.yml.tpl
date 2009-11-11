shared: &shared
  registration:
    # account signed up by admin and confirmed by users themself
    limited: true
    # account invitation sent by registered user, and account signed up and confirmed by invited user
    private: true
    # account invitation requested by users and sent by admin, and account signed up and confirmed by users themself
    requested: true
    # account signed up and confirmed by users themself
    public: false
  signup:
    # users need to login themself after signed up
    prompt: false
  activation:
    # users need to login themself after activated
    prompt: false
  admin:
    name: "Jason L Perry"
    email: "jasper@ambethia.com"
  notifier:
    host: "lucien.ambethia.com"
    name: "Lucien"
    email: "noreply@ambethia.com"
  default_content_type: text/html # "text/plain" "text/html" "text/enriched"
  delivery_method: :smtp # :sendmail :stmp
  smtp_settings:
    address: localhost
    port: 25
    domain: ambethia.com
    authentication: :login
    user_name: noreply@ambethia.com
    password: 
    enable_starttls_auto: true

development:
  <<: *shared

test:
  <<: *shared

cucumber:
  <<: *shared

staging:
  <<: *shared

production:
  <<: *shared

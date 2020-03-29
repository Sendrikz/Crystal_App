require "kemal"
require "kemal-session"

Kemal::Session.config.cookie_name = "session_id"
Kemal::Session.config.secret = "some_secret"
Kemal::Session.config.gc_interval = 30.minutes

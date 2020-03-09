require "./config/initializers/database"
require "./db/migrations/*"
require "./src/models/*"
require "sam"

load_dependencies "jennifer"

Sam.help

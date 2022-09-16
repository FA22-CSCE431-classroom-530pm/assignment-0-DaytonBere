#!/bin/bash

bundle install
rails db:create
rails db:migrate
rails server --binding=0.0.0.0
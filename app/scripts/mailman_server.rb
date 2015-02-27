#!/usr/bin/env ruby
require "rubygems"
require "pg"
require "bundler/setup"
require "mailman"


Mailman::Application.run do
  default do
    conn = PG.connect(
        :dbname => 'filarcis_rails_development',
        :user => 'root',
        :password => 'naginata')
    time = Time.now.utc
    conn.prepare("insert_entry", "insert into notes (title, content, project_id, created_at, updated_at) values ($1, $2, $3, $4, $5)")
    name = message.to.to_s.split("[\"")
    name2 = name[1].split("@")
    conn.exec( "select Projects.id from projects inner join users on Projects.user_id = Users.id where Projects.name = 'inbox-system' and Users.name = '#{name2[0]}'" ) do |result|
      result.each do |user|
        conn.exec_prepared("insert_entry", [message.subject, message.body.decoded, user["id"], time, time])
      end
    end
  end
end

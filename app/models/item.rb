class Item < ActiveRecord::Base

#       Column    |            Type             |                     Modifiers
# --------------+-----------------------------+----------------------------------------------------
#  id           | integer                     | not null default nextval('todos_id_seq'::regclass)
#  from         | character varying           |
#  message_body | text                        |
#  completed_at | timestamp without time zone |
#  created_at   | timestamp without time zone | not null
#  updated_at   | timestamp without time zone | not null
end

DO $$ 
DECLARE
  first_user_id INTEGER;
BEGIN

CREATE SCHEMA IF NOT EXISTS checklist;

CREATE TABLE IF NOT EXISTS checklist.user (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS checklist.item (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  notes TEXT,
  quantity INTEGER,
  category TEXT,
  completed BOOLEAN NOT NULL DEFAULT false,
  active BOOLEAN NOT NULL DEFAULT true,
  user_id INTEGER NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES checklist.user (id),
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO checklist.user (username)
VALUES ('testuser');

SELECT id INTO first_user_id FROM checklist.user ORDER BY id LIMIT 1;

INSERT INTO checklist.item (name, notes, quantity, category, completed, user_id)
VALUES 
  ('Tofu', 'Extra Firm', null, 'Deli', false, first_user_id),
  ('Tomato', null, 2, 'Produce', false, first_user_id),
  ('Eggs', '"we''re rich, bish!!', null, 'Dairy', false, first_user_id),
  ('Beer', null, null, 'Beverage', true, first_user_id),
  ('Bread', 'Sourdough', null, 'Bakery', false, first_user_id),
  ('Milk', null, null, 'Dairy', false, first_user_id),
  ('Chips', 'Don''t get the healthy kind, they taste like cardboard', null, 'Snacks', true, first_user_id);

END $$;

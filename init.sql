DO $$ 
DECLARE
  user_id BIGINT;
  list_id BIGINT;
BEGIN

CREATE SCHEMA IF NOT EXISTS checklist;

CREATE TABLE IF NOT EXISTS checklist.user (
  id BIGSERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS checklist.list (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  notes TEXT,
  active BOOLEAN NOT NULL DEFAULT true,
  user_id BIGINT NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES checklist.user (id),
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS checklist.item (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  notes TEXT,
  quantity INTEGER,
  category TEXT,
  completed BOOLEAN NOT NULL DEFAULT false,
  active BOOLEAN NOT NULL DEFAULT true,
  list_id BIGINT NOT NULL,
  CONSTRAINT fk_list FOREIGN KEY (list_id) REFERENCES checklist.list (id),
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO checklist.user (username)
VALUES ('testuser');

SELECT id INTO user_id FROM checklist.user ORDER BY id LIMIT 1;

INSERT INTO checklist.list (name, notes, user_id)
VALUES 
  ('Groceries', 'gotta shop ''em all', user_id);

SELECT id INTO list_id FROM checklist.list ORDER BY id LIMIT 1;

INSERT INTO checklist.item (name, notes, quantity, category, completed, list_id)
VALUES 
  ('Tofu', 'Extra Firm', null, 'Deli', false, list_id),
  ('Tomato', null, 2, 'Produce', false, list_id),
  ('Eggs', 'we''re rich, bish!!', null, 'Dairy', false, list_id),
  ('Beer', null, null, 'Beverage', true, list_id),
  ('Bread', 'Sourdough', null, 'Bakery', false, list_id),
  ('Milk', null, null, 'Dairy', false, list_id),
  ('Chips', 'Don''t get the healthy kind, they taste like cardboard', null, 'Snacks', true, list_id);

END $$;

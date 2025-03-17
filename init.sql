CREATE SCHEMA IF NOT EXISTS checklist;

CREATE TABLE IF NOT EXISTS checklist.item (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  notes TEXT,
  quantity INTEGER,
  category TEXT,
  completed BOOLEAN NOT NULL DEFAULT false,
  active BOOLEAN NOT NULL DEFAULT true,
  created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  modified_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO checklist.item (name, notes, quantity, category, completed)
VALUES 
  ('Tofu', 'Extra Firm', null, 'Deli', false),
  ('Tomato', null, 2, 'Produce', false),
  ('Eggs', '"we''re rich, bish!!', null, 'Dairy', false),
  ('Beer', null, null, 'Beverage', true),
  ('Bread', 'Sourdough', null, 'Bakery', false),
  ('Milk', null, null, 'Dairy', false),
  ('Chips', 'Don''t get the healthy kind, they taste like cardboard', null, 'Snacks', true);

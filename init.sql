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
  ('Bread', 'Sourdough', null, 'Bakery', false),
  ('Beer', null, null, 'Beverage', true);

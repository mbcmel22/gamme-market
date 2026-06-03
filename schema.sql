-- =====================================================================
--  GAMME MARKET — Base de données Supabase
--  À coller dans Supabase → SQL Editor → New query → Run
-- =====================================================================

-- 1) Table des produits ------------------------------------------------
create table if not exists products (
  id          bigint generated always as identity primary key,
  name        text    not null,
  category    text    not null,
  emoji       text,
  color       text,
  price       numeric(6,2) not null default 0,
  unit        text,
  qty         integer not null default 0,
  sort_order  integer default 0,
  visible     boolean default true,
  created_at  timestamptz default now()
);

-- 2) Sécurité (Row Level Security) ------------------------------------
--    Lecture : ouverte à tous (site public).
--    Écriture : réservée aux utilisateurs connectés (le gérant).
alter table products enable row level security;

drop policy if exists "Lecture publique" on products;
create policy "Lecture publique"
  on products for select
  using (true);

drop policy if exists "Ecriture gerant" on products;
create policy "Ecriture gerant"
  on products for update
  to authenticated
  using (true) with check (true);

-- (Optionnel) autoriser le gérant à ajouter / supprimer des produits :
drop policy if exists "Ajout gerant" on products;
create policy "Ajout gerant"
  on products for insert
  to authenticated
  with check (true);

drop policy if exists "Suppression gerant" on products;
create policy "Suppression gerant"
  on products for delete
  to authenticated
  using (true);

-- 3) Données de démonstration -----------------------------------------
insert into products (name, category, emoji, color, price, unit, qty, sort_order) values
('Riz parfumé 5 kg',                 'Féculents','🍚','#FBEFD3',12.90,'Sac de 5 kg',24,1),
('Attiéké (semoule de manioc)',      'Féculents','🥣','#FBEFD3', 3.50,'500 g',      8,2),
('Foufou banane plantain',           'Féculents','🍌','#FBEFD3', 4.20,'1 kg',       3,3),
('Gari blanc',                       'Féculents','🌾','#FBEFD3', 2.80,'1 kg',      15,4),
('Fonio précuit',                    'Féculents','🌾','#FBEFD3', 4.90,'500 g',      0,5),
('Cubes d''assaisonnement',          'Épices',  '🧂','#F6E0DA', 5.50,'Boîte de 60',30,6),
('Poivre de Penja',                  'Épices',  '🌶️','#F6E0DA', 6.90,'100 g',      6,7),
('Huile de palme rouge',             'Épices',  '🫗','#F6E0DA', 7.40,'1 L',       12,8),
('Soumbala (néré)',                  'Épices',  '🫘','#F6E0DA', 4.10,'200 g',      4,9),
('Piment fort en poudre',            'Épices',  '🌶️','#F6E0DA', 2.90,'100 g',     18,10),
('Tilapia entier',                   'Surgelés','🐟','#DDEAF2', 8.90,'À la pièce',20,11),
('Feuilles de manioc (saka-saka)',   'Surgelés','🥬','#DDEAF2', 3.90,'500 g',      9,12),
('Gombo coupé surgelé',              'Surgelés','🫛','#DDEAF2', 5.20,'1 kg',       2,13),
('Viande de chèvre',                 'Surgelés','🥩','#DDEAF2',14.90,'1 kg',       7,14),
('Banane plantain',                  'Frais',   '🍌','#E2F1E6', 2.50,'Le kg',     40,15),
('Igname',                           'Frais',   '🍠','#E2F1E6', 3.80,'Le kg',     25,16),
('Manioc frais',                     'Frais',   '🥔','#E2F1E6', 2.20,'Le kg',      0,17),
('Gombo frais',                      'Frais',   '🫛','#E2F1E6', 3.00,'Barquette', 11,18),
('Bissap (hibiscus)',                'Boissons','🧃','#F6E0DA', 3.50,'1 L',       16,19),
('Boisson gingembre maison',         'Boissons','🫚','#F6E0DA', 4.00,'1 L',        5,20),
('Malta (pack de 6)',                'Boissons','🍺','#F6E0DA', 7.90,'6 × 33 cl', 14,21),
('Jus de tamarin',                   'Boissons','🧃','#F6E0DA', 3.80,'1 L',        9,22),
('Chin chin',                        'Snacks',  '🍪','#FBEFD3', 3.20,'250 g',     22,23),
('Chips de plantain',                'Snacks',  '🍟','#FBEFD3', 2.40,'150 g',     13,24),
('Arachides grillées',               'Snacks',  '🥜','#FBEFD3', 4.50,'500 g',      0,25),
('Beurre de karité pur',             'Beauté',  '🧴','#E2F1E6', 6.50,'250 g',     17,26),
('Savon noir africain',              'Beauté',  '🧼','#E2F1E6', 4.20,'200 g',     10,27),
('Huile de coco',                    'Beauté',  '🥥','#E2F1E6', 5.80,'250 ml',     3,28);

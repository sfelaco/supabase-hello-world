create table user_roles (
  user_id uuid references auth.users(id) on delete cascade,
  role    text not null,
  primary key (user_id)
);

alter table user_roles enable row level security;

-- Authenticated users can read their own role (needed for RLS subqueries on other tables)
create policy "Users can read own role"
  on user_roles
  for select
  to authenticated
  using ((select auth.uid()) = user_id);

-- Assign initial roles
insert into user_roles (user_id, role) values
  ('7b977833-1bbc-444d-af82-e8dfc209cbbc', 'admin');   -- Santolo Felaco

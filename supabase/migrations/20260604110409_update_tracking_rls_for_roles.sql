drop policy "Allow inserts for authenticated users" on tracking;

-- Only users with role 'admin' can insert into tracking
create policy "Allow inserts for admin users"
  on tracking
  for insert
  to authenticated
  with check (
    exists (
      select 1 from user_roles
      where user_id = (select auth.uid())
        and role = 'admin'
    )
  );

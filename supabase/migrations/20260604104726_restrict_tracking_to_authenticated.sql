drop policy "Allow inserts" on tracking;

create policy "Allow inserts for authenticated users"
  on tracking
  for insert
  to authenticated
  with check (true);

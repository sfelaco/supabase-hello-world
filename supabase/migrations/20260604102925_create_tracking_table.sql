create table tracking (
  id bigserial primary key,
  date timestamptz not null default now(),
  message varchar(256)
);

alter table tracking enable row level security;

create policy "Allow inserts"
  on tracking
  for insert
  to anon, authenticated
  with check (true);

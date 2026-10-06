-- Jalankan sekali di Supabase: SQL Editor -> New query -> paste -> Run
create table if not exists public.budgets (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.budgets enable row level security;

-- Tiap akun hanya boleh membaca dan menulis barisnya sendiri
create policy "budgets_select_own" on public.budgets
  for select to authenticated using (auth.uid() = user_id);
create policy "budgets_insert_own" on public.budgets
  for insert to authenticated with check (auth.uid() = user_id);
create policy "budgets_update_own" on public.budgets
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "budgets_delete_own" on public.budgets
  for delete to authenticated using (auth.uid() = user_id);

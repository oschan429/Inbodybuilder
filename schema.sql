-- Inbodybuilder: Supabase → SQL Editor → New query 에 통째로 붙여넣고 Run.

create table if not exists public.players (
  id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.players enable row level security;

-- 로그인한 사람만 테이블에 접근할 수 있어요 (로그인 안 한 방문자는 막음).
grant select, insert, update, delete on public.players to authenticated;
revoke all on public.players from anon;

-- 로그인한 사람은 모두의 레이스 기록을 볼 수 있어요.
drop policy if exists "players read" on public.players;
create policy "players read" on public.players
  for select to authenticated using (true);

-- 각자 자기 기록만 만들고, 고치고, 지울 수 있어요.
drop policy if exists "players insert own" on public.players;
create policy "players insert own" on public.players
  for insert to authenticated with check (auth.uid() = id);

drop policy if exists "players update own" on public.players;
create policy "players update own" on public.players
  for update to authenticated using (auth.uid() = id) with check (auth.uid() = id);

drop policy if exists "players delete own" on public.players;
create policy "players delete own" on public.players
  for delete to authenticated using (auth.uid() = id);

-- 친구가 퀘스트를 체크하면 다른 사람 화면에도 바로 반영되게 해요.
do $$
begin
  alter publication supabase_realtime add table public.players;
exception when duplicate_object then null;
end $$;

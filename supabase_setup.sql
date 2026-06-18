-- OpsTracker — Supabase setup
-- Run this in your Supabase SQL editor (supabase.com → project → SQL Editor)

-- 1. Create the state table
CREATE TABLE IF NOT EXISTS public.opstracker_state (
  id          INT PRIMARY KEY DEFAULT 1,
  payload     TEXT NOT NULL DEFAULT '{}',
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 2. Seed an empty row so the first upsert works cleanly
INSERT INTO public.opstracker_state (id, payload)
VALUES (1, '{}')
ON CONFLICT (id) DO NOTHING;

-- 3. Enable Row Level Security
ALTER TABLE public.opstracker_state ENABLE ROW LEVEL SECURITY;

-- 4. Allow anyone with the anon key to read and write
--    (This is a single-user/team app — no auth required)
CREATE POLICY "allow_all_anon" ON public.opstracker_state
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- 5. Enable Realtime so changes sync live across devices
ALTER PUBLICATION supabase_realtime ADD TABLE public.opstracker_state;

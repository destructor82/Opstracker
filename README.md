# OpsTracker

A liquid glass morphism ops tracker with real-time Supabase sync, light/dark themes, Excel import/export, and 7 configurable sections.

**Live demo:** `https://YOUR-USERNAME.github.io/opstracker`

---

## Features

- 7 sections — Notes, IT Calls, ANPR Calls, PIQ Calls, VIQ Calls, CIQ Calls, Appointments
- Priority levels (High / Medium / Low) with full light & dark theme support
- Completed items move to a collapsible sub-section
- Date picker and notes per item
- Real-time sync across devices via Supabase
- Export to `.xlsx` / Import from `.xlsx`
- Light & dark liquid glass morphism theme
- Mobile-friendly responsive layout
- Keyboard shortcuts: `Ctrl/Cmd+S` to save, `Esc` to close modals

---

## Setup — Step by step

### Step 1 — Create a Supabase project (free)

1. Go to [supabase.com](https://supabase.com) and sign up / log in
2. Click **New project**, give it a name (e.g. `opstracker`), choose a region, set a database password
3. Wait ~2 minutes for the project to provision

### Step 2 — Run the SQL setup

1. In your Supabase project, go to **SQL Editor** (left sidebar)
2. Click **New query**
3. Copy and paste the entire contents of `supabase_setup.sql` into the editor
4. Click **Run** — you should see "Success"

### Step 3 — Get your credentials

1. In Supabase, go to **Project Settings → API**
2. Copy:
   - **Project URL** — looks like `https://xxxxxxxxxxxx.supabase.co`
   - **anon / public key** — the long `eyJ...` token

### Step 4 — Publish to GitHub Pages

1. Go to [github.com](https://github.com) → click **+** → **New repository**
2. Name it `opstracker`, set it to **Public**, click **Create repository**
3. Upload these files to the repo:
   - `index.html` (rename `OpsTracker.html` → `index.html`)
   - `supabase_setup.sql`
   - `README.md`
4. Go to **Settings → Pages**
5. Under **Source**, select **Deploy from a branch**
6. Select branch `main`, folder `/ (root)`, click **Save**
7. After ~60 seconds your app is live at `https://YOUR-USERNAME.github.io/opstracker`

### Step 5 — Connect the database in the app

1. Open your live app (or `OpsTracker.html` locally)
2. Click **⚙️ DB** in the toolbar
3. Paste your Supabase **Project URL** and **anon key**
4. Click **Connect**
5. Data now syncs in real-time across any device that opens the same URL with the same credentials

---

## Credentials storage

Supabase credentials are stored **only in your browser's localStorage** — they are never sent anywhere except directly to your own Supabase project.

---

## Local-only usage

If you skip Supabase, the app works fully offline using localStorage. Data will not sync between devices in this mode.

---

## Excel format

When importing, column headers must be exactly: `Title`, `Notes`, `Date`, `Priority`, `Completed`.  
Priority values: `high`, `medium`, `low`. Completed values: `Yes` / `No`.

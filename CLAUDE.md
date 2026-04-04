# landing-page

Simple static landing page for romaine.life (apex domain). Lists all apps with links and GitHub repo icons.

Infrastructure (SWA, DNS, custom domain) lives in infra-bootstrap, not here. This repo only contains the frontend static files.

## Change Log

### 2026-03-22

- Added plant-agent (plants.romaine.life), bender-world (bender.romaine.life), and eight-queens (queens.romaine.life) to the app list — landing page now shows all apps from infra-bootstrap
- Renamed "Workout App" to "Workout Tracker" to match kill-me's actual description

### 2026-03-23

- Removed Spacelift from both CI workflows (Spacelift was removed from infra-bootstrap months ago). Merged `trigger-infra.yml` and `full-stack-deploy.yml` into a single workflow that deploys directly to Azure SWA on push to `frontend/**` or manual dispatch

### 2026-04-02

- Added fzt-showcase (fzh.romaine.life) to the app list — interactive web demo of fzh fuzzy finder running Go scoring via WASM

# 7028 Binary Battalion — Team Handbook

[![Build Handbook](https://github.com/YOUR_ORG/7028-handbook/actions/workflows/handbook-build.yml/badge.svg)](https://github.com/YOUR_ORG/7028-handbook/actions)

This repo contains the source files and build pipeline for the official FRC Team 7028 Binary Battalion team handbook. The handbook is written in Markdown, styled with a LaTeX template, and automatically compiled into a PDF when changes are merged.


## Download the handbook

The latest published PDF is always at the root of this repo: **[`handbook.pdf`](./handbook.pdf)**


## How the repo works

The handbook is built from Markdown files in `sections/`, one file per section. A build script feeds them through Pandoc and XeLaTeX using the template in `config/` to produce the final styled PDF.

GitHub Actions runs this build automatically:
- **On a pull request:** a preview PDF is generated and attached as a downloadable artifact so you can review it before merging.
- **On merge to `main`:** the final `handbook.pdf` is rebuilt and published to the github-latest release.


## Repo structure

```
sections/               One .md file per handbook section
assets/                 Images (robot photos, logos, divider graphics)
config/
  settings.yaml         Section order, edition number, build settings
  template.tex          LaTeX template (controls all styling)
fonts/                  Lora font files
build/
  build.sh              Build script
.github/workflows/
  handbook-build.yml    GitHub Actions workflow
handbook.pdf            Latest published handbook (auto-generated, never edit by hand)
CONTRIBUTING.md         Full guide on how to edit the handbook
```


## Edition workflow

The handbook is updated once per year. Each year follows this cycle:

1. A new branch is created for the upcoming edition (e.g., `edition-2027`)
2. Contributors make changes on their own branches and open PRs targeting the edition branch
3. A coach reviews and merges each PR
4. When the edition is finalized, the edition branch is merged into `main`, which triggers the final PDF build
5. A new edition branch is created for next year

Both `main` and `edition-*` branches are protected. No one can push directly — all changes must go through a pull request.


## Making changes

### 1. Clone the repo

```bash
git clone https://github.com/YOUR_ORG/7028-handbook.git
cd 7028-handbook
```

### 2. Check out the current edition branch

```bash
git checkout edition-2027
```

### 3. Create your own branch

Use the format `yourname/short-description`:

```bash
git checkout -b grace/add-2027-history
```

### 4. Make your edits

Edit files in `sections/`, add images to `assets/`, etc. See [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed instructions on every type of edit.

### 5. Commit and push

```bash
git add -A
git commit -m "Add 2027 competition history"
git push -u origin grace/add-2027-history
```

### 6. Open a pull request

Go to the repo on GitHub. It will show a banner offering to create a PR from your branch. Set the target branch to the current edition branch (e.g., `edition-2027`) and submit.

A preview PDF will be built automatically and attached to your PR as a downloadable artifact. Check it before requesting review.

### 7. Review and merge

A coach reviews the PR and merges it into the edition branch.


## What you can edit

| Task | What to change |
|---|---|
| Edit a section | Modify the `.md` file in `sections/` |
| Add a new section | Create a `.md` file in `sections/`, add it to the `sections:` list in `config/settings.yaml` |
| Reorder sections | Rearrange lines in the `sections:` list in `config/settings.yaml` |
| Remove a section | Delete its line from `config/settings.yaml` |
| Add a competition year | Add an entry at the top of `sections/17-history.md` |
| Add a glossary term | Add a line in `sections/19-glossary.md` (keep it alphabetically sorted) |
| Update the edition number | Change `sections/00-cover.md` and `config/settings.yaml` |
| Add an image | Place it in `assets/` and reference it in your section file |

See [CONTRIBUTING.md](./CONTRIBUTING.md) for templates and detailed instructions for each of these.


## Branch naming

When creating your branch, use the format `yourname/short-description`:

```
grace/add-2027-history
dylan/fix-glossary-typo
zack/update-policies
```

Keep PRs small and focused — one change per PR.


## Building locally

If you want to preview the PDF on your own machine before pushing:

```bash
# Ubuntu / Debian
sudo apt-get install texlive-xetex texlive-latex-extra texlive-fonts-extra python3-yaml
wget -q https://github.com/jgm/pandoc/releases/download/3.1.9/pandoc-3.1.9-1-amd64.deb
sudo dpkg -i pandoc-3.1.9-1-amd64.deb

# macOS
brew install pandoc
brew install --cask mactex
pip3 install pyyaml

# Windows
# 1. Install MiKTeX from https://miktex.org/download (includes xelatex)
# 2. Install Pandoc from https://github.com/jgm/pandoc/releases (download the .msi)
# 3. Install Python from https://python.org if not already installed
# 4. Run: pip install pyyaml
# 5. Use Git Bash (installed with Git for Windows) to run the build script
```

```bash
bash build/build.sh
```

The output PDF appears at the repo root as `handbook.pdf`.

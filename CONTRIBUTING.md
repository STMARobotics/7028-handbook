# Editing the 7028 Handbook

This guide covers everything you need to know to make changes to the team handbook.


## How the build works

When you push a commit to `main`, GitHub Actions automatically:

1. Builds a new `handbook.pdf`
2. Commits the updated PDF back to the repo

When you open a pull request, a preview PDF is attached as a downloadable artifact so you can review before merging.

Your workflow: **edit files → push a branch → open a PR → review the preview → merge → done.**


## Repo structure

```
sections/               Handbook content (one .md file per section)
assets/                 Images (robot photos, logos, divider graphics)
config/
  settings.yaml         Section order, edition info, build settings
  template.tex          LaTeX template (controls all styling)
fonts/                  Lora font files
build/
  build.sh              Build script
  handbook-build.yml    GitHub Actions workflow
handbook.pdf            Latest generated handbook (auto-updated, never edit by hand)
```


## Editing an existing section

Open the corresponding file in `sections/` and edit the markdown. Each section is a standalone `.md` file.

Section files use standard markdown:

```markdown
# Section Title          Blue, large heading (one per file)

## Subsection Title      Black, bold heading

### Sub-subsection       Black, bold italic (use sparingly)

Regular paragraph text. Separate paragraphs with a blank line.

**bold text**    *italic text*    ***bold italic***

- Bullet item one
- Bullet item two

1. Numbered item one
2. Numbered item two
```

### Callout boxes

The cream-colored boxes with dashed borders use raw LaTeX:

```
\begin{tcolorbox}[callout]
"Quoted text goes here, rendered in italic inside a cream box."

\hfill —Attribution
\end{tcolorbox}
```

### Tables

Standard markdown tables:

```markdown
| Column 1       | Column 2                          |
|----------------|-----------------------------------|
| Design         | Designs robots using CAD software |
| Manufacturing  | Creates custom metal parts        |
```

### Images

Place image files in `assets/` and reference them in markdown:

```markdown
![Description of image](assets/your-image.png)
```


## Adding a new section

1. Create a new `.md` file in `sections/`. Name it with a two-digit prefix to keep files sorted (e.g., `20-new-section.md`). The prefix is just for readability — actual build order is controlled by `settings.yaml`.

2. Start the file with a `#` heading:

```markdown
# Your New Section Title

Section content goes here.
```

3. Open `config/settings.yaml` and add your file to the `sections:` list at the position you want it to appear:

```yaml
sections:
  - sections/16-design-strategy.md
  - sections/20-new-section.md       # ← add it here
  - sections/part4-divider.md
```


## Reordering sections

Open `config/settings.yaml` and rearrange the entries in the `sections:` list. The handbook is built in exactly the order listed. Move lines up or down as needed.


## Removing a section

Delete the line from the `sections:` list in `config/settings.yaml`. You can optionally delete the `.md` file too, but an unlisted file won't be included in the build regardless.


## Adding a new competition year to history

All history entries live in `sections/17-history.md`. New years go at the **top** of the file (most recent first). Each year follows this exact template:

```latex
\clearpage

\yearheading{YEAR GAMENAME}

\noindent
\begin{minipage}[t]{0.54\linewidth}
\vspace{0pt}
\includegraphics[width=\linewidth]{assets/YEAR-robotname.jpg}\\[4pt]
\textit{Robot Name}
\end{minipage}\hfill
\begin{minipage}[t]{0.40\linewidth}
\vspace{0pt}
\textit{\textbf{Coaches}}\\[2pt]
\rule{\linewidth}{0.4pt}\\[6pt]
Coach Name One\\
Coach Name Two
\vspace{14pt}

\textit{\textbf{Captains}}\\[2pt]
\rule{\linewidth}{0.4pt}\\[6pt]
Captain Name One\\
Captain Name Two
\end{minipage}

\vspace{16pt}
```

Then add one competition table per event:

```latex
\noindent\textit{\textbf{Event Name \hfill Week N}}
\vspace{2pt}

\noindent\begin{tabularx}{\linewidth}{@{} l X r @{}}
\toprule
\textit{Qualifications} & W-L record & Rank X/Y \\
\midrule
\textit{Playoffs} & Alliance role (team, team, team) & W-L \\
\midrule
\textit{Awards} & Award Name & \\
\bottomrule
\end{tabularx}
```

Separate multiple event tables with `\vspace{12pt}` between them.

If a row doesn't apply (e.g., no playoffs, no awards), use `---` as the value:

```latex
\textit{Playoffs} & --- & --- \\
```

If results continue onto a second page, put `\clearpage` before the tables that should start on the new page.

### Checklist for a new history entry

- [ ] Robot photo added to `assets/` as `YEAR-robotname.jpg`
- [ ] `\yearheading` uses format `YEAR GameName` (e.g., `2025 Reefscape`)
- [ ] Coaches and captains names are correct
- [ ] One table per competition event with correct records
- [ ] Entry is at the **top** of `17-history.md` (below `\clearpage`)
- [ ] Entry starts with `\clearpage` so it gets its own page


## Adding a glossary term

Open `sections/19-glossary.md`. Add a new entry in the following format:

```markdown
**Term Name—** Definition of the term goes here.
```

**Keep the glossary sorted alphabetically.** Insert your new term at the correct position in the file. Every entry must use the **bold term** followed by an em dash (`—`), then the definition.

Examples of correct format:

```markdown
**Baby Bird—** To pick up a game piece directly from the human player station without it touching the ground.

**Sauce—** Most often refers to robot code, but can also refer to any type of liquid used in the shop.
```


## Updating the cover page for a new edition

Edit `sections/00-cover.md` and change the edition number and year:

```latex
{\large\bfseries 4th EDITION}\\[4pt]
{\large\bfseries 2027}
```

Also update the `edition` field in `config/settings.yaml`:

```yaml
edition: "4th Edition"
```


## Adding images

- Put all images in `assets/`
- Use descriptive filenames: `2025-torrent.jpg`, not `IMG_4032.jpg`
- Robot photos: always include the year in the filename
- Preferred formats: JPG for photos, PNG for logos and graphics
- Keep files under 5 MB


## Part divider pages

The five part divider pages (`part1-divider.md` through `part5-divider.md`) display a centered icon image. The title text is baked into each PNG in `assets/` — do not add title text in the markdown. If you need to change a divider title, you need to edit the image file itself.


## What will break the build

- A file listed in `settings.yaml` that doesn't exist in `sections/`
- Referencing an image in `assets/` that doesn't exist
- Unclosed LaTeX environments (missing `\end{tcolorbox}`, `\end{tabularx}`, etc.)
- Skipping heading levels (going from `#` directly to `###`)
- Using curly braces `{` `}` for grouping in markdown — pandoc escapes them. All LaTeX grouping should be done inside commands, not with bare braces.


## Building locally

Install dependencies:

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

Build:

```bash
bash build/build.sh
```

Output appears at `handbook.pdf` in the repo root.

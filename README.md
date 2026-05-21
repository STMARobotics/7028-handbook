# 7028 Binary Battalion — Team Handbook

[![Build Handbook](https://github.com/YOUR_ORG/7028-handbook/actions/workflows/handbook-build.yml/badge.svg)](https://github.com/YOUR_ORG/7028-handbook/actions)

The official team handbook for FRC Team 7028, Binary Battalion.

## Download

The latest built PDF is always at the root of this repo: [`handbook.pdf`](./handbook.pdf)

## Making changes

See [CONTRIBUTING.md](./CONTRIBUTING.md) for the full guide.

The short version:
1. Edit a file in `/sections/`
2. Open a pull request
3. A preview PDF is attached to the PR automatically
4. Merge → PDF rebuilds and commits itself

## Repo structure

```
sections/     ← Handbook content (one .md per section)
assets/       ← Images
config/       ← Template, settings, lint rules
build/        ← Build scripts and CI workflow
handbook.pdf  ← Latest generated handbook
```

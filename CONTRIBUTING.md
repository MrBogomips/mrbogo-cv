# Contributing to mrbogo-cv

Thank you for your interest in contributing to mrbogo-cv! This document provides development setup and build instructions.

## Quick Start (Development)

For developing or customizing the template itself:

### Prerequisites

Install [Typst](https://typst.app/docs/reference/installation/) (v0.11 or later):

```bash
# macOS
brew install typst

# Other platforms: https://typst.app/docs/reference/installation/
```

### Setup

```bash
# Clone the repository
git clone https://github.com/MrBogomips/mrbogo-cv.git
cd mrbogo-cv

# Download FontAwesome fonts (required for icons)
./setup.sh
```

### Build Commands

Use the Makefile for easy builds:

```bash
make                 # Build CV in all languages (en, it)
make all             # Same as default
make cv              # Same as above
make cv CV_LANG=en   # Build CV only in English

make letter LETTER=mr-burns              # Build letter in all languages
make letter LETTER=mr-burns CV_LANG=en   # Build letter only in English

make clean           # Remove output directory
make help            # Show all available targets
```

Output files are generated in `output/`:
- CVs: `output/cv-<lang>.pdf`
- Letters: `output/letter-<lang>-<name>.pdf`

#### Makefile Configuration

The Makefile includes configuration variables that can be customized:

```makefile
LANGS := en it           # Languages to build by default
OUTPUT_DIR := output     # Directory for generated PDFs
FONT_PATH := ./fonts     # Path to FontAwesome fonts
```

To add a new language to automatic builds, add it to `LANGS` in the Makefile after creating the language content directory (see "Add a New Language" in the README).

#### Manual Commands

For more control, use Typst directly with `--input` flags:

```bash
# Build English CV
typst compile --font-path ./fonts --input lang=en cv.typ output/cv-en.pdf

# Build specific cover letter
typst compile --font-path ./fonts --input lang=en --input letter=mr-burns letter.typ output/letter-mr-burns.pdf
```

**Flag reference:**
| Flag | Purpose |
|------|---------|
| `--font-path ./fonts` | Include FontAwesome icons |
| `--input lang=en` | Select content language |
| `--input letter=NAME` | Select letter file (without `.typ`) |

### Watch Mode (Auto-rebuild)

```bash
# Automatically rebuild on file changes
typst watch --font-path ./fonts --input lang=en cv.typ output/cv-en.pdf
```

## Project Structure

```text
mrbogo-cv/
├── cv.typ                  # Entry point - orchestrates imports
├── letter.typ              # Letter entry point
│
├── content/                # YOUR DATA (edit these)
│   ├── en/                 # English content
│   │   ├── profile.typ     # Name, title, contact, intro
│   │   ├── labels.typ      # UI strings ("Experience", "Skills", etc.)
│   │   ├── skills.typ      # Skill categories with levels
│   │   ├── experience.typ  # Work history entries
│   │   ├── education.typ   # Education entries
│   │   ├── projects.typ    # Project entries
│   │   ├── certifications.typ
│   │   └── publications.typ
│   ├── it/                 # Italian (same structure)
│   └── letters/            # Cover letter content
│
├── lib/                    # TEMPLATE LOGIC (modify for layout changes)
│   ├── cv-layout.typ       # Page structure, header, footer
│   ├── theme.typ           # Colors, fonts, spacing constants
│   ├── entry.typ           # Entry component (experience, education, etc.)
│   ├── contact.typ         # Contact info rendering
│   ├── sidebar.typ         # Sidebar state management
│   └── skill-level.typ     # Skill bars with levels
│
├── templates/              # Convenience re-exports
│   ├── cv.typ              # Imports all lib/* for content files
│   └── letter.typ          # Letter-specific imports
│
├── assets/
│   └── profile.png         # Profile photo
│
└── fonts/                  # FontAwesome (downloaded by setup.sh)
```

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Run `make` to ensure everything builds correctly
5. Commit your changes with a descriptive message
6. Push to your fork and submit a pull request

## Code Style

- Follow the existing Typst formatting conventions
- Keep content separated from template logic
- Use meaningful variable names
- Add comments for complex logic

## Publishing to Typst Universe

The package is published to [Typst Universe](https://typst.app/universe/) via a two-step workflow:

### Step 1: Create a Release (Automatic Sync)

When you create a GitHub release with a semver tag (e.g., `v1.0.5`), the **Publish to Typst Packages** workflow automatically:

1. Builds and validates the package
2. Creates a package bundle and attaches it to the release
3. Syncs the fork (`MrBogomips/typst-packages`) with upstream (`typst/packages`)
4. Pushes the package to a release branch (`mrbogo-cv-1.0.5`)

**To create a release:**
```bash
git tag v1.0.5
git push origin v1.0.5
# Then create a release on GitHub from the tag
```

### Step 2: Open PR (Manual)

After the release workflow completes, manually trigger the **Open PR to Typst Packages** workflow:

1. Go to **Actions** → **Open PR to Typst Packages**
2. Click **Run workflow**
3. Enter the version (e.g., `1.0.5`)
4. Click **Run workflow**

This creates a PR to `typst/packages` with the proper submission template and opens a tracking issue.

### Why Two Steps?

Separating sync from PR creation allows you to:
- Review the fork state before creating the PR
- Fix issues in the package without creating duplicate PRs
- Control timing of the submission to Typst Universe

### Required Secrets

The workflows require a `TYPST_PACKAGES_PAT` secret with:
- `repo` scope for pushing to the fork
- Permission to create PRs on `typst/packages`

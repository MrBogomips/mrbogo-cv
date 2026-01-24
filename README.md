# mrbogo-cv

A professional CV template built with [Typst](https://typst.app/), featuring Bart Simpson as an example persona.

## Credits

This template is based on [neat-cv](https://github.com/alexfernandez/neat-cv) by Giovanni Costagliola. The original design has been adapted and reorganized for easier customization.

## Features

- **Multi-language support** - Content separated by language (English, Italian included)
- **Professional layout** - Clean two-column design with sidebar
- **Cover letters** - Matching cover letter template
- **Easy customization** - Content files separate from template logic
- **FontAwesome icons** - Social links and contact info with icons

## Quick Start

### Prerequisites

- [Typst](https://typst.app/docs/reference/installation/) (v0.11+)
- Make (optional, for convenience commands)

### Installation

```bash
# Clone the repository
git clone https://github.com/MrBogomips/mrbogo-cv.git
cd mrbogo-cv

# Install required fonts
make setup
```

### Build

```bash
# Build English CV
make build-en

# Build Italian CV
make build-it

# Build all CVs
make build-all

# Build cover letter
make letter LETTER=mr-burns
```

Or use Typst directly:

```bash
typst compile --font-path ./fonts --input lang=en cv.typ output/cv.pdf
```

## Project Structure

```
mrbogo-cv/
├── cv.typ                  # Main CV entry point
├── letter.typ              # Cover letter entry point
├── Makefile                # Build commands
├── setup.sh                # Font installation script
├── assets/
│   └── profile.png         # Profile photo
├── content/
│   ├── en/                 # English content
│   │   ├── profile.typ     # Name, title, intro text
│   │   ├── labels.typ      # UI strings (section titles)
│   │   ├── skills.typ      # Skills with proficiency levels
│   │   ├── experience.typ  # Work experience
│   │   ├── education.typ   # Education history
│   │   ├── projects.typ    # Notable projects
│   │   ├── certifications.typ
│   │   └── publications.typ
│   ├── it/                 # Italian content (same structure)
│   └── letters/            # Cover letter templates
│       ├── default.typ
│       ├── default_it.typ
│       └── mr-burns.typ
├── lib/                    # Core Typst components
│   ├── cv-layout.typ       # Page layout
│   ├── entry.typ           # Entry component
│   ├── theme.typ           # Colors, fonts, constants
│   ├── contact.typ         # Contact info component
│   ├── sidebar.typ         # Sidebar component
│   └── skill-level.typ     # Skill bars
├── templates/              # Component re-exports
│   ├── cv.typ
│   └── letter.typ
├── fonts/                  # FontAwesome (downloaded by setup.sh)
└── output/                 # Generated PDFs
```

## Customization

### Replace Example Content

1. **Profile photo**: Replace `assets/profile.png` with your photo

2. **Personal info**: Edit `content/en/profile.typ`:
   ```typst
   #let author = (
     firstname: "Your",
     lastname: "Name",
     email: "you@example.com",
     phone: "+1 234 567 8900",
     position: "Your Title",
     github: "yourusername",
     linkedin: "yourprofile",
   )
   ```

3. **About section**: Edit `about-me` and `intro-text` in the same file

4. **Experience**: Edit `content/en/experience.typ` using the `entry` component:
   ```typst
   #entry(
     title: "Job Title",
     institution: "Company Name",
     location: "City, Country",
     date: "2020 - Present",
   )[
     - Achievement or responsibility
     - Another bullet point
   ]
   ```

5. **Skills**: Edit `content/en/skills.typ`:
   ```typst
   #item-with-level("Skill Name", 5)  // Level 1-5
   ```

6. **Other sections**: Follow the same pattern for education, projects, certifications, and publications

### Add a New Language

1. Create a new directory: `content/xx/` (where `xx` is the language code)
2. Copy all files from `content/en/`
3. Translate the content
4. Build with: `typst compile --input lang=xx cv.typ output/cv-xx.pdf`

### Customize Theme

Edit `lib/theme.typ` to change colors:

```typst
#let color-dark = rgb("#1e3d58")      // Header background
#let color-primary = rgb("#057dcd")   // Titles, accents
#let color-secondary = rgb("#43b0f1") // Dates, locations
#let color-light = rgb("#e8eef1")     // Light accents
```

## Output Matrix

| Language | Output File |
|----------|-------------|
| English  | cv-simpson-en.pdf |
| Italian  | cv-simpson-it.pdf |

## License

MIT License - See [LICENSE](LICENSE) file.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

*Don't have a cow, man!* - Bart Simpson

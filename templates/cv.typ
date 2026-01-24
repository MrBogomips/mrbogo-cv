// CV Template - single import for all CV components
// Usage: #import "templates/cv.typ": *

// Re-export layout
#import "../lib/cv-layout.typ": cv

// Re-export sidebar
#import "../lib/sidebar.typ": side

// Re-export entry components
#import "../lib/entry.typ": entry

// Re-export skill level components
#import "../lib/skill-level.typ": item-with-level, level-bar

// Re-export contact components
#import "../lib/contact.typ": contact-info, social-links

// Re-export theme utilities
#import "../lib/theme.typ": (
  color-dark, color-primary, color-secondary, color-light,
  heading-style, introduction, side-block,
)

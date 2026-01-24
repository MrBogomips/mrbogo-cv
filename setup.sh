#!/bin/bash
# Setup script for mrbogo-cv dependencies
# Downloads FontAwesome fonts required for icons

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FONTS_DIR="$SCRIPT_DIR/fonts"
FA_VERSION="7.1.0"
FA_URL="https://github.com/FortAwesome/Font-Awesome/releases/download/${FA_VERSION}/fontawesome-free-${FA_VERSION}-desktop.zip"

echo "=== mrbogo-cv Setup ==="
echo ""

# Check Typst installation
echo "Checking Typst installation..."
if command -v typst &> /dev/null; then
    TYPST_VERSION=$(typst --version)
    echo "  ✓ $TYPST_VERSION"
else
    echo "  ✗ Typst not found"
    echo ""
    echo "Install Typst:"
    echo "  macOS: brew install typst"
    echo "  Other: https://typst.app/docs/reference/installation/"
    exit 1
fi

# Create fonts directory
mkdir -p "$FONTS_DIR"

# Download FontAwesome if not present
FA_BRANDS="$FONTS_DIR/Font Awesome 7 Brands-Regular-400.otf"
FA_SOLID="$FONTS_DIR/Font Awesome 7 Free-Solid-900.otf"

if [[ -f "$FA_BRANDS" ]] && [[ -f "$FA_SOLID" ]]; then
    echo ""
    echo "FontAwesome fonts already present."
else
    echo ""
    echo "Downloading FontAwesome ${FA_VERSION}..."

    TEMP_DIR=$(mktemp -d)
    TEMP_ZIP="$TEMP_DIR/fontawesome.zip"

    if curl -fsSL "$FA_URL" -o "$TEMP_ZIP"; then
        echo "  Extracting OTF files..."
        unzip -q "$TEMP_ZIP" -d "$TEMP_DIR"

        # Copy OTF files
        cp "$TEMP_DIR/fontawesome-free-${FA_VERSION}-desktop/otfs/"*.otf "$FONTS_DIR/"

        echo "  ✓ FontAwesome fonts installed to fonts/"
    else
        echo "  ✗ Failed to download FontAwesome"
        echo ""
        echo "Manual download:"
        echo "  1. Download from: $FA_URL"
        echo "  2. Extract OTF files to: $FONTS_DIR/"
    fi

    # Cleanup
    rm -rf "$TEMP_DIR"
fi

# Check system fonts
echo ""
echo "Checking system fonts..."

check_font() {
    local font_name="$1"
    if fc-list 2>/dev/null | grep -qi "$font_name"; then
        echo "  ✓ $font_name found"
        return 0
    else
        echo "  ⚠ $font_name not found (may still work with fallback)"
        return 1
    fi
}

FONTS_OK=true
check_font "Fira Sans" || FONTS_OK=false
check_font "Noto Sans" || FONTS_OK=false

if [[ "$FONTS_OK" == "false" ]]; then
    echo ""
    echo "Note: mrbogo-cv uses Fira Sans and Noto Sans."
    echo "Install on macOS with Homebrew:"
    echo "  brew install --cask font-fira-sans font-noto-sans"
    echo ""
    echo "Or download from Google Fonts:"
    echo "  https://fonts.google.com/specimen/Fira+Sans"
    echo "  https://fonts.google.com/specimen/Noto+Sans"
fi

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Build commands:"
echo "  make build-en    Build English CV"
echo "  make build-it    Build Italian CV"
echo "  make build-all   Build all CVs"

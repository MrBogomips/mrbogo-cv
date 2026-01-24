# mrbogo-cv Build System
# A Typst CV Template with Bart Simpson Example

TYPST := typst
OUTPUT_DIR := output
FONT_PATH := ./fonts

# Default parameters (can be overridden: make letter LETTER=myfile CV_LANG=it)
# Note: Using CV_LANG instead of LANG to avoid collision with system locale
CV_LANG ?= en
LETTER ?= default

.PHONY: help setup build-en build-it letter build-all clean

help:
	@echo "mrbogo-cv Build System"
	@echo ""
	@echo "CV Commands:"
	@echo "  make build-en     Build English CV"
	@echo "  make build-it     Build Italian CV"
	@echo "  make build-all    Build all CVs"
	@echo ""
	@echo "Letter Commands:"
	@echo "  make letter                                Build default letter (English)"
	@echo "  make letter CV_LANG=it LETTER=default_it   Build Italian default letter"
	@echo "  make letter LETTER=mr-burns                Build cover letter to Mr. Burns"
	@echo ""
	@echo "Other Commands:"
	@echo "  make setup        Install fonts and dependencies"
	@echo "  make clean        Remove generated files"
	@echo ""
	@echo "Available letters in content/letters/:"
	@ls -1 content/letters/*.typ 2>/dev/null | xargs -I {} basename {} .typ | sed 's/^/  /'

setup:
	@chmod +x ./setup.sh
	@./setup.sh

# CV builds (language-parameterized)
build-en: $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONT_PATH) --input lang=en cv.typ $(OUTPUT_DIR)/cv-simpson-en.pdf
	@echo "Built: $(OUTPUT_DIR)/cv-simpson-en.pdf"

build-it: $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONT_PATH) --input lang=it cv.typ $(OUTPUT_DIR)/cv-simpson-it.pdf
	@echo "Built: $(OUTPUT_DIR)/cv-simpson-it.pdf"

# Letter build (requires LETTER parameter, optional CV_LANG)
# Usage: make letter LETTER=mr-burns CV_LANG=en
letter: $(OUTPUT_DIR)
	$(TYPST) compile --font-path $(FONT_PATH) --input lang=$(CV_LANG) --input letter=$(LETTER) letter.typ $(OUTPUT_DIR)/letter-$(LETTER).pdf
	@echo "Built: $(OUTPUT_DIR)/letter-$(LETTER).pdf"

# Build all CVs (letters are application-specific, built individually)
build-all: build-en build-it
	@echo ""
	@echo "All CVs built successfully."
	@echo "Use 'make letter LETTER=<name> CV_LANG=<lang>' for letters."

$(OUTPUT_DIR):
	@mkdir -p $(OUTPUT_DIR)

clean:
	rm -f $(OUTPUT_DIR)/cv-simpson-en.pdf
	rm -f $(OUTPUT_DIR)/cv-simpson-it.pdf
	rm -f $(OUTPUT_DIR)/letter-*.pdf

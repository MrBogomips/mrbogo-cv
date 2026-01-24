# mrbogo-cv - Local Development Makefile
# Build CVs and letters using local template files

# Configuration
LANGS := en it
OUTPUT_DIR := output
FONT_PATH := ./fonts

# Typst compile command base
TYPST := typst compile --font-path $(FONT_PATH)

# Default target
.PHONY: all
all: cv

# Create output directory
$(OUTPUT_DIR):
	@mkdir -p $(OUTPUT_DIR)

# Build CV(s)
# Usage: make cv              - Build all languages
#        make cv CV_LANG=en   - Build specific language
.PHONY: cv
cv: $(OUTPUT_DIR)
ifdef CV_LANG
	$(TYPST) --input lang=$(CV_LANG) cv.typ $(OUTPUT_DIR)/cv-$(CV_LANG).pdf
	@echo "Built: $(OUTPUT_DIR)/cv-$(CV_LANG).pdf"
else
	@for lang in $(LANGS); do \
		$(TYPST) --input lang=$$lang cv.typ $(OUTPUT_DIR)/cv-$$lang.pdf; \
		echo "Built: $(OUTPUT_DIR)/cv-$$lang.pdf"; \
	done
endif

# Build letter
# Usage: make letter LETTER=mr-burns              - Build all languages
#        make letter LETTER=mr-burns CV_LANG=en   - Build specific language
.PHONY: letter
letter: $(OUTPUT_DIR)
ifndef LETTER
	@echo "Error: LETTER is required"
	@echo "Usage: make letter LETTER=<name> [CV_LANG=<lang>]"
	@echo "Example: make letter LETTER=mr-burns"
	@exit 1
endif
ifdef CV_LANG
	$(TYPST) --input lang=$(CV_LANG) --input letter=$(LETTER) letter.typ $(OUTPUT_DIR)/letter-$(CV_LANG)-$(LETTER).pdf
	@echo "Built: $(OUTPUT_DIR)/letter-$(CV_LANG)-$(LETTER).pdf"
else
	@for lang in $(LANGS); do \
		$(TYPST) --input lang=$$lang --input letter=$(LETTER) letter.typ $(OUTPUT_DIR)/letter-$$lang-$(LETTER).pdf; \
		echo "Built: $(OUTPUT_DIR)/letter-$$lang-$(LETTER).pdf"; \
	done
endif

# Clean output directory
.PHONY: clean
clean:
	@rm -rf $(OUTPUT_DIR)
	@echo "Cleaned: $(OUTPUT_DIR)/"

# Help target
.PHONY: help
help:
	@echo "mrbogo-cv - Local Development Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make                 Build CV in all languages (default)"
	@echo "  make cv              Build CV in all languages"
	@echo "  make cv CV_LANG=en   Build CV in specific language"
	@echo ""
	@echo "  make letter LETTER=<name>              Build letter in all languages"
	@echo "  make letter LETTER=<name> CV_LANG=en   Build letter in specific language"
	@echo ""
	@echo "  make clean      Remove output directory"
	@echo "  make help       Show this help message"
	@echo ""
	@echo "Configuration:"
	@echo "  Languages: $(LANGS)"
	@echo "  Output:    $(OUTPUT_DIR)/"
	@echo ""
	@echo "Examples:"
	@echo "  make cv CV_LANG=en                       # Build English CV"
	@echo "  make letter LETTER=mr-burns              # Build mr-burns letter (all languages)"
	@echo "  make letter LETTER=mr-burns CV_LANG=it   # Build Italian mr-burns letter"

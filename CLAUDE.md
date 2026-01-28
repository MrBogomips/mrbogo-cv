# Typst Package Publishing Requirements

When submitting to typst/packages, ensure:

## README.md Requirements

1. **Alt text for images** - All `<img>` tags must have descriptive `alt` attributes
2. **Assume published** - README is displayed on Typst Universe; don't use "once published" language
3. **Version in imports** - Import examples must include version: `@preview/package:X.Y.Z`
4. **No dev instructions** - Move build/development content to CONTRIBUTING.md

## Assets Requirements

1. **No copyrighted images** - Don't include copyrighted characters/artwork
2. **Permissive licenses** - All included images must be CC0, MIT, or similarly permissive
3. **Placeholder content** - Use generic/generated avatars for templates

## Submission Checklist

- [ ] All images have alt text
- [ ] Import statements include version number
- [ ] No "once published" or conditional language
- [ ] Development docs in CONTRIBUTING.md (not README)
- [ ] No copyrighted images in template/assets
- [ ] Thumbnail.png is appropriate size and quality

## Reference

- [Submission Guidelines](https://github.com/typst/packages/blob/main/SUBMISSION_GUIDELINES.md)

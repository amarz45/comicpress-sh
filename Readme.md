# Comicpress

An advanced command-line tool to intelligently convert and optimize digital comics and manga into high-quality, space-saving CBZ archives.

## The Problem

Digital comic book files, especially PDFs, are often unnecessarily large and not optimized for ereaders or tablets. Many existing conversion applications can save space, but often at the cost of quality. Comic press gives you the best of both worlds: **maximum space savings with indistinguishable quality loss**.

## Features

- Device profiles: Easily target specific ereader devices to automatically use the correct resolution and density.
- Intelligent page analysis: Automatically detects which pages are monochrome (stencil-only) and which contain colour or grayscale images.
- Adaptive optimization: Applies aggressive (8-colour) compression to monochrome pages and quality-preserving (128-colour) compression to non-monochrome pages. This saves _a lot_ of space, and the quality loss is _indistinguishable_ (unless you zoom in very closely).
- Parallel processing: Maximizes speed by converting multiple PDF files in parallel using all available CPU cores. If GNU Parallel is not installed, the script automatically reverts to a slower, sequential mode.

# Dependencies

### Required

- Bash
- ImageMagick
- poppler-utils
- zip

### Recommended

- GNU Parallel: For a significant performance boost when processing multiple files. The script will work without it, but much more slowly.

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/amarz45/comicpress
   cd comicpress
   ```

2. Install the script to `/usr/local/bin`:

   ```sh
   sudo make
   ```

### Custom install location

To install to a different directory, set the `PREFIX` variable:

```sh
make PREFIX=$HOME/.local
```

## Uninstallation

```sh
sudo make uninstall
```

## Examples

1. Using a device profile: The easiest way to run the script. It automatically configures the resolution and density for your device.

   ```sh
   comicpress -device "Kobo Sage" -d output_dir input_manga/*
   ```

2. Using manual settings: Provides full control over the output resolution and density.

   ```sh
   comicpress -density 300 -width 1440 -height 1920 -d output_dir input_manga/*
   ```

3. Changing the scaling filter: Overrides the default filter for a different look.[^1]

   ```sh
   comicpress -device "Kobo Sage" -filter Lanczos -d output_dir input_manga/*
   ```

You can view a full list of options by running `comicpress -help`.

[^1]: It’s strongly recommended to leave this to the default setting for the best quality.

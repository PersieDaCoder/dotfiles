# Carbon Design System - Design Tokens

> Description: This section shows you all tokens that Carbon Design System (React) includes. You will learn about what tokens Carbon has, when and how to use it.

### 2.1 Grid System (2x Grid)

> Breakpoints:

| Breakpoint | Value (px/rem) | Columns | Column Size  | Padding | Margin |
| ---------- | -------------- | ------- | ------------ | ------- | ------ |
| Small      | 320 / 20       | 4       | 80px (25%)   | 16px    | 0      |
| Medium     | 672 / 42       | 8       | 80px (12.5%) | 16px    | 16px   |
| Large      | 1056 / 66      | 16      | 64px (6.25%) | 16px    | 16px   |
| X-Large    | 1312 / 82      | 16      | 80px (6.25%) | 16px    | 16px   |
| Max        | 1584 / 99      | 16      | 96px (6.25%) | 16px    | 24px   |

**Mini Unit:** 8px (base unit for all spacing and sizing)

>*Sizing Scale (Fixed)

| Token | Mini Units | Pixels |
|-------|------------|--------|
| 1x    | 1          | 8px    |
| 2x    | 2          | 16px   |
| 3x    | 3          | 24px   |
| 4x    | 4          | 32px   |
| 6x    | 6          | 48px   |
| 8x    | 8          | 64px   |
| 10x   | 10         | 80px   |

**Aspect Ratios:** 1:1, 2:1, 2:3, 3:2, 4:3, 16:9

### 2.2 Spacing Scale (Complete - 13 tokens)

| Token         | rem   | px    | Usage                     |
| ------------- | ----- | ----- | ------------------------- |
| `$spacing-01` | 0.125 | 2px   | Smallest gap              |
| `$spacing-02` | 0.25  | 4px   | Very tight spacing        |
| `$spacing-03` | 0.5   | 8px   | Tight spacing             |
| `$spacing-04` | 0.75  | 12px  | Small spacing             |
| `$spacing-05` | 1     | 16px  | Default component padding |
| `$spacing-06` | 1.5   | 24px  | Medium spacing            |
| `$spacing-07` | 2     | 32px  | Large spacing             |
| `$spacing-08` | 2.5   | 40px  | Extra large spacing       |
| `$spacing-09` | 3     | 48px  | Section spacing           |
| `$spacing-10` | 4     | 64px  | Large section spacing     |
| `$spacing-11` | 5     | 80px  | Extra large section       |
| `$spacing-12` | 6     | 96px  | Huge section spacing      |
| `$spacing-13` | 10    | 160px | Maximum spacing           |

**Common Usage:**
- Component padding: `$spacing-05` (16px)
- Gutters: 32px (2 × `$spacing-05`)
- Section margins: `$spacing-07` to `$spacing-10`

### 2.3 Color System (Complete)

**Themes:**
- **White** (light): Background `#ffffff`
- **Gray 10** (light): Background `#f4f4f4`
- **Gray 90** (dark): Background `#262626`
- **Gray 100** (dark): Background `#161616`

**Layering Model:**
- Light themes: Alternate between White and Gray 10
- Dark themes: Each layer gets one step lighter (100→90→80→70)

**Core Token Groups:**
- **Background:** `$background`, `$background-hover`, `$background-active`
- **Layer:** `$layer-01`, `$layer-02`, `$layer-03`
- **Field:** `$field-01`, `$field-02`, `$field-03`
- **Border:** `$border-subtle`, `$border-strong`, `$border-inverse`
- **Text:** `$text-primary`, `$text-secondary`, `$text-placeholder`, `$text-disabled`
- **Link:** `$link-primary`, `$link-secondary`, `$link-visited`
- **Icon:** `$icon-primary`, `$icon-secondary`, `$icon-disabled`
- **Support:** `$support-error`, `$support-success`, `$support-warning`, `$support-info`
- **Focus:** `$focus`, `$focus-inset`, `$focus-inverse`

**Interaction States:**
- **Hover:** Half-step lighter/darker
- **Active:** Two full steps (e.g., Blue 60 → Blue 80)
- **Selected:** One full step (e.g., Gray 10 → Gray 20)
- **Focus:** Blue 60 (light), White (dark)
- **Disabled:** Gray family, reduced opacity

**Contrast Requirements:**
- Small text (<24px): 4.5:1 minimum
- Large text (≥24px): 3:1 minimum
- UI elements: 3:1 minimum

### 2.4 Typography (Complete)

> Type Scale:

| rem   | px  | Usage              |
| ----- | --- | ------------------ |
| 0.75  | 12  | Helper text        |
| 0.875 | 14  | Body compact       |
| 1     | 16  | Body               |
| 1.125 | 18  | Body large         |
| 1.25  | 20  | Heading compact    |
| 1.5   | 24  | Heading 06         |
| 1.75  | 28  | Heading 05         |
| 2     | 32  | Heading 04         |
| 2.25  | 36  | Heading 03         |
| 2.625 | 42  | Expressive heading |
| 3     | 48  | Heading 02         |
| 3.375 | 54  | Large display      |
| 3.75  | 60  | Heading 01         |

**Font Stacks:**
```css
/* Sans (default) */
font-family: 'IBM Plex Sans', 'Helvetica Neue', Arial, sans-serif;

/* Serif */
font-family: 'IBM Plex Serif', 'Georgia', Times, serif;

/* Mono */
font-family: 'IBM Plex Mono', 'Menlo', 'DejaVu Sans Mono', Courier, monospace;
```

**Weights:**
- Light (300): Long-form content
- Regular (400): Body text
- SemiBold (600): Headers (not for long text)
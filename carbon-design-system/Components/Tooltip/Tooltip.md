# Tooltip

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-tooltip--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tooltip/usage) | [Accessibility](https://www.carbondesignsystem.com/components/tooltip/accessibility)

## Overview

Tooltip displays brief, supplemental information on hover or focus. It's designed for short, non-interactive content that appears temporarily. For interactive content, use Toggletip instead.

## When to Use

- To provide additional context for UI elements
- For icon-only buttons that need labels
- To explain abbreviated or truncated text
- For brief descriptions on hover/focus

## When Not to Use

- For interactive content (use Toggletip)
- For critical information (always visible)
- For long content (use Popover)
- As a replacement for visible labels

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard tooltip on hover/focus |
| **With Icon** | Tooltip triggered by info icon |
| **Definition** | Inline definition tooltips |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `node` | - | Primary tooltip content (maps to `aria-labelledby`) |
| `description` | `node` | - | Secondary content (maps to `aria-describedby`) |
| `align` | `string` | `'bottom'` | Tooltip position |
| `enterDelayMs` | `number` | `100` | Delay before showing (ms) |
| `leaveDelayMs` | `number` | `300` | Delay before hiding (ms) |
| `defaultOpen` | `boolean` | `false` | Initially open |
| `closeOnActivation` | `boolean` | `false` | Close when trigger activated |
| `className` | `string` | - | Additional CSS classes |

### Alignment Options

- `top`, `top-left`, `top-right`
- `bottom`, `bottom-left`, `bottom-right`
- `left`, `left-top`, `left-bottom`
- `right`, `right-top`, `right-bottom`

---

## Code Examples

### Basic Usage

```jsx
import { Tooltip } from '@carbon/react';

<Tooltip label="Tooltip text" align="bottom">
  <button type="button">Hover me</button>
</Tooltip>
```

### With Description

```jsx
<Tooltip
  label="Settings"
  description="Configure your preferences"
  align="right"
>
  <button type="button">
    <Settings />
  </button>
</Tooltip>
```

### Different Alignments

```jsx
<Tooltip label="Top aligned" align="top">
  <button>Top</button>
</Tooltip>

<Tooltip label="Right aligned" align="right">
  <button>Right</button>
</Tooltip>

<Tooltip label="Bottom-left" align="bottom-left">
  <button>Bottom Left</button>
</Tooltip>
```

### On Icon Button

```jsx
import { Tooltip } from '@carbon/react';
import { Edit } from '@carbon/icons-react';

<Tooltip label="Edit item" align="bottom">
  <button type="button" aria-label="Edit">
    <Edit />
  </button>
</Tooltip>
```

### With Custom Delays

```jsx
<Tooltip
  label="Slow tooltip"
  enterDelayMs={500}
  leaveDelayMs={100}
>
  <button>Delayed</button>
</Tooltip>
```

### With Custom Component Trigger

```jsx
function CustomTrigger(props) {
  return (
    <button type="button" {...props}>
      Custom Trigger
    </button>
  );
}

<Tooltip label="Custom trigger tooltip">
  <CustomTrigger />
</Tooltip>
```

---

## Label vs Description

- **`label`**: Primary descriptor, maps to `aria-labelledby`. Use when the tooltip provides the main label for the element.
- **`description`**: Supplemental info, maps to `aria-describedby`. Use when the element already has a visible label.

```jsx
{/* Label - provides the button's name */}
<Tooltip label="Delete">
  <button><TrashCan /></button>
</Tooltip>

{/* Description - adds to existing label */}
<Tooltip description="This action cannot be undone">
  <button>Delete</button>
</Tooltip>
```

---

## Accessibility

- Neither `label` nor `description` should contain interactive content
- Tooltip requires an interactive trigger element (button, link)
- Content is announced by screen readers
- Keyboard: Focus triggers tooltip, Escape dismisses
- Maintain 4.5:1 contrast ratio for tooltip text

---

## Related Components

- [Toggletip](Toggletip.md) - For interactive tooltip content
- [DefinitionTooltip](DefinitionTooltip.md) - For inline definitions
- [Popover](Popover.md) - For complex content

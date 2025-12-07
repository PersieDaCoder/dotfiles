# Button

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-button--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/button/accessibility)

## Overview

Buttons are interactive elements that trigger actions. Button labels express what action will occur when the user interacts with it.

## When to Use

- To trigger an action or event
- For form submissions
- To navigate between pages (with `href` prop)
- For primary and secondary actions in dialogs

## When Not to Use

- For navigation within content (use Link instead)
- When the action is read-only (use Tag or Label)
- For menu triggers (use MenuButton or OverflowMenu)

---

## Variants (Kinds)

| Kind | Description |
|------|-------------|
| **Primary** | High emphasis, main action. Use sparingly (one per view) |
| **Secondary** | Medium emphasis, alternative actions |
| **Tertiary** | Low emphasis, less prominent actions |
| **Ghost** | Minimal emphasis, inline with content |
| **Danger** | Destructive actions (delete, remove) |
| **Danger-tertiary** | Destructive with reduced emphasis |
| **Danger-ghost** | Destructive with minimal emphasis |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `kind` | `'primary' \| 'secondary' \| 'tertiary' \| 'ghost' \| 'danger' \| 'danger--tertiary' \| 'danger--ghost'` | `'primary'` | Button styling variant |
| `size` | `'sm' \| 'md' \| 'lg' \| 'xl' \| '2xl'` | `'lg'` | Button size |
| `disabled` | `boolean` | `false` | Whether the button is disabled |
| `renderIcon` | `ComponentType` | - | Icon component from `@carbon/icons-react` |
| `hasIconOnly` | `boolean` | `false` | Render as icon-only button |
| `iconDescription` | `string` | - | Required with `hasIconOnly` for accessibility |
| `tooltipAlignment` | `'start' \| 'center' \| 'end'` | `'center'` | Tooltip alignment for icon buttons |
| `tooltipPosition` | `'top' \| 'bottom' \| 'left' \| 'right'` | `'top'` | Tooltip position for icon buttons |
| `href` | `string` | - | Renders button as anchor element |
| `as` | `ElementType` | - | Custom element type (pair with `role="button"`) |
| `type` | `'button' \| 'submit' \| 'reset'` | `'button'` | HTML button type |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Button Kinds

```jsx
import { Button } from '@carbon/react';

<Button kind="primary">Primary</Button>
<Button kind="secondary">Secondary</Button>
<Button kind="tertiary">Tertiary</Button>
<Button kind="ghost">Ghost</Button>
<Button kind="danger">Danger</Button>
```

### Button Sizes

```jsx
<Button size="sm">Small</Button>
<Button size="md">Medium</Button>
<Button size="lg">Large</Button>
<Button size="xl">Extra Large</Button>
<Button size="2xl">2X Large</Button>
```

### With Icon

```jsx
import { Button } from '@carbon/react';
import { Add } from '@carbon/icons-react';

<Button renderIcon={Add}>Add item</Button>
```

### Icon-Only Button

```jsx
import { Button } from '@carbon/react';
import { Edit } from '@carbon/icons-react';

<Button
  hasIconOnly
  renderIcon={Edit}
  iconDescription="Edit item"
  tooltipPosition="bottom"
/>
```

### As Link

```jsx
<Button href="/dashboard" kind="tertiary">
  Go to Dashboard
</Button>
```

### ButtonSet

```jsx
import { Button, ButtonSet } from '@carbon/react';

<ButtonSet>
  <Button kind="secondary">Cancel</Button>
  <Button kind="primary">Save</Button>
</ButtonSet>

{/* Stacked */}
<ButtonSet stacked>
  <Button kind="secondary">Cancel</Button>
  <Button kind="primary">Save</Button>
</ButtonSet>
```

---

## Accessibility

- Icon-only buttons require `iconDescription` for screen readers
- Non-button elements rendered as buttons need `role="button"`
- Maintain visible focus indicators
- Ensure sufficient color contrast for all button kinds
- Disabled buttons should not be focusable

---

## Related Components

- [IconButton](IconButton.md) - Dedicated icon-only button component
- [CopyButton](CopyButton.md) - For copy-to-clipboard actions
- [MenuButton](MenuButton.md) - Button with dropdown menu
- [ComboButton](ComboButton.md) - Split button with primary action and menu

# IconButton

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-iconbutton--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/button/accessibility)

## Overview

Icon buttons are compact buttons that display only an icon without visible text labels. They're designed for common actions in toolbars, tables, and space-constrained layouts where the icon alone clearly conveys the action. A text label is required for accessibility but can be visually hidden.

## When to Use

- **Toolbar actions**: Common actions in toolbars (edit, delete, share, settings)
- **Compact layouts**: Space-constrained interfaces like data tables or cards
- **Repetitive actions**: Repeated actions where icons become familiar (close, minimize, maximize)
- **Icon clarity**: When the icon's meaning is universally understood
- **Secondary actions**: Less prominent actions that don't need text emphasis

## When Not to Use

- **Unclear icons**: When the icon's meaning isn't immediately obvious
- **Primary actions**: Use regular Button with text for main calls-to-action
- **Unfamiliar actions**: New or complex actions that need text explanation
- **Multiple variants**: When text labels help differentiate similar actions
- **First-time users**: Consider Button with text for better discoverability

## Component API

### Basic Usage

```jsx
import { IconButton } from '@carbon/react';
import { Edit } from '@carbon/icons-react';

<IconButton label="Edit item" kind="ghost">
  <Edit />
</IconButton>
```

### With Tooltip

```jsx
import { Add } from '@carbon/icons-react';

<IconButton
  label="Add new item"
  kind="primary"
  align="top"
>
  <Add />
</IconButton>
```

### Destructive Action

```jsx
import { TrashCan } from '@carbon/icons-react';

<IconButton
  label="Delete item"
  kind="danger--ghost"
  disabled={!canDelete}
>
  <TrashCan />
</IconButton>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Accessible label (shown in tooltip) |
| `kind` | `string` | `"ghost"` | Button style: `"primary"`, `"secondary"`, `"tertiary"`, `"ghost"`, `"danger"`, `"danger--tertiary"`, `"danger--ghost"` |
| `size` | `string` | `"md"` | Button size: `"sm"`, `"md"`, `"lg"` |
| `disabled` | `bool` | `false` | Disable the button |
| `align` | `string` | `"bottom"` | Tooltip alignment: `"top"`, `"right"`, `"bottom"`, `"left"` |
| `closeOnActivation` | `bool` | `true` | Close tooltip on button activation |
| `onClick` | `func` | - | Click event handler |
| `className` | `string` | - | Additional CSS classes |
| `children` | `node` | required | Icon component to display |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from the button |
| `Enter/Space` | Activates the button |
| `Escape` | Dismisses tooltip (if open) |

### Screen Reader Support

- The `label` prop provides accessible text read by screen readers
- Tooltip displays the label text visually on hover/focus
- Disabled state is properly announced
- Focus indicators are clearly visible

### Best Practices

- **Always provide a clear `label`** - This is critical for accessibility
- **Use recognizable icons** - Stick to common, well-understood icons
- **Maintain icon consistency** - Use the same icon for the same action throughout your app
- **Ensure adequate touch target** - Minimum 44×44px for touch devices (use `size="lg"` if needed)
- **Don't disable without reason** - If disabled, make it clear why
- **Provide visual feedback** - Use appropriate `kind` for action type (danger for delete, etc.)

## Patterns

### Toolbar Actions

```jsx
function ItemToolbar({ onEdit, onDuplicate, onDelete, canEdit, canDelete }) {
  return (
    <div className="toolbar">
      <IconButton
        label="Edit"
        kind="ghost"
        onClick={onEdit}
        disabled={!canEdit}
      >
        <Edit />
      </IconButton>
      <IconButton
        label="Duplicate"
        kind="ghost"
        onClick={onDuplicate}
      >
        <Copy />
      </IconButton>
      <IconButton
        label="Delete"
        kind="danger--ghost"
        onClick={onDelete}
        disabled={!canDelete}
      >
        <TrashCan />
      </IconButton>
    </div>
  );
}
```

### Table Row Actions

```jsx
function TableRow({ item, onView, onEdit, onDelete }) {
  return (
    <TableRow>
      <TableCell>{item.name}</TableCell>
      <TableCell>{item.status}</TableCell>
      <TableCell>
        <IconButton label="View details" kind="ghost" onClick={() => onView(item.id)}>
          <View />
        </IconButton>
        <IconButton label="Edit item" kind="ghost" onClick={() => onEdit(item.id)}>
          <Edit />
        </IconButton>
        <IconButton label="Delete item" kind="danger--ghost" onClick={() => onDelete(item.id)}>
          <TrashCan />
        </IconButton>
      </TableCell>
    </TableRow>
  );
}
```

### With Loading State

```jsx
function IconButtonWithLoading({ isLoading, onSave, label }) {
  return (
    <IconButton
      label={isLoading ? "Saving..." : label}
      kind="primary"
      onClick={onSave}
      disabled={isLoading}
    >
      {isLoading ? <InlineLoading /> : <Save />}
    </IconButton>
  );
}
```

### Icon Button Group

```jsx
function FormatToolbar({ format, onFormatChange }) {
  return (
    <div className="format-toolbar">
      <IconButton
        label="Bold"
        kind={format.bold ? "primary" : "ghost"}
        onClick={() => onFormatChange('bold')}
      >
        <TextBold />
      </IconButton>
      <IconButton
        label="Italic"
        kind={format.italic ? "primary" : "ghost"}
        onClick={() => onFormatChange('italic')}
      >
        <TextItalic />
      </IconButton>
      <IconButton
        label="Underline"
        kind={format.underline ? "primary" : "ghost"}
        onClick={() => onFormatChange('underline')}
      >
        <TextUnderline />
      </IconButton>
    </div>
  );
}
```

## Icon Selection Guidelines

### Recommended Icons for Common Actions

| Action | Icon | Package |
|--------|------|---------|
| Edit | `Edit` | `@carbon/icons-react` |
| Delete | `TrashCan` | `@carbon/icons-react` |
| Add | `Add` | `@carbon/icons-react` |
| Close | `Close` | `@carbon/icons-react` |
| Settings | `Settings` | `@carbon/icons-react` |
| Search | `Search` | `@carbon/icons-react` |
| Filter | `Filter` | `@carbon/icons-react` |
| Download | `Download` | `@carbon/icons-react` |
| Upload | `Upload` | `@carbon/icons-react` |
| Share | `Share` | `@carbon/icons-react` |
| Copy | `Copy` | `@carbon/icons-react` |
| View | `View` | `@carbon/icons-react` |
| More | `OverflowMenuVertical` | `@carbon/icons-react` |

## Related Components

- **Button**: For buttons with visible text labels
- **OverflowMenu**: For grouping multiple actions in a menu
- **Tooltip**: Automatically included with IconButton
- **CopyButton**: Specialized icon button for copy actions

## References

- [Carbon Design System - Button](https://www.carbondesignsystem.com/components/button/usage)
- [React Storybook - IconButton](https://react.carbondesignsystem.com/?path=/docs/components-iconbutton--overview)
- [Carbon Icons Library](https://carbondesignsystem.com/elements/icons/library/)
- [WCAG 2.1 - Touch Target Size](https://www.w3.org/WAI/WCAG21/Understanding/target-size.html)

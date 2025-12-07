# MenuButton

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-menubutton--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/button/accessibility)

## Overview

Menu button is a button that opens a dropdown menu of actions when clicked. Unlike ComboButton, there's no primary action—all options are accessed through the menu. It's ideal for presenting a set of related actions without taking up much screen space or when no single action is the clear default.

## When to Use

- **Multiple equal actions**: When actions have similar importance and no clear default
- **Space conservation**: Grouping related actions to save toolbar space
- **Action lists**: Providing a list of operations users can perform
- **Context menus**: Actions specific to an item or context
- **Secondary actions**: Less frequently used actions that don't need dedicated buttons

## When Not to Use

- **Primary action exists**: Use ComboButton if one action is clearly primary
- **Single action**: Use regular Button for standalone actions
- **Too many options**: If menu has >10 items, consider restructuring
- **Navigation**: Use Menu or Dropdown for navigation purposes
- **Form selection**: Use Dropdown for selecting values in forms

## Component API

### Basic Usage

```jsx
import { MenuButton, MenuItem } from '@carbon/react';

<MenuButton label="Actions">
  <MenuItem label="Edit" />
  <MenuItem label="Duplicate" />
  <MenuItem label="Delete" />
</MenuButton>
```

### With Icons

```jsx
import { Edit, Copy, TrashCan } from '@carbon/icons-react';

<MenuButton label="Actions">
  <MenuItem label="Edit" renderIcon={Edit} />
  <MenuItem label="Duplicate" renderIcon={Copy} />
  <MenuItem label="Delete" renderIcon={TrashCan} kind="danger" />
</MenuButton>
```

### With Dividers

```jsx
<MenuButton label="File">
  <MenuItem label="New file" renderIcon={Add} />
  <MenuItem label="Open file" renderIcon={FolderOpen} />
  <MenuItemDivider />
  <MenuItem label="Save" renderIcon={Save} />
  <MenuItem label="Save as..." renderIcon={SaveAs} />
  <MenuItemDivider />
  <MenuItem label="Export" renderIcon={Export} />
</MenuButton>
```

### With Nested Menus

```jsx
<MenuButton label="Edit">
  <MenuItem label="Cut" shortcut="⌘X" />
  <MenuItem label="Copy" shortcut="⌘C" />
  <MenuItem label="Paste" shortcut="⌘V" />
  <MenuItemDivider />
  <MenuItem label="Transform">
    <MenuItem label="Uppercase" />
    <MenuItem label="Lowercase" />
    <MenuItem label="Capitalize" />
  </MenuItem>
</MenuButton>
```

## Props

### MenuButton Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Button text |
| `children` | `node` | required | MenuItem components |
| `disabled` | `bool` | `false` | Disable the button |
| `size` | `string` | `"md"` | Size: `"sm"`, `"md"`, `"lg"`, `"xl"`, `"2xl"` |
| `kind` | `string` | `"primary"` | Style: `"primary"`, `"secondary"`, `"tertiary"`, `"ghost"` |
| `menuAlignment` | `string` | `"bottom-start"` | Menu position: `"bottom"`, `"bottom-start"`, `"bottom-end"`, `"top"`, `"top-start"`, `"top-end"` |
| `className` | `string` | - | Additional CSS classes |

### MenuItem Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Menu item text |
| `onClick` | `func` | - | Click handler |
| `renderIcon` | `component` | - | Icon component |
| `kind` | `string` | - | `"danger"` for destructive actions |
| `disabled` | `bool` | `false` | Disable this item |
| `shortcut` | `string` | - | Keyboard shortcut text |
| `children` | `node` | - | Nested menu items (for submenus) |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from menu button |
| `Enter/Space` | Opens/closes menu |
| `Arrow Down` | Opens menu and focuses first item (or moves to next item when open) |
| `Arrow Up` | Opens menu and focuses last item (or moves to previous item when open) |
| `Arrow Right` | Opens submenu (if focused item has submenu) |
| `Arrow Left` | Closes submenu and returns to parent |
| `Escape` | Closes menu and returns focus to button |
| `Home` | Focuses first menu item |
| `End` | Focuses last menu item |
| `Enter/Space` | Activates focused menu item |

### Screen Reader Support

- Menu button properly labeled
- Menu items announced with labels and shortcuts
- Submenu indicators announced
- Disabled items communicated
- Danger items clearly identified

### Best Practices

- **Clear labels**: Each menu item should have a distinct, actionable label
- **Logical grouping**: Use dividers to group related actions
- **Limit nesting**: Keep submenus to 1 level deep when possible
- **Keyboard shortcuts**: Display shortcuts for frequently used actions
- **Icon consistency**: Use icons consistently or not at all
- **Destructive actions**: Mark with `kind="danger"` and confirm if needed

## Patterns

### Table Row Actions

```jsx
function TableRowMenu({ row, onEdit, onDuplicate, onDelete }) {
  return (
    <MenuButton label="Actions" kind="ghost" size="sm">
      <MenuItem
        label="Edit"
        renderIcon={Edit}
        onClick={() => onEdit(row.id)}
      />
      <MenuItem
        label="Duplicate"
        renderIcon={Copy}
        onClick={() => onDuplicate(row.id)}
      />
      <MenuItemDivider />
      <MenuItem
        label="Delete"
        renderIcon={TrashCan}
        kind="danger"
        onClick={() => onDelete(row.id)}
      />
    </MenuButton>
  );
}
```

### Toolbar Menu

```jsx
function ToolbarMenu({ onNew, onOpen, onSave, onExport, canSave }) {
  return (
    <MenuButton label="File">
      <MenuItem label="New" renderIcon={Add} onClick={onNew} shortcut="⌘N" />
      <MenuItem label="Open..." renderIcon={FolderOpen} onClick={onOpen} shortcut="⌘O" />
      <MenuItemDivider />
      <MenuItem
        label="Save"
        renderIcon={Save}
        onClick={onSave}
        disabled={!canSave}
        shortcut="⌘S"
      />
      <MenuItem label="Export..." renderIcon={Export} onClick={onExport} />
    </MenuButton>
  );
}
```

### Edit Menu with Submenus

```jsx
function EditMenu({ clipboard, onCut, onCopy, onPaste, onTransform }) {
  return (
    <MenuButton label="Edit">
      <MenuItem label="Cut" onClick={onCut} shortcut="⌘X" />
      <MenuItem label="Copy" onClick={onCopy} shortcut="⌘C" />
      <MenuItem
        label="Paste"
        onClick={onPaste}
        disabled={!clipboard}
        shortcut="⌘V"
      />
      <MenuItemDivider />
      <MenuItem label="Transform">
        <MenuItem label="Uppercase" onClick={() => onTransform('upper')} />
        <MenuItem label="Lowercase" onClick={() => onTransform('lower')} />
        <MenuItem label="Title Case" onClick={() => onTransform('title')} />
      </MenuItem>
      <MenuItem label="Format">
        <MenuItem label="Bold" shortcut="⌘B" />
        <MenuItem label="Italic" shortcut="⌘I" />
        <MenuItem label="Underline" shortcut="⌘U" />
      </MenuItem>
    </MenuButton>
  );
}
```

### View Options Menu

```jsx
function ViewOptionsMenu({ view, onViewChange, showOptions, onToggleOption }) {
  return (
    <MenuButton label="View" kind="ghost">
      <MenuItem label="List view" onClick={() => onViewChange('list')} />
      <MenuItem label="Grid view" onClick={() => onViewChange('grid')} />
      <MenuItem label="Compact view" onClick={() => onViewChange('compact')} />
      <MenuItemDivider />
      <MenuItem
        label="Show sidebar"
        onClick={() => onToggleOption('sidebar')}
      />
      <MenuItem
        label="Show thumbnails"
        onClick={() => onToggleOption('thumbnails')}
      />
    </MenuButton>
  );
}
```

### Batch Actions Menu

```jsx
function BatchActionsMenu({ selectedCount, onExport, onArchive, onDelete }) {
  const hasSelection = selectedCount > 0;

  return (
    <MenuButton
      label={`Actions (${selectedCount} selected)`}
      disabled={!hasSelection}
    >
      <MenuItem
        label="Export selected"
        renderIcon={Export}
        onClick={onExport}
      />
      <MenuItem
        label="Archive selected"
        renderIcon={Archive}
        onClick={onArchive}
      />
      <MenuItemDivider />
      <MenuItem
        label={`Delete ${selectedCount} items`}
        renderIcon={TrashCan}
        kind="danger"
        onClick={onDelete}
      />
    </MenuButton>
  );
}
```

### Context Menu

```jsx
function ItemContextMenu({ item, position, onClose }) {
  return (
    <MenuButton
      label="Context actions"
      menuAlignment={position}
    >
      <MenuItem label="Open" renderIcon={View} />
      <MenuItem label="Open in new tab" renderIcon={OpenInNew} />
      <MenuItemDivider />
      <MenuItem label="Copy link" renderIcon={Link} />
      <MenuItem label="Download" renderIcon={Download} />
      <MenuItemDivider />
      <MenuItem label="Rename" renderIcon={Edit} />
      <MenuItem label="Move to..." renderIcon={Folder} />
      <MenuItem label="Delete" renderIcon={TrashCan} kind="danger" />
    </MenuButton>
  );
}
```

## MenuButton vs OverflowMenu vs ComboButton

| Component | Use When |
|-----------|----------|
| **MenuButton** | Actions have equal importance, no primary action |
| **ComboButton** | One action is clearly primary with alternatives |
| **OverflowMenu** | Space is very limited (shows only three-dot icon) |

## Related Components

- **ComboButton**: For split buttons with primary + alternative actions
- **OverflowMenu**: For compact three-dot menus
- **Button**: For single standalone actions
- **Dropdown**: For selecting values, not triggering actions

## References

- [Carbon Design System - Button](https://www.carbondesignsystem.com/components/button/usage)
- [React Storybook - MenuButton](https://react.carbondesignsystem.com/?path=/docs/components-menubutton--overview)
- [ARIA Authoring Practices - Menu Button](https://www.w3.org/WAI/ARIA/apg/patterns/menu-button/)
- [WCAG 2.1 - Keyboard Navigation](https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html)

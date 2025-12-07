# ComboButton

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-combobutton--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/button/accessibility)

## Overview

Combo button (also known as split button) combines a primary action button with a dropdown menu containing related actions. The main button triggers the default action, while a small dropdown arrow reveals additional variants or related actions. This pattern provides quick access to a primary action while making alternative actions discoverable.

## When to Use

- **Primary action with variants**: When there's a clear primary action with related alternatives (e.g., "Save" vs "Save as draft")
- **Default + alternatives**: One action is used most frequently, but alternatives should be easily accessible
- **Action groups**: Related actions where one is the default (e.g., "Export as PDF" with other formats available)
- **Frequent actions**: Actions used repeatedly where quick access to the primary action matters

## When Not to Use

- **Equal importance actions**: Use MenuButton or separate buttons if actions have equal weight
- **Too many options**: If there are more than 5-7 alternatives, consider Dropdown or Menu
- **Unrelated actions**: Actions should be variants of the same operation
- **Complex decisions**: When users need guidance choosing between options

## Component API

### Basic Usage

```jsx
import { ComboButton, MenuItem } from '@carbon/react';

<ComboButton label="Primary action">
  <MenuItem label="Alternative action 1" />
  <MenuItem label="Alternative action 2" />
  <MenuItem label="Alternative action 3" />
</ComboButton>
```

### With Icons

```jsx
import { Save, Download } from '@carbon/icons-react';

<ComboButton label="Save">
  <MenuItem label="Save as draft" renderIcon={Save} />
  <MenuItem label="Download" renderIcon={Download} />
</ComboButton>
```

### Destructive Actions

```jsx
<ComboButton label="Delete selected" kind="danger">
  <MenuItem label="Delete permanently" kind="danger" />
  <MenuItem label="Move to trash" />
  <MenuItem label="Archive" />
</ComboButton>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Text for the primary action button |
| `children` | `node` | required | MenuItem components for dropdown menu |
| `disabled` | `bool` | `false` | Disable the entire combo button |
| `size` | `string` | `"md"` | Button size: `"sm"`, `"md"`, `"lg"`, `"xl"`, `"2xl"` |
| `kind` | `string` | `"primary"` | Button style: `"primary"`, `"secondary"`, `"tertiary"`, `"ghost"`, `"danger"` |
| `menuAlignment` | `string` | `"bottom"` | Menu position: `"bottom"`, `"top"` |
| `onClick` | `func` | - | Handler for primary button click |
| `tooltipAlignment` | `string` | `"center"` | Tooltip alignment for dropdown trigger |
| `className` | `string` | - | Additional CSS classes |

### MenuItem Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Menu item text |
| `onClick` | `func` | - | Click handler for this menu item |
| `renderIcon` | `component` | - | Icon component to display |
| `kind` | `string` | - | Style: `"danger"` for destructive actions |
| `disabled` | `bool` | `false` | Disable this menu item |
| `shortcut` | `string` | - | Keyboard shortcut hint text |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus between primary button and dropdown trigger |
| `Enter/Space` | Activates focused button (primary or dropdown) |
| `Arrow Down` | Opens menu and focuses first item (when dropdown focused) |
| `Arrow Up` | Opens menu and focuses last item |
| `Escape` | Closes menu and returns focus to dropdown trigger |
| `Arrow Up/Down` | Navigate menu items when open |
| `Enter/Space` | Selects focused menu item |

### Screen Reader Support

- Primary button and dropdown trigger have clear labels
- Menu items are properly announced with their labels
- Disabled states are communicated
- Icon labels are announced
- Keyboard shortcuts are announced

### Best Practices

- **Primary action should be most common** - Users will default to clicking the main button
- **Limit alternatives** - Keep menu items to 3-7 options for scannability
- **Use clear labels** - Each action should be distinct and understandable
- **Group related actions** - All menu items should be variants of the same operation
- **Consider keyboard shortcuts** - Add `shortcut` props for power users

## Patterns

### Save Options

```jsx
function SaveComboButton({ onSave, onSaveAsDraft, onSaveAsTemplate }) {
  return (
    <ComboButton label="Save" onClick={onSave}>
      <MenuItem
        label="Save as draft"
        onClick={onSaveAsDraft}
        renderIcon={Save}
      />
      <MenuItem
        label="Save as template"
        onClick={onSaveAsTemplate}
        renderIcon={Template}
      />
    </ComboButton>
  );
}
```

### Export Options

```jsx
function ExportComboButton({ data }) {
  const exportPDF = () => exportData(data, 'pdf');
  const exportCSV = () => exportData(data, 'csv');
  const exportJSON = () => exportData(data, 'json');
  const exportXLSX = () => exportData(data, 'xlsx');

  return (
    <ComboButton label="Export as PDF" onClick={exportPDF}>
      <MenuItem label="Export as CSV" onClick={exportCSV} renderIcon={Document} />
      <MenuItem label="Export as JSON" onClick={exportJSON} renderIcon={Code} />
      <MenuItem label="Export as Excel" onClick={exportXLSX} renderIcon={DocumentExport} />
    </ComboButton>
  );
}
```

### Send Options

```jsx
function SendComboButton({ onSendNow, onSchedule, onSaveDraft }) {
  return (
    <ComboButton
      label="Send now"
      onClick={onSendNow}
      kind="primary"
    >
      <MenuItem
        label="Schedule send"
        onClick={onSchedule}
        renderIcon={Calendar}
        shortcut="⌘⇧S"
      />
      <MenuItem
        label="Save as draft"
        onClick={onSaveDraft}
        renderIcon={Save}
        shortcut="⌘S"
      />
    </ComboButton>
  );
}
```

### Delete Options

```jsx
function DeleteComboButton({ onDelete, onMoveToTrash, onArchive, isProtected }) {
  return (
    <ComboButton
      label="Delete"
      onClick={onDelete}
      kind="danger"
      disabled={isProtected}
    >
      <MenuItem
        label="Delete permanently"
        onClick={onDelete}
        kind="danger"
        renderIcon={TrashCan}
      />
      <MenuItem
        label="Move to trash"
        onClick={onMoveToTrash}
        renderIcon={Folder}
      />
      <MenuItem
        label="Archive"
        onClick={onArchive}
        renderIcon={Archive}
      />
    </ComboButton>
  );
}
```

### With State Management

```jsx
function StatefulComboButton() {
  const [selectedAction, setSelectedAction] = useState('save');

  const handlePrimaryAction = () => {
    switch (selectedAction) {
      case 'save':
        handleSave();
        break;
      case 'draft':
        handleSaveDraft();
        break;
      case 'template':
        handleSaveTemplate();
        break;
    }
  };

  const getPrimaryLabel = () => {
    const labels = {
      save: 'Save',
      draft: 'Save as draft',
      template: 'Save as template'
    };
    return labels[selectedAction];
  };

  return (
    <ComboButton label={getPrimaryLabel()} onClick={handlePrimaryAction}>
      <MenuItem
        label="Save"
        onClick={() => setSelectedAction('save')}
      />
      <MenuItem
        label="Save as draft"
        onClick={() => setSelectedAction('draft')}
      />
      <MenuItem
        label="Save as template"
        onClick={() => setSelectedAction('template')}
      />
    </ComboButton>
  );
}
```

## Design Considerations

### When to Use vs MenuButton

| Use ComboButton When | Use MenuButton When |
|---------------------|---------------------|
| One action is clearly primary | All actions have equal importance |
| Default action is used frequently | No clear default action |
| Actions are variants of same operation | Actions are different operations |
| Quick access to default matters | All options should be equally visible |

### Button Kinds

- **Primary**: For the main action in a view
- **Secondary**: For alternative primary actions
- **Tertiary**: For less prominent combo actions
- **Danger**: For destructive operations (delete, remove, etc.)
- **Ghost**: For minimal emphasis in dense layouts

## Related Components

- **MenuButton**: For dropdown menus without a primary action
- **Button**: For single actions
- **OverflowMenu**: For additional actions in compact spaces
- **Dropdown**: For selection from options, not triggering actions

## References

- [Carbon Design System - Button](https://www.carbondesignsystem.com/components/button/usage)
- [React Storybook - ComboButton](https://react.carbondesignsystem.com/?path=/docs/components-combobutton--overview)
- [WCAG 2.1 - Keyboard Navigation](https://www.w3.org/WAI/WCAG21/Understanding/keyboard.html)

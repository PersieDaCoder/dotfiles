# MultiSelect

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-multiselect--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/dropdown/usage#multiselect) | [Accessibility](https://www.carbondesignsystem.com/components/dropdown/accessibility)

## Overview

MultiSelect is a dropdown variant that enables selection of multiple items. The dropdown remains open during item selection, allowing users to select multiple options before closing.

## When to Use

- When users need to select multiple options from a list
- For filtering content by multiple criteria
- When displaying selected items as tags is helpful
- For settings or preferences with multiple choices

## When Not to Use

- When only one selection is needed (use Dropdown)
- For binary choices (use Checkbox)
- When the list is very short (use Checkbox group)
- For entering new values (use ComboBox with tags)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard MultiSelect with tag display |
| **Filterable** | Includes text filtering of options |
| **With Select All** | Option to select all items at once |
| **With Layer** | For use on different background layers |
| **With AI Label** | Enhanced with AI-related labeling |
| **Skeleton** | Loading state placeholder |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier |
| `items` | `array` | required | Array of options |
| `itemToString` | `function` | - | Converts items to display text |
| `itemToElement` | `function` | - | Custom element rendering |
| `selectedItems` | `array` | - | Controlled selected items |
| `initialSelectedItems` | `array` | - | Initial selections (uncontrolled) |
| `onChange` | `function` | - | Called with `{ selectedItems }` |
| `titleText` | `node` | - | Label text above multiselect |
| `label` | `string` | - | Placeholder text |
| `helperText` | `node` | - | Helper text below multiselect |
| `invalid` | `boolean` | `false` | Invalid state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `boolean` | `false` | Warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `boolean` | `false` | Disabled state |
| `readOnly` | `boolean` | `false` | Read-only state |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | MultiSelect size |
| `direction` | `'top' \| 'bottom'` | `'bottom'` | Menu direction |
| `selectionFeedback` | `'top' \| 'fixed' \| 'top-after-reopen'` | `'top-after-reopen'` | Selected items position |
| `sortItems` | `function` | - | Custom sort function |
| `compareItems` | `function` | - | Custom comparison function |
| `downshiftProps` | `object` | - | Props passed to Downshift |

---

## Code Examples

### Basic Usage

```jsx
import { MultiSelect } from '@carbon/react';

const items = [
  { id: 'red', text: 'Red' },
  { id: 'green', text: 'Green' },
  { id: 'blue', text: 'Blue' },
  { id: 'yellow', text: 'Yellow' },
];

<MultiSelect
  id="color-multiselect"
  titleText="Select colors"
  label="Choose..."
  items={items}
  itemToString={(item) => item?.text || ''}
  onChange={({ selectedItems }) => console.log(selectedItems)}
/>
```

### Filterable MultiSelect

```jsx
import { FilterableMultiSelect } from '@carbon/react';

<FilterableMultiSelect
  id="filterable-multiselect"
  titleText="Select team members"
  placeholder="Filter..."
  items={teamMembers}
  itemToString={(member) => member?.name || ''}
  onChange={({ selectedItems }) => setSelectedMembers(selectedItems)}
/>
```

### With Initial Selection

```jsx
<MultiSelect
  id="preset-multiselect"
  titleText="Categories"
  label="Select categories"
  items={categories}
  itemToString={(item) => item?.name || ''}
  initialSelectedItems={[categories[0], categories[2]]}
/>
```

### Select All Option

```jsx
const itemsWithSelectAll = [
  { id: 'select-all', text: 'Select All', isSelectAll: true },
  ...regularItems,
];

<MultiSelect
  id="select-all-multiselect"
  titleText="Options"
  items={itemsWithSelectAll}
  itemToString={(item) => item?.text || ''}
  onChange={({ selectedItems }) => {
    const selectAll = selectedItems.find(item => item.isSelectAll);
    if (selectAll) {
      // Handle select all logic
    }
  }}
/>
```

### Controlled MultiSelect

```jsx
import { MultiSelect } from '@carbon/react';
import { useState } from 'react';

function ControlledMultiSelect() {
  const [selected, setSelected] = useState([]);

  return (
    <>
      <MultiSelect
        id="controlled-multiselect"
        titleText="Tags"
        label="Select tags"
        items={tags}
        itemToString={(tag) => tag?.name || ''}
        selectedItems={selected}
        onChange={({ selectedItems }) => setSelected(selectedItems)}
      />
      <p>Selected: {selected.map(s => s.name).join(', ')}</p>
    </>
  );
}
```

### With Input Constraints (Filterable)

```jsx
<FilterableMultiSelect
  id="constrained-multiselect"
  titleText="Abbreviation"
  helperText="Enter abbreviation (5 characters max)"
  items={items}
  itemToString={(item) => item?.text || ''}
  inputProps={{ maxLength: 5 }}
/>
```

---

## Accessibility

- Always provide `titleText` for screen readers
- Use `helperText` to explain input constraints
- Selected items are announced by screen readers
- Built on Downshift for accessible behavior
- Keyboard: Arrow keys to navigate, Space to select, Escape to close

---

## Related Components

- [Dropdown](Dropdown.md) - For single selection
- [ComboBox](ComboBox.md) - Single selection with filtering
- [Checkbox](Checkbox.md) - For visible multi-selection

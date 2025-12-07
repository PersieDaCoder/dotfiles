# ComboBox

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-combobox--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/dropdown/usage) | [Accessibility](https://www.carbondesignsystem.com/components/dropdown/accessibility)

## Overview

ComboBox is a selection component that allows users to choose from a predefined list with the ability to filter options by typing. It combines text input with dropdown functionality, making it particularly useful for large option sets.

## When to Use

- When users need to select from a long list of options
- When filtering/searching within options improves UX
- When users might need to enter custom values
- For autocomplete functionality

## When Not to Use

- For small option sets (use Dropdown or RadioButton)
- When multiple selections are needed (use MultiSelect)
- When no filtering is needed (use Dropdown)
- For free-form text entry (use TextInput)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard ComboBox with filtering |
| **Allow Custom Value** | Users can enter values not in the list |
| **Autocomplete with Typeahead** | Inline autocomplete with suggestions |
| **With AI Label** | Enhanced with AI-related labeling |
| **With Layer** | For use on different background layers |
| **Skeleton** | Loading state placeholder |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier |
| `items` | `array` | required | Array of options |
| `itemToString` | `function` | - | Converts items to display text |
| `itemToElement` | `function` | - | Custom element rendering for items |
| `selectedItem` | `any` | - | Controlled selected value |
| `initialSelectedItem` | `any` | - | Initial selection (uncontrolled) |
| `onChange` | `function` | - | Called with `{ selectedItem, inputValue }` |
| `onInputChange` | `function` | - | Called when input text changes |
| `titleText` | `node` | - | Label text above combobox |
| `placeholder` | `string` | - | Placeholder text |
| `helperText` | `node` | - | Helper text below combobox |
| `invalid` | `boolean` | `false` | Invalid state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `boolean` | `false` | Warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `boolean` | `false` | Disabled state |
| `readOnly` | `boolean` | `false` | Read-only state |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | ComboBox size |
| `typeahead` | `boolean` | `false` | Enable typeahead (inline autocomplete) |
| `allowCustomValue` | `boolean` | `false` | Allow values not in the list |
| `shouldFilterItem` | `function` | - | Custom filtering function |
| `downshiftProps` | `object` | - | Props passed to Downshift |
| `inputProps` | `object` | - | Props passed to input element |

---

## Code Examples

### Basic Usage

```jsx
import { ComboBox } from '@carbon/react';

const items = [
  { id: 'apple', text: 'Apple' },
  { id: 'banana', text: 'Banana' },
  { id: 'cherry', text: 'Cherry' },
  { id: 'date', text: 'Date' },
];

<ComboBox
  id="fruit-combobox"
  titleText="Select a fruit"
  placeholder="Filter..."
  items={items}
  itemToString={(item) => item?.text || ''}
  onChange={({ selectedItem }) => console.log(selectedItem)}
/>
```

### With Typeahead

```jsx
<ComboBox
  id="typeahead-combobox"
  titleText="City"
  placeholder="Start typing..."
  items={cities}
  itemToString={(item) => item?.name || ''}
  typeahead
/>
```

### Allow Custom Values

```jsx
<ComboBox
  id="custom-value-combobox"
  titleText="Tag"
  placeholder="Select or create..."
  items={existingTags}
  itemToString={(item) => item?.name || ''}
  allowCustomValue
  onChange={({ selectedItem, inputValue }) => {
    if (selectedItem) {
      handleSelect(selectedItem);
    } else if (inputValue) {
      handleCreateNew(inputValue);
    }
  }}
/>
```

### Custom Filtering

```jsx
<ComboBox
  id="custom-filter-combobox"
  titleText="Search users"
  items={users}
  itemToString={(user) => user?.name || ''}
  shouldFilterItem={({ item, inputValue }) => {
    const search = inputValue.toLowerCase();
    return (
      item.name.toLowerCase().includes(search) ||
      item.email.toLowerCase().includes(search)
    );
  }}
/>
```

### Controlled ComboBox

```jsx
import { ComboBox } from '@carbon/react';
import { useState } from 'react';

function ControlledComboBox() {
  const [selected, setSelected] = useState(null);

  return (
    <ComboBox
      id="controlled-combobox"
      titleText="Country"
      items={countries}
      itemToString={(item) => item?.name || ''}
      selectedItem={selected}
      onChange={({ selectedItem }) => setSelected(selectedItem)}
    />
  );
}
```

### With Input Constraints

```jsx
<ComboBox
  id="constrained-combobox"
  titleText="Code"
  helperText="Maximum 5 characters"
  items={codes}
  itemToString={(item) => item?.code || ''}
  inputProps={{ maxLength: 5 }}
/>
```

---

## Accessibility

- Always provide `titleText` for screen readers
- Placeholders should provide format hints, not replace labels
- Use `invalidText` to explain validation errors
- Built on Downshift for accessible combobox behavior
- Keyboard: Arrow keys to navigate, Enter to select, Escape to close, Tab for typeahead completion

---

## Related Components

- [Dropdown](Dropdown.md) - Simple selection without filtering
- [MultiSelect](MultiSelect.md) - Multiple selection with filtering
- [Search](Search.md) - For search-only functionality

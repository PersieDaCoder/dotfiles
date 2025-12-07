# Dropdown

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-dropdown--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/dropdown/usage) | [Accessibility](https://www.carbondesignsystem.com/components/dropdown/accessibility)

## Overview

The Dropdown component presents a list of options from which users can select one. Selected options can represent form values or filter/sort existing content.

## When to Use

- When users need to select a single option from a list
- For form fields with predefined options
- When the list of options is too long for radio buttons
- For filtering or sorting content

## When Not to Use

- When multiple selections are needed (use MultiSelect)
- For searching/filtering with text input (use ComboBox)
- When there are fewer than 5 options (consider RadioButton)
- For navigation menus (use Menu components)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard dropdown with label above |
| **Inline** | Compact version for inline placement |
| **With Layer** | For use on different background layers |
| **With AI Label** | Enhanced with AI-related labeling |
| **Skeleton** | Loading state placeholder |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier |
| `items` | `array` | required | Array of options (strings or objects) |
| `itemToString` | `function` | - | Converts item objects to display text |
| `itemToElement` | `function` | - | Wraps items in custom elements |
| `selectedItem` | `any` | - | Controlled selected value |
| `initialSelectedItem` | `any` | - | Initial selection (uncontrolled) |
| `onChange` | `function` | - | Called with `{ selectedItem }` on change |
| `titleText` | `node` | - | Label text above dropdown |
| `label` | `string` | - | Placeholder text in the field |
| `helperText` | `node` | - | Helper text below dropdown |
| `invalid` | `boolean` | `false` | Invalid state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `boolean` | `false` | Warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `boolean` | `false` | Disabled state |
| `readOnly` | `boolean` | `false` | Read-only state |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Dropdown size |
| `type` | `'default' \| 'inline'` | `'default'` | Display type |
| `direction` | `'top' \| 'bottom'` | `'bottom'` | Menu opening direction |
| `downshiftProps` | `object` | - | Props passed to Downshift |

---

## Code Examples

### Basic Usage

```jsx
import { Dropdown } from '@carbon/react';

const items = [
  { id: 'option-0', text: 'Option 0' },
  { id: 'option-1', text: 'Option 1' },
  { id: 'option-2', text: 'Option 2' },
];

<Dropdown
  id="dropdown-basic"
  titleText="Dropdown label"
  label="Choose an option"
  items={items}
  itemToString={(item) => item?.text || ''}
  onChange={({ selectedItem }) => console.log(selectedItem)}
/>
```

### Controlled Dropdown

```jsx
import { Dropdown } from '@carbon/react';
import { useState } from 'react';

function ControlledDropdown() {
  const [selected, setSelected] = useState(null);

  const items = [
    { id: '1', text: 'Red' },
    { id: '2', text: 'Green' },
    { id: '3', text: 'Blue' },
  ];

  return (
    <Dropdown
      id="controlled-dropdown"
      titleText="Select a color"
      label="Choose..."
      items={items}
      itemToString={(item) => item?.text || ''}
      selectedItem={selected}
      onChange={({ selectedItem }) => setSelected(selectedItem)}
    />
  );
}
```

### Inline Dropdown

```jsx
<Dropdown
  id="inline-dropdown"
  type="inline"
  titleText="Sort by"
  label="Select"
  items={['Name', 'Date', 'Size']}
/>
```

### With Validation

```jsx
<Dropdown
  id="validation-dropdown"
  titleText="Category"
  label="Select a category"
  items={categories}
  itemToString={(item) => item?.name || ''}
  invalid={!selectedCategory}
  invalidText="Please select a category"
/>
```

### Custom Item Rendering

```jsx
<Dropdown
  id="custom-dropdown"
  titleText="Select user"
  label="Choose..."
  items={users}
  itemToString={(user) => user?.name || ''}
  itemToElement={(user) => (
    <div className="user-item">
      <img src={user.avatar} alt="" />
      <span>{user.name}</span>
    </div>
  )}
/>
```

---

## Accessibility

- Always provide `titleText` for screen reader users
- Use `invalidText` to explain validation errors
- The component manages ARIA attributes automatically
- Keyboard navigation: Arrow keys to navigate, Enter to select
- Built on Downshift for accessible dropdown behavior

---

## Related Components

- [ComboBox](ComboBox.md) - Dropdown with text filtering
- [MultiSelect](MultiSelect.md) - For multiple selections
- [Select](Select.md) - Native HTML select wrapper
- [RadioButton](RadioButton.md) - For small option sets

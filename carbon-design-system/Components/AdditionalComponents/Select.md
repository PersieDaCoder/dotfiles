# Select

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-select--overview)

## Overview

The Select component allows users to choose one option from a list. It is a native HTML select element styled to match Carbon Design System standards.

## When to use

- When users need to choose one option from a list of 5-15 items
- When screen space is limited
- When you need a native select experience for better mobile support
- For simple, straightforward selection tasks

## When not to use

- When users need to select multiple items (use MultiSelect instead)
- When you need search/filter functionality (use Dropdown or ComboBox)
- When you have fewer than 5 options (consider RadioButton)
- When you have more than 15 options (consider ComboBox with search)

## Usage

### Basic Example

```jsx
import { Select, SelectItem } from '@carbon/react';

function MyComponent() {
  return (
    <Select
      id="select-1"
      defaultValue="placeholder-item"
      labelText="Select an option"
      helperText="Optional helper text"
    >
      <SelectItem
        value="placeholder-item"
        text="Choose an option"
      />
      <SelectItem
        value="option-1"
        text="Option 1"
      />
      <SelectItem
        value="option-2"
        text="Option 2"
      />
      <SelectItem
        value="option-3"
        text="Option 3"
      />
    </Select>
  );
}
```

### Invalid State

```jsx
<Select
  id="select-2"
  labelText="Select an option"
  invalid
  invalidText="This field is required"
>
  <SelectItem value="" text="Choose an option" />
  <SelectItem value="option-1" text="Option 1" />
</Select>
```

### Warning State

```jsx
<Select
  id="select-3"
  labelText="Select an option"
  warn
  warnText="Please review your selection"
>
  <SelectItem value="" text="Choose an option" />
  <SelectItem value="option-1" text="Option 1" />
</Select>
```

### Disabled State

```jsx
<Select
  id="select-4"
  labelText="Select an option"
  disabled
>
  <SelectItem value="" text="Choose an option" />
  <SelectItem value="option-1" text="Option 1" />
</Select>
```

### Inline Select

```jsx
<Select
  id="select-5"
  labelText="Inline select"
  inline
>
  <SelectItem value="option-1" text="Option 1" />
  <SelectItem value="option-2" text="Option 2" />
</Select>
```

### Sizes

```jsx
{/* Small */}
<Select id="select-sm" labelText="Small" size="sm">
  <SelectItem value="option-1" text="Option 1" />
</Select>

{/* Medium (default) */}
<Select id="select-md" labelText="Medium" size="md">
  <SelectItem value="option-1" text="Option 1" />
</Select>

{/* Large */}
<Select id="select-lg" labelText="Large" size="lg">
  <SelectItem value="option-1" text="Option 1" />
</Select>
```

## Props

### Select

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | Provide the contents of your Select (SelectItem components) |
| `className` | `string` | - | Custom CSS class name |
| `defaultValue` | `string \| number` | - | Specify the default value of the Select |
| `disabled` | `bool` | `false` | Specify whether the control is disabled |
| `helperText` | `node` | - | Provide text that is used alongside the control label for additional help |
| `hideLabel` | `bool` | `false` | Specify whether the label should be hidden |
| `id` | `string` | - | **Required.** Specify a custom id for the Select element |
| `inline` | `bool` | `false` | Specify whether the Select should be displayed inline |
| `invalid` | `bool` | `false` | Specify if the currently selected value is invalid |
| `invalidText` | `node` | - | Message which is displayed if the value is invalid |
| `labelText` | `node` | - | Provide label text to be read by screen readers when interacting with the control |
| `light` | `bool` | `false` | **Deprecated.** Specify whether the control should use the light variant |
| `noLabel` | `bool` | `false` | **Deprecated.** Use `hideLabel` instead |
| `onChange` | `func` | - | Callback function that is called each time the value of the Select changes |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the Select |
| `value` | `string \| number` | - | Specify the value of the Select (controlled component) |
| `warn` | `bool` | `false` | Specify whether the control should display a warning |
| `warnText` | `node` | - | Message which is displayed when the control displays a warning |

### SelectItem

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Custom CSS class name |
| `disabled` | `bool` | `false` | Specify whether the SelectItem should be disabled |
| `hidden` | `bool` | `false` | Specify whether the SelectItem should be hidden |
| `text` | `string` | - | **Required.** Provide the text for your SelectItem |
| `value` | `string \| number` | - | **Required.** Specify the value of your SelectItem |

## Accessibility

- The Select component uses a native HTML `<select>` element for better accessibility and mobile support
- Always provide a `labelText` prop for screen readers
- Use `helperText` to provide additional context
- Error messages in `invalidText` are automatically announced to screen readers
- The component supports keyboard navigation (Arrow keys, Enter, Escape)
- Use `id` prop to ensure proper label association

## Related Components

- **Dropdown**: Use when you need a more customizable select with additional features
- **ComboBox**: Use when users need to search/filter through many options
- **MultiSelect**: Use when users need to select multiple options
- **RadioButton**: Use for 2-5 mutually exclusive options that should always be visible

## Available Variants

- Default
- Inline
- With Helper Text
- Invalid State
- Warning State
- Disabled State
- Skeleton

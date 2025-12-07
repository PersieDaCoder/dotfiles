# TextInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-textinput--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/text-input/usage) | [Accessibility](https://www.carbondesignsystem.com/components/text-input/accessibility)

## Overview

Text inputs allow users to enter free-form text data. The field type should match the expected content length, with the default variant designed for short, single-line entries.

## When to Use

- Use for short, single-line text entry (names, emails, etc.)
- When users need to input free-form data
- For form fields requiring validation feedback

## When Not to Use

- For multi-line text entry (use TextArea instead)
- For password entry (use PasswordInput instead)
- When selecting from predefined options (use Dropdown or Select)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard text input for brief, one-line content |
| **Fluid** | A responsive variant that spans full width |
| **Read Only** | Display-only version preventing user edits |
| **Skeleton** | Loading state placeholder |
| **AI Label** | Enhanced with AI-related labeling |
| **With Layer** | Layered presentation variant |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier for the input |
| `labelText` | `node` | required | Label text displayed above the input |
| `value` | `string` | - | Controlled input value |
| `defaultValue` | `string` | - | Initial uncontrolled value |
| `placeholder` | `string` | - | Placeholder text when empty |
| `helperText` | `node` | - | Helper text below the input |
| `invalid` | `boolean` | `false` | Whether the input is in invalid state |
| `invalidText` | `node` | - | Error message when invalid |
| `warn` | `boolean` | `false` | Whether the input is in warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `boolean` | `false` | Whether the input is disabled |
| `readOnly` | `boolean` | `false` | Whether the input is read-only |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Input size variant |
| `type` | `string` | `'text'` | HTML input type |
| `hideLabel` | `boolean` | `false` | Visually hide the label |
| `inline` | `boolean` | `false` | Display label inline with input |
| `onChange` | `function` | - | Callback when value changes |
| `onBlur` | `function` | - | Callback when input loses focus |

---

## Code Examples

### Basic Usage

```jsx
import { TextInput } from '@carbon/react';

<TextInput
  id="username"
  labelText="Username"
  placeholder="Enter your username"
  helperText="This will be your display name"
/>
```

### With Validation

```jsx
import { TextInput } from '@carbon/react';
import { useState } from 'react';

function ValidatedInput() {
  const [value, setValue] = useState('');
  const [invalid, setInvalid] = useState(false);

  const handleChange = (e) => {
    const newValue = e.target.value;
    setValue(newValue);
    setInvalid(newValue.length < 3);
  };

  return (
    <TextInput
      id="validated-input"
      labelText="Username"
      value={value}
      onChange={handleChange}
      invalid={invalid}
      invalidText="Username must be at least 3 characters"
    />
  );
}
```

### Different Sizes

```jsx
<TextInput id="small" labelText="Small" size="sm" />
<TextInput id="medium" labelText="Medium" size="md" />
<TextInput id="large" labelText="Large" size="lg" />
```

### With Warning State

```jsx
<TextInput
  id="warning-input"
  labelText="Email"
  warn={true}
  warnText="This email is already in use"
/>
```

### Read Only

```jsx
<TextInput
  id="readonly"
  labelText="Account ID"
  value="ACC-12345"
  readOnly
/>
```

---

## Accessibility

- Always provide a visible `labelText` for screen readers
- Use `invalidText` to explain validation errors
- Ensure sufficient color contrast for all states
- The component handles ARIA attributes automatically
- Focus states are managed for keyboard navigation

---

## Related Components

- [PasswordInput](PasswordInput.md) - For password entry with visibility toggle
- [TextArea](TextArea.md) - For multi-line text input
- [NumberInput](NumberInput.md) - For numeric input with steppers
- [Search](Search.md) - For search-specific input

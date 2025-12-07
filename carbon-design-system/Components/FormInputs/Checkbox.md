# Checkbox

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-checkbox--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Checkbox) | [Usage guidelines](https://www.carbondesignsystem.com/components/checkbox/usage) | [Accessibility](https://www.carbondesignsystem.com/components/checkbox/accessibility)

## Overview

Checkboxes are used for multiple choices, not for mutually exclusive choices. Each checkbox works independently from other checkboxes in the list, therefore checking an additional box does not affect any other selections.

## When to use

- **Multiple selections**: When users need to select one or more options from a list
- **Binary choices**: When you need to capture a single yes/no or on/off choice
- **Enabling/disabling features**: When users need to toggle features or settings
- **Agreeing to terms**: When users need to acknowledge or agree to something

## When not to use

- **Mutually exclusive options**: Use radio buttons when only one option can be selected
- **Single toggle**: Use toggle switch for immediate state changes (on/off)
- **More than 7 options**: Consider using a multiselect dropdown for better space efficiency
- **Immediate action required**: Use toggle if the change should take effect immediately

## Live Demo

```jsx
import { Checkbox, CheckboxGroup } from '@carbon/react';

function Example() {
  return (
    <CheckboxGroup legendText="Select options">
      <Checkbox id="checkbox-1" labelText="Option 1" />
      <Checkbox id="checkbox-2" labelText="Option 2" />
      <Checkbox id="checkbox-3" labelText="Option 3" />
    </CheckboxGroup>
  );
}
```

## Variants

### Default
```jsx
<Checkbox
  id="checkbox-default"
  labelText="Default checkbox"
/>
```

### Checked
```jsx
<Checkbox
  id="checkbox-checked"
  labelText="Checked by default"
  defaultChecked
/>
```

### Disabled
```jsx
<Checkbox
  id="checkbox-disabled"
  labelText="Disabled checkbox"
  disabled
/>
```

### Indeterminate
```jsx
<Checkbox
  id="checkbox-indeterminate"
  labelText="Indeterminate state"
  indeterminate
/>
```

### With helper text
```jsx
<Checkbox
  id="checkbox-helper"
  labelText="Accept terms"
  helperText="By checking this box, you agree to our terms and conditions"
/>
```

### Invalid state
```jsx
<Checkbox
  id="checkbox-invalid"
  labelText="Required option"
  invalid
  invalidText="This field is required"
/>
```

### Warning state
```jsx
<Checkbox
  id="checkbox-warn"
  labelText="Optional setting"
  warn
  warnText="This setting may affect performance"
/>
```

### Horizontal layout
```jsx
<CheckboxGroup legendText="Options" orientation="horizontal">
  <Checkbox id="h1" labelText="Option 1" />
  <Checkbox id="h2" labelText="Option 2" />
  <Checkbox id="h3" labelText="Option 3" />
</CheckboxGroup>
```

### With AI Label
```jsx
import { Checkbox, AILabel } from '@carbon/react';

<Checkbox
  id="checkbox-ai"
  labelText={
    <>
      AI-powered feature
      <AILabel size="sm" />
    </>
  }
/>
```

### Skeleton state
```jsx
import { CheckboxSkeleton } from '@carbon/react';

<CheckboxSkeleton />
```

## Controlled Component

```jsx
import { useState } from 'react';
import { Checkbox, CheckboxGroup } from '@carbon/react';

function ControlledExample() {
  const [checked, setChecked] = useState({
    option1: false,
    option2: true,
    option3: false
  });

  const handleChange = (id, value) => {
    setChecked(prev => ({
      ...prev,
      [id]: value
    }));
  };

  return (
    <CheckboxGroup legendText="Select features to enable">
      <Checkbox
        id="option1"
        labelText="Email notifications"
        checked={checked.option1}
        onChange={(e, { checked, id }) => handleChange(id, checked)}
      />
      <Checkbox
        id="option2"
        labelText="Push notifications"
        checked={checked.option2}
        onChange={(e, { checked, id }) => handleChange(id, checked)}
      />
      <Checkbox
        id="option3"
        labelText="SMS notifications"
        checked={checked.option3}
        onChange={(e, { checked, id }) => handleChange(id, checked)}
      />
    </CheckboxGroup>
  );
}
```

## Select All Pattern

```jsx
import { useState } from 'react';
import { Checkbox, CheckboxGroup } from '@carbon/react';

function SelectAllExample() {
  const [items, setItems] = useState({
    item1: false,
    item2: false,
    item3: false
  });

  const allChecked = Object.values(items).every(v => v);
  const someChecked = Object.values(items).some(v => v) && !allChecked;

  const handleSelectAll = (checked) => {
    setItems({
      item1: checked,
      item2: checked,
      item3: checked
    });
  };

  const handleChange = (id, checked) => {
    setItems(prev => ({ ...prev, [id]: checked }));
  };

  return (
    <>
      <Checkbox
        id="select-all"
        labelText="Select all"
        checked={allChecked}
        indeterminate={someChecked}
        onChange={(e, { checked }) => handleSelectAll(checked)}
      />
      <CheckboxGroup legendText="Items">
        <Checkbox
          id="item1"
          labelText="Item 1"
          checked={items.item1}
          onChange={(e, { checked, id }) => handleChange(id, checked)}
        />
        <Checkbox
          id="item2"
          labelText="Item 2"
          checked={items.item2}
          onChange={(e, { checked, id }) => handleChange(id, checked)}
        />
        <Checkbox
          id="item3"
          labelText="Item 3"
          checked={items.item3}
          onChange={(e, { checked, id }) => handleChange(id, checked)}
        />
      </CheckboxGroup>
    </>
  );
}
```

## Component API

### Checkbox

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `checked` | `boolean` | - | Specify whether the checkbox is checked (controlled) |
| `defaultChecked` | `boolean` | `false` | Specify whether the checkbox should be checked by default (uncontrolled) |
| `disabled` | `boolean` | `false` | Specify whether the checkbox should be disabled |
| `hideLabel` | `boolean` | `false` | Specify whether the label should be hidden |
| `id` | `string` | **Required** | Provide an id for the checkbox input |
| `indeterminate` | `boolean` | `false` | Specify whether the checkbox should be in an indeterminate state |
| `invalid` | `boolean` | `false` | Specify whether the checkbox is in an invalid state |
| `invalidText` | `node` | - | Provide the text for the invalid state |
| `labelText` | `node` | **Required** | Provide label text for the checkbox |
| `helperText` | `node` | - | Provide helper text for the checkbox |
| `onChange` | `func` | `() => {}` | Provide an optional function to be called when checkbox is clicked. Signature: `(event, { checked, id }) => void` |
| `title` | `string` | - | Specify a title for the `<label>` node |
| `warn` | `boolean` | `false` | Specify whether the checkbox is in a warning state |
| `warnText` | `node` | - | Provide the text for the warning state |

### CheckboxGroup

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | Provide child checkboxes to be rendered in the group |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `disabled` | `boolean` | `false` | Specify whether all checkboxes in the group should be disabled |
| `legendId` | `string` | - | Specify a custom id for the `<legend>` element |
| `legendText` | `node` | **Required** | Provide the text for the `<legend>` element |
| `orientation` | `'horizontal' \| 'vertical'` | `'vertical'` | Specify the orientation of the group |
| `readOnly` | `boolean` | `false` | Whether the CheckboxGroup should be read-only |

### CheckboxSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to the checkbox
- **Space**: Toggle the checkbox state
- **Enter**: Submit form if checkbox is focused

### Screen readers
- Checkbox state (checked/unchecked/indeterminate) is announced
- Invalid and warning states are announced
- Helper text is associated via `aria-describedby`
- Group legend provides context for the set of checkboxes

### Best practices
- Always provide meaningful `labelText`
- Use `legendText` for `CheckboxGroup` to provide context
- Ensure sufficient color contrast (4.5:1 for text)
- Don't rely solely on color to indicate state
- Use `invalidText` or `warnText` to provide clear error messages
- Keep labels short and descriptive
- Use helper text for additional context, not critical information

## Related components

- **[Radio Button](RadioButton.md)**: For mutually exclusive options
- **[Toggle](Toggle.md)**: For immediate on/off actions
- **[MultiSelect](MultiSelect.md)**: For selecting multiple options from a large list
- **[Form](https://www.carbondesignsystem.com/components/form/usage)**: For complete form implementations

## References

- [Carbon Design System - Checkbox Usage](https://www.carbondesignsystem.com/components/checkbox/usage)
- [Carbon Design System - Checkbox Accessibility](https://www.carbondesignsystem.com/components/checkbox/accessibility)
- [Carbon React Storybook - Checkbox](https://react.carbondesignsystem.com/?path=/docs/components-checkbox--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Checkbox)

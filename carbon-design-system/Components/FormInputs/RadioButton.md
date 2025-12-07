# Radio Button

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-radiobutton--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/RadioButton) | [Usage guidelines](https://www.carbondesignsystem.com/components/radio-button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/radio-button/accessibility)

## Overview

Radio buttons are used when a list of two or more options are mutually exclusive, meaning the user must select only one option. They present a group of selectable options in a nice way.

## When to use

- **Mutually exclusive options**: When users must choose only one option from a set
- **Visible options**: When you want all options to be visible at once (typically 2-7 options)
- **Default selection**: When you want to emphasize a recommended or default option
- **Clear alternatives**: When options are distinct and users need to see all choices

## When not to use

- **Multiple selections**: Use checkboxes when users can select multiple options
- **Many options**: Use a dropdown or select when you have more than 7 options
- **Single on/off**: Use a checkbox or toggle for a single yes/no choice
- **Immediate action**: Use a toggle if the change should take effect immediately

## Live Demo

```jsx
import { RadioButton, RadioButtonGroup } from '@carbon/react';

function Example() {
  return (
    <RadioButtonGroup
      legendText="Choose an option"
      name="radio-group"
      defaultSelected="option-1"
    >
      <RadioButton
        id="radio-1"
        labelText="Option 1"
        value="option-1"
      />
      <RadioButton
        id="radio-2"
        labelText="Option 2"
        value="option-2"
      />
      <RadioButton
        id="radio-3"
        labelText="Option 3"
        value="option-3"
      />
    </RadioButtonGroup>
  );
}
```

## Variants

### Default (Vertical)
```jsx
<RadioButtonGroup
  legendText="Select size"
  name="size"
  defaultSelected="medium"
>
  <RadioButton id="small" labelText="Small" value="small" />
  <RadioButton id="medium" labelText="Medium" value="medium" />
  <RadioButton id="large" labelText="Large" value="large" />
</RadioButtonGroup>
```

### Horizontal layout
```jsx
<RadioButtonGroup
  legendText="Select size"
  name="size"
  orientation="horizontal"
  defaultSelected="medium"
>
  <RadioButton id="h-small" labelText="Small" value="small" />
  <RadioButton id="h-medium" labelText="Medium" value="medium" />
  <RadioButton id="h-large" labelText="Large" value="large" />
</RadioButtonGroup>
```

### Disabled group
```jsx
<RadioButtonGroup
  legendText="Disabled options"
  name="disabled-group"
  disabled
  defaultSelected="option-1"
>
  <RadioButton id="d1" labelText="Option 1" value="option-1" />
  <RadioButton id="d2" labelText="Option 2" value="option-2" />
</RadioButtonGroup>
```

### Individual disabled option
```jsx
<RadioButtonGroup
  legendText="Select option"
  name="mixed"
  defaultSelected="option-1"
>
  <RadioButton id="m1" labelText="Option 1" value="option-1" />
  <RadioButton id="m2" labelText="Option 2 (disabled)" value="option-2" disabled />
  <RadioButton id="m3" labelText="Option 3" value="option-3" />
</RadioButtonGroup>
```

### Invalid state
```jsx
<RadioButtonGroup
  legendText="Required selection"
  name="required"
  invalid
  invalidText="Please select an option"
>
  <RadioButton id="r1" labelText="Option 1" value="option-1" />
  <RadioButton id="r2" labelText="Option 2" value="option-2" />
</RadioButtonGroup>
```

### Warning state
```jsx
<RadioButtonGroup
  legendText="Important choice"
  name="warning"
  warn
  warnText="This choice cannot be changed later"
  defaultSelected="permanent"
>
  <RadioButton id="w1" labelText="Temporary" value="temporary" />
  <RadioButton id="w2" labelText="Permanent" value="permanent" />
</RadioButtonGroup>
```

### With helper text
```jsx
<RadioButtonGroup
  legendText="Payment method"
  name="payment"
  helperText="Your payment information is encrypted and secure"
  defaultSelected="credit"
>
  <RadioButton id="credit" labelText="Credit Card" value="credit" />
  <RadioButton id="paypal" labelText="PayPal" value="paypal" />
  <RadioButton id="bank" labelText="Bank Transfer" value="bank" />
</RadioButtonGroup>
```

### With AI Label
```jsx
import { RadioButton, RadioButtonGroup, AILabel } from '@carbon/react';

<RadioButtonGroup
  legendText={
    <>
      AI-suggested option
      <AILabel size="sm" />
    </>
  }
  name="ai-group"
>
  <RadioButton id="ai1" labelText="Recommended" value="recommended" />
  <RadioButton id="ai2" labelText="Alternative" value="alternative" />
</RadioButtonGroup>
```

### Skeleton state
```jsx
import { RadioButtonSkeleton } from '@carbon/react';

<RadioButtonSkeleton />
```

## Controlled Component

```jsx
import { useState } from 'react';
import { RadioButton, RadioButtonGroup } from '@carbon/react';

function ControlledExample() {
  const [selected, setSelected] = useState('standard');

  const handleChange = (value) => {
    setSelected(value);
    console.log('Selected:', value);
  };

  return (
    <div>
      <RadioButtonGroup
        legendText="Shipping method"
        name="shipping"
        valueSelected={selected}
        onChange={handleChange}
      >
        <RadioButton
          id="standard"
          labelText="Standard (5-7 days) - Free"
          value="standard"
        />
        <RadioButton
          id="express"
          labelText="Express (2-3 days) - $9.99"
          value="express"
        />
        <RadioButton
          id="overnight"
          labelText="Overnight - $24.99"
          value="overnight"
        />
      </RadioButtonGroup>

      <p>Selected shipping: {selected}</p>
    </div>
  );
}
```

## Form Integration

```jsx
import { useState } from 'react';
import { RadioButton, RadioButtonGroup, Button, Form } from '@carbon/react';

function FormExample() {
  const [formData, setFormData] = useState({
    subscription: 'monthly'
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Form submitted:', formData);
  };

  return (
    <Form onSubmit={handleSubmit}>
      <RadioButtonGroup
        legendText="Select subscription plan"
        name="subscription"
        valueSelected={formData.subscription}
        onChange={(value) => setFormData({ ...formData, subscription: value })}
      >
        <RadioButton
          id="monthly"
          labelText="Monthly - $9.99/month"
          value="monthly"
        />
        <RadioButton
          id="yearly"
          labelText="Yearly - $99/year (Save 17%)"
          value="yearly"
        />
        <RadioButton
          id="lifetime"
          labelText="Lifetime - $299 (One-time payment)"
          value="lifetime"
        />
      </RadioButtonGroup>

      <Button type="submit" kind="primary">
        Continue to payment
      </Button>
    </Form>
  );
}
```

## Component API

### RadioButtonGroup

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | Provide child RadioButton components |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `defaultSelected` | `string` | - | Specify the value of the RadioButton that should be selected by default (uncontrolled) |
| `disabled` | `boolean` | `false` | Specify whether the group is disabled |
| `helperText` | `node` | - | Provide helper text for additional guidance |
| `invalid` | `boolean` | `false` | Specify whether the group is in an invalid state |
| `invalidText` | `node` | - | Provide the text for the invalid state |
| `labelPosition` | `'left' \| 'right'` | `'right'` | Specify the label position |
| `legendId` | `string` | - | Provide a custom id for the `<legend>` element |
| `legendText` | `node` | **Required** | Provide the text for the `<legend>` element |
| `name` | `string` | **Required** | Specify the name of the radio button group (required for form submission) |
| `onChange` | `func` | - | Provide an optional function to be called when selection changes. Signature: `(value, name, event) => void` |
| `orientation` | `'horizontal' \| 'vertical'` | `'vertical'` | Specify the orientation of the group |
| `readOnly` | `boolean` | `false` | Whether the RadioButtonGroup should be read-only |
| `valueSelected` | `string` | - | Specify the value of the currently selected RadioButton (controlled) |
| `warn` | `boolean` | `false` | Specify whether the group is in a warning state |
| `warnText` | `node` | - | Provide the text for the warning state |

### RadioButton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `checked` | `boolean` | `false` | Specify whether the RadioButton is checked (typically managed by RadioButtonGroup) |
| `className` | `string` | - | Specify an optional className to be applied to the wrapper |
| `disabled` | `boolean` | `false` | Specify whether the RadioButton should be disabled |
| `hideLabel` | `boolean` | `false` | Specify whether the label should be hidden |
| `id` | `string` | **Required** | Provide an id for the RadioButton |
| `labelText` | `node` | **Required** | Provide label text for the RadioButton |
| `name` | `string` | - | Provide a name for the RadioButton (typically inherited from RadioButtonGroup) |
| `onChange` | `func` | - | Provide an optional function to be called when the RadioButton is clicked |
| `value` | `string` | **Required** | Specify the value of the RadioButton |

### RadioButtonSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus between radio button groups (not individual buttons)
- **Arrow keys**: Navigate between radio buttons within a group
  - **Up/Left**: Select previous option
  - **Down/Right**: Select next option
- **Space**: Select the focused radio button

### Screen readers
- Selected state is announced for each radio button
- Legend text provides context for the group
- Invalid and warning states are announced
- Helper text is associated via `aria-describedby`

### Best practices
- Always provide meaningful `legendText` to describe the group
- Use `labelText` to clearly identify each option
- Group related radio buttons using `RadioButtonGroup`
- Ensure radio buttons have a consistent name within a group
- Provide clear, concise labels
- Use `helperText` for additional context
- Use `invalidText` or `warnText` for error messages
- Ensure sufficient color contrast (4.5:1 for text)
- Don't rely solely on color to indicate state
- Keep the number of options between 2-7 when possible

### ARIA attributes
- `role="radiogroup"` on the container
- `aria-labelledby` references the legend
- `aria-describedby` for helper/error text
- `aria-invalid` when in invalid state

## Related components

- **[Checkbox](Checkbox.md)**: For multiple selections
- **[Toggle](Toggle.md)**: For immediate on/off actions
- **[Dropdown](Dropdown.md)**: For selecting from many options
- **[Select](Select.md)**: Native select element alternative
- **[Form](https://www.carbondesignsystem.com/components/form/usage)**: For complete form implementations

## References

- [Carbon Design System - Radio Button Usage](https://www.carbondesignsystem.com/components/radio-button/usage)
- [Carbon Design System - Radio Button Accessibility](https://www.carbondesignsystem.com/components/radio-button/accessibility)
- [Carbon React Storybook - Radio Button](https://react.carbondesignsystem.com/?path=/docs/components-radiobutton--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/RadioButton)

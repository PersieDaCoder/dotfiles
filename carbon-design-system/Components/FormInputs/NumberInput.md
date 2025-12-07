# NumberInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-numberinput--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/number-input/usage) | [Accessibility](https://www.carbondesignsystem.com/components/number-input/accessibility)

## Overview

Number inputs are specialized input fields for entering numeric values with built-in stepper buttons for incrementing and decrementing. They provide precise number entry with optional formatting, bounds validation, and locale support for consistent numeric data collection.

## When to Use

- **Numeric values**: Quantities, prices, percentages, or any numeric data entry
- **Bounded numbers**: When values must stay within a specific range (min/max)
- **Incremental adjustments**: Values that benefit from step-by-step increases/decreases
- **Formatted numbers**: Currency, percentages, or locale-specific number formats
- **Precise input**: When accuracy matters and manual typing might introduce errors

## When Not to Use

- **Large ranges**: Slider is better for selecting from large numeric ranges
- **Date/time**: Use DatePicker or TimePicker for temporal values
- **Phone numbers**: Use TextInput with tel type (not arithmetic numbers)
- **Zip codes**: Use TextInput (these are categorical, not arithmetic)
- **Credit cards**: Use TextInput with specific formatting

## Component API

### Basic Usage

```jsx
import { NumberInput } from '@carbon/react';

<NumberInput
  id="quantity"
  label="Quantity"
  min={0}
  max={100}
  value={1}
  step={1}
/>
```

### With Formatting (Currency)

```jsx
<NumberInput
  id="price"
  label="Price"
  min={0}
  step={0.01}
  value={29.99}
  locale="en-US"
  formatOptions={{
    style: 'currency',
    currency: 'USD'
  }}
/>
```

### With Percentage

```jsx
<NumberInput
  id="discount"
  label="Discount"
  min={0}
  max={100}
  step={5}
  value={10}
  locale="en-US"
  formatOptions={{
    style: 'percent',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }}
/>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier for the input |
| `label` | `string` | required | Label text displayed above the input |
| `value` | `number` | - | Controlled input value |
| `defaultValue` | `number` | - | Uncontrolled default value |
| `min` | `number` | - | Minimum allowed value |
| `max` | `number` | - | Maximum allowed value |
| `step` | `number` | `1` | Increment/decrement step size |
| `stepStartValue` | `number` | - | Starting value when incrementing from empty |
| `size` | `string` | `"md"` | Size: `"sm"`, `"md"`, `"lg"` |
| `hideSteppers` | `bool` | `false` | Hide increment/decrement buttons |
| `allowEmpty` | `bool` | `false` | Allow empty value |
| `disabled` | `bool` | `false` | Disable the input |
| `readOnly` | `bool` | `false` | Make input read-only |
| `invalid` | `bool` | `false` | Show error state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `bool` | `false` | Show warning state |
| `warnText` | `node` | - | Warning message text |
| `helperText` | `node` | - | Helper text below the input |
| `locale` | `string` | `"en"` | Locale for number formatting |
| `formatOptions` | `object` | - | Intl.NumberFormat options |
| `translateWithId` | `func` | - | Translation function for labels |
| `isMobile` | `bool` | `false` | Enable mobile-specific behavior |
| `onChange` | `func` | - | Change handler: `(event, { value, direction })` |
| `onBlur` | `func` | - | Blur event handler |
| `onClick` | `func` | - | Click event handler |
| `className` | `string` | - | Additional CSS classes |

## Behavior

### Stepper Logic

- **Incrementing**: Starts at `min` value (or `stepStartValue` if empty)
- **Decrementing**: Starts at `max` value
- **No min/max**: Defaults to 0 when steppers are clicked on empty field
- **Step intervals**: Value changes by `step` amount with each click
- **Bounds enforcement**: Automatically constrains to `min`/`max` range

### Text Type Mode

When using `type="text"` (instead of default `type="number"`):
- Values parse and format on blur based on locale
- `onChange` fires only on blur (not every keystroke)
- Wheel/scroll events don't affect value
- Must configure `inputMode` and `pattern` for mobile keyboards

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from the input |
| `Arrow Up` | Increments value by step |
| `Arrow Down` | Decrements value by step |
| `Page Up` | Increments by larger amount |
| `Page Down` | Decrements by larger amount |
| `Home` | Sets to minimum value |
| `End` | Sets to maximum value |

### Screen Reader Support

- Input has proper label association
- Stepper buttons have descriptive labels ("Increment number", "Decrement number")
- Current value, min, max announced
- Invalid/warning states communicated
- Helper text linked via `aria-describedby`

### Best Practices

- Always provide clear `label`
- Specify `min`, `max`, and `step` for clarity
- Use appropriate `step` values (0.01 for currency, 1 for quantities)
- Provide `helperText` for expected format or range
- Don't hide steppers unless there's a strong reason
- Ensure color contrast meets WCAG standards

## Patterns

### Quantity Selector

```jsx
function QuantitySelector() {
  const [quantity, setQuantity] = useState(1);

  return (
    <NumberInput
      id="qty"
      label="Quantity"
      min={1}
      max={99}
      value={quantity}
      onChange={(e, { value }) => setQuantity(value)}
      helperText="Select between 1 and 99 items"
    />
  );
}
```

### Currency Input

```jsx
function PriceInput() {
  const [price, setPrice] = useState(0);

  return (
    <NumberInput
      id="price"
      label="Product Price"
      min={0}
      max={9999.99}
      step={0.01}
      value={price}
      onChange={(e, { value }) => setPrice(value)}
      locale="en-US"
      formatOptions={{
        style: 'currency',
        currency: 'USD'
      }}
      invalid={price <= 0}
      invalidText="Price must be greater than $0"
    />
  );
}
```

### Year Selector

```jsx
function YearSelector() {
  const currentYear = new Date().getFullYear();
  const [year, setYear] = useState(null);

  return (
    <NumberInput
      id="year"
      label="Year"
      min={1900}
      max={currentYear}
      step={1}
      stepStartValue={currentYear}
      value={year}
      onChange={(e, { value }) => setYear(value)}
      allowEmpty={true}
      helperText={`Enter a year between 1900 and ${currentYear}`}
    />
  );
}
```

### With Dynamic Validation

```jsx
function BudgetInput() {
  const [amount, setAmount] = useState(0);
  const budget = 1000;
  const remaining = budget - amount;

  return (
    <NumberInput
      id="amount"
      label="Amount"
      min={0}
      max={budget}
      step={10}
      value={amount}
      onChange={(e, { value }) => setAmount(value)}
      invalid={amount > budget}
      invalidText={`Exceeds budget by $${amount - budget}`}
      warn={remaining < 100 && remaining > 0}
      warnText={`Only $${remaining} remaining in budget`}
      formatOptions={{
        style: 'currency',
        currency: 'USD'
      }}
    />
  );
}
```

## Related Components

- **Slider**: For selecting from visual numeric ranges
- **TextInput**: For non-numeric or formatted number strings (phone, zip)
- **DatePicker**: For date selection instead of year numbers
- **Dropdown**: For selecting from predefined numeric options

## References

- [Carbon Design System - Number Input](https://www.carbondesignsystem.com/components/number-input/usage)
- [React Storybook - NumberInput](https://react.carbondesignsystem.com/?path=/docs/components-numberinput--overview)
- [MDN - Intl.NumberFormat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat)
- [WCAG 2.1 - Labels or Instructions](https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html)

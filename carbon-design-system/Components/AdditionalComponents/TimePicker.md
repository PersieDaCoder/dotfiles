# TimePicker

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-timepicker--overview)

## Overview

The TimePicker component allows users to select a time value. It provides an accessible way to input hours, minutes, and optionally seconds, with AM/PM selection for 12-hour format.

## When to use

- When users need to input a specific time
- For scheduling or time-based data entry
- When you need to enforce time format consistency
- For appointment booking or event scheduling

## When not to use

- When you need date and time together (consider DatePicker with time)
- For duration input (consider using separate number inputs)
- When time ranges are needed (use two TimePicker instances)

## Usage

### Basic Example

```jsx
import { TimePicker, TimePickerSelect, SelectItem } from '@carbon/react';

function MyComponent() {
  return (
    <TimePicker id="time-picker" labelText="Select a time">
      <TimePickerSelect id="time-picker-select-1" labelText="Hour">
        <SelectItem value="00" text="00" />
        <SelectItem value="01" text="01" />
        <SelectItem value="02" text="02" />
        <SelectItem value="03" text="03" />
        <SelectItem value="04" text="04" />
        <SelectItem value="05" text="05" />
        <SelectItem value="06" text="06" />
        <SelectItem value="07" text="07" />
        <SelectItem value="08" text="08" />
        <SelectItem value="09" text="09" />
        <SelectItem value="10" text="10" />
        <SelectItem value="11" text="11" />
      </TimePickerSelect>
      <TimePickerSelect id="time-picker-select-2" labelText="Minute">
        <SelectItem value="00" text="00" />
        <SelectItem value="15" text="15" />
        <SelectItem value="30" text="30" />
        <SelectItem value="45" text="45" />
      </TimePickerSelect>
      <TimePickerSelect id="time-picker-select-3" labelText="AM/PM">
        <SelectItem value="AM" text="AM" />
        <SelectItem value="PM" text="PM" />
      </TimePickerSelect>
    </TimePicker>
  );
}
```

### With Timezone

```jsx
<TimePicker id="time-picker-2" labelText="Select a time">
  <TimePickerSelect id="hours" labelText="Hour">
    <SelectItem value="00" text="00" />
    <SelectItem value="01" text="01" />
    {/* ... */}
  </TimePickerSelect>
  <TimePickerSelect id="minutes" labelText="Minute">
    <SelectItem value="00" text="00" />
    <SelectItem value="30" text="30" />
  </TimePickerSelect>
  <TimePickerSelect id="timezone" labelText="Timezone">
    <SelectItem value="ET" text="Eastern Time" />
    <SelectItem value="CT" text="Central Time" />
    <SelectItem value="MT" text="Mountain Time" />
    <SelectItem value="PT" text="Pacific Time" />
  </TimePickerSelect>
</TimePicker>
```

### Invalid State

```jsx
<TimePicker
  id="time-picker-3"
  labelText="Select a time"
  invalid
  invalidText="Please select a valid time"
>
  <TimePickerSelect id="hours" labelText="Hour">
    <SelectItem value="00" text="00" />
  </TimePickerSelect>
  <TimePickerSelect id="minutes" labelText="Minute">
    <SelectItem value="00" text="00" />
  </TimePickerSelect>
</TimePicker>
```

### Disabled State

```jsx
<TimePicker
  id="time-picker-4"
  labelText="Select a time"
  disabled
>
  <TimePickerSelect id="hours" labelText="Hour" disabled>
    <SelectItem value="00" text="00" />
  </TimePickerSelect>
  <TimePickerSelect id="minutes" labelText="Minute" disabled>
    <SelectItem value="00" text="00" />
  </TimePickerSelect>
</TimePicker>
```

### 24-Hour Format

```jsx
<TimePicker id="time-picker-5" labelText="Select a time (24-hour)">
  <TimePickerSelect id="hours" labelText="Hour">
    <SelectItem value="00" text="00" />
    <SelectItem value="01" text="01" />
    <SelectItem value="02" text="02" />
    {/* ... up to 23 */}
    <SelectItem value="23" text="23" />
  </TimePickerSelect>
  <TimePickerSelect id="minutes" labelText="Minute">
    <SelectItem value="00" text="00" />
    <SelectItem value="15" text="15" />
    <SelectItem value="30" text="30" />
    <SelectItem value="45" text="45" />
  </TimePickerSelect>
</TimePicker>
```

### Sizes

```jsx
{/* Small */}
<TimePicker id="time-picker-sm" labelText="Small" size="sm">
  <TimePickerSelect id="hours-sm" labelText="Hour" size="sm">
    <SelectItem value="09" text="09" />
  </TimePickerSelect>
</TimePicker>

{/* Medium (default) */}
<TimePicker id="time-picker-md" labelText="Medium" size="md">
  <TimePickerSelect id="hours-md" labelText="Hour" size="md">
    <SelectItem value="09" text="09" />
  </TimePickerSelect>
</TimePicker>

{/* Large */}
<TimePicker id="time-picker-lg" labelText="Large" size="lg">
  <TimePickerSelect id="hours-lg" labelText="Hour" size="lg">
    <SelectItem value="09" text="09" />
  </TimePickerSelect>
</TimePicker>
```

## Props

### TimePicker

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** Provide TimePickerSelect components as children |
| `className` | `string` | - | Custom CSS class name |
| `disabled` | `bool` | `false` | Specify whether the TimePicker should be disabled |
| `id` | `string` | - | **Required.** Specify a unique id for the TimePicker |
| `invalid` | `bool` | `false` | Specify whether the TimePicker is in an invalid state |
| `invalidText` | `node` | - | Message shown when the TimePicker is invalid |
| `labelText` | `node` | - | Provide label text for the TimePicker |
| `light` | `bool` | `false` | **Deprecated.** Specify whether to use the light variant |
| `maxLength` | `number` | - | Max character length for input field |
| `onChange` | `func` | - | Callback called when the time value changes |
| `onClick` | `func` | - | Callback called when clicking on the TimePicker |
| `pattern` | `string` | - | Pattern to use for the time input field |
| `placeholder` | `string` | `'hh:mm'` | Placeholder text for the input |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the TimePicker |
| `type` | `string` | `'text'` | Type attribute for the input |
| `value` | `string` | - | The value of the time input |

### TimePickerSelect

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** Provide SelectItem components as options |
| `className` | `string` | - | Custom CSS class name |
| `disabled` | `bool` | `false` | Specify whether the select should be disabled |
| `iconDescription` | `string` | `'open list of options'` | Description for the dropdown icon |
| `id` | `string` | - | **Required.** Specify a unique id for the select |
| `labelText` | `node` | - | **Required.** Label for the select (for accessibility) |
| `onChange` | `func` | - | Callback called when the selected value changes |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the select |
| `value` | `string \| number` | - | The currently selected value |

## Accessibility

- Each TimePickerSelect must have a unique `id` and descriptive `labelText`
- The component supports keyboard navigation (Tab, Arrow keys, Enter)
- Screen readers announce the current time selection and changes
- Invalid states are communicated to assistive technologies
- Use proper labeling to indicate time format (12-hour vs 24-hour)
- Ensure timezone is clearly labeled when applicable

## Best Practices

- Provide reasonable default values when possible
- Use common time increments (15, 30 minutes) for minute selection
- Clearly indicate the time format (12-hour or 24-hour)
- Include timezone selection for international applications
- Validate time selections and provide clear error messages
- Consider user's locale for time format preferences

## Related Components

- **DatePicker**: Use for date selection, often combined with TimePicker
- **Select**: The underlying component used for each time segment
- **TextInput**: Alternative for freeform time input

## Available Variants

- Default
- 12-hour format (with AM/PM)
- 24-hour format
- With timezone
- Invalid state
- Disabled state
- Different sizes (sm, md, lg)

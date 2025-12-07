# Date Picker

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-datepicker--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/DatePicker) | [Usage guidelines](https://www.carbondesignsystem.com/components/date-picker/usage) | [Accessibility](https://www.carbondesignsystem.com/components/date-picker/accessibility)

## Overview

Date pickers allow users to select a single date or a date range. They can be used with or without a calendar dropdown for date selection. Date pickers are useful when the user needs to input a date that is near the current date, or when precision is important.

## When to use

- **Scheduling**: When users need to select dates for appointments, bookings, or events
- **Date ranges**: When users need to select a start and end date (e.g., for reports or filters)
- **Recent dates**: When the date is likely to be close to today's date
- **Precise dates**: When users need to select a specific date accurately

## When not to use

- **Birth dates or historical dates**: Use a simple text input for dates far in the past
- **Approximate dates**: If precision isn't critical, consider alternative inputs
- **Known dates**: If users likely know the exact date, a text input may be faster
- **Very distant future dates**: Text input might be more efficient

## Live Demo

```jsx
import { DatePicker, DatePickerInput } from '@carbon/react';

function Example() {
  return (
    <DatePicker datePickerType="single">
      <DatePickerInput
        id="date-picker-single"
        placeholder="mm/dd/yyyy"
        labelText="Date"
      />
    </DatePicker>
  );
}
```

## Variants

### Simple (no calendar)
```jsx
<DatePicker datePickerType="simple">
  <DatePickerInput
    id="date-simple"
    placeholder="mm/dd/yyyy"
    labelText="Date"
  />
</DatePicker>
```

### Single date with calendar
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-single"
    placeholder="mm/dd/yyyy"
    labelText="Select date"
    size="md"
  />
</DatePicker>
```

### Date range
```jsx
<DatePicker datePickerType="range">
  <DatePickerInput
    id="date-range-start"
    placeholder="mm/dd/yyyy"
    labelText="Start date"
  />
  <DatePickerInput
    id="date-range-end"
    placeholder="mm/dd/yyyy"
    labelText="End date"
  />
</DatePicker>
```

### Small size
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-small"
    placeholder="mm/dd/yyyy"
    labelText="Date"
    size="sm"
  />
</DatePicker>
```

### Large size
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-large"
    placeholder="mm/dd/yyyy"
    labelText="Date"
    size="lg"
  />
</DatePicker>
```

### Disabled
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-disabled"
    placeholder="mm/dd/yyyy"
    labelText="Date"
    disabled
  />
</DatePicker>
```

### Invalid state
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-invalid"
    placeholder="mm/dd/yyyy"
    labelText="Date"
    invalid
    invalidText="Please enter a valid date"
  />
</DatePicker>
```

### Warning state
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-warn"
    placeholder="mm/dd/yyyy"
    labelText="Date"
    warn
    warnText="Date is in the past"
  />
</DatePicker>
```

### With helper text
```jsx
<DatePicker datePickerType="single">
  <DatePickerInput
    id="date-helper"
    placeholder="mm/dd/yyyy"
    labelText="Appointment date"
    helperText="Select your preferred appointment date"
  />
</DatePicker>
```

### With min and max dates
```jsx
<DatePicker
  datePickerType="single"
  minDate="01/01/2025"
  maxDate="12/31/2025"
>
  <DatePickerInput
    id="date-minmax"
    placeholder="mm/dd/yyyy"
    labelText="Select date in 2025"
  />
</DatePicker>
```

### Skeleton state
```jsx
import { DatePickerSkeleton } from '@carbon/react';

<DatePickerSkeleton />
```

## Controlled Component

```jsx
import { useState } from 'react';
import { DatePicker, DatePickerInput } from '@carbon/react';

function ControlledExample() {
  const [selectedDate, setSelectedDate] = useState('');

  return (
    <div>
      <DatePicker
        datePickerType="single"
        value={selectedDate}
        onChange={(dates) => {
          setSelectedDate(dates[0]);
        }}
      >
        <DatePickerInput
          id="controlled-date"
          placeholder="mm/dd/yyyy"
          labelText="Select date"
        />
      </DatePicker>

      <p>Selected: {selectedDate || 'None'}</p>
    </div>
  );
}
```

## Date Range Example

```jsx
import { useState } from 'react';
import { DatePicker, DatePickerInput } from '@carbon/react';

function DateRangeExample() {
  const [dateRange, setDateRange] = useState(['', '']);

  const handleChange = (dates) => {
    setDateRange(dates);
    console.log('Start:', dates[0]);
    console.log('End:', dates[1]);
  };

  return (
    <DatePicker
      datePickerType="range"
      onChange={handleChange}
    >
      <DatePickerInput
        id="range-start"
        placeholder="mm/dd/yyyy"
        labelText="Start date"
      />
      <DatePickerInput
        id="range-end"
        placeholder="mm/dd/yyyy"
        labelText="End date"
      />
    </DatePicker>
  );
}
```

## Form Integration

```jsx
import { useState } from 'react';
import { DatePicker, DatePickerInput, Form, Button } from '@carbon/react';

function BookingForm() {
  const [formData, setFormData] = useState({
    checkIn: '',
    checkOut: ''
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Booking:', formData);
  };

  return (
    <Form onSubmit={handleSubmit}>
      <DatePicker
        datePickerType="range"
        onChange={(dates) => {
          setFormData({
            checkIn: dates[0],
            checkOut: dates[1]
          });
        }}
      >
        <DatePickerInput
          id="check-in"
          placeholder="mm/dd/yyyy"
          labelText="Check-in date"
        />
        <DatePickerInput
          id="check-out"
          placeholder="mm/dd/yyyy"
          labelText="Check-out date"
        />
      </DatePicker>

      <Button type="submit" kind="primary">
        Book reservation
      </Button>
    </Form>
  );
}
```

## Custom Date Format

```jsx
<DatePicker
  datePickerType="single"
  dateFormat="d/m/Y"
  locale="en"
>
  <DatePickerInput
    id="date-custom-format"
    placeholder="dd/mm/yyyy"
    labelText="Date (DD/MM/YYYY)"
  />
</DatePicker>
```

## With Validation

```jsx
import { useState } from 'react';
import { DatePicker, DatePickerInput } from '@carbon/react';

function ValidatedDatePicker() {
  const [date, setDate] = useState('');
  const [error, setError] = useState('');

  const validateDate = (selectedDate) => {
    const today = new Date();
    const selected = new Date(selectedDate);

    if (selected < today) {
      setError('Date must be in the future');
      return false;
    }

    setError('');
    return true;
  };

  const handleChange = (dates) => {
    const selectedDate = dates[0];
    setDate(selectedDate);
    validateDate(selectedDate);
  };

  return (
    <DatePicker
      datePickerType="single"
      onChange={handleChange}
    >
      <DatePickerInput
        id="validated-date"
        placeholder="mm/dd/yyyy"
        labelText="Future date"
        invalid={!!error}
        invalidText={error}
      />
    </DatePicker>
  );
}
```

## Component API

### DatePicker

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `allowInput` | `boolean` | `true` | Allow manual input of dates |
| `appendTo` | `HTMLElement` | `document.body` | The element to append the calendar dropdown to |
| `children` | `node` | - | Child `DatePickerInput` components |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `dateFormat` | `string` | `'m/d/Y'` | The date format (using flatpickr format tokens) |
| `datePickerType` | `'simple' \| 'single' \| 'range'` | `'simple'` | The type of date picker |
| `disable` | `array` | - | Array of dates to disable |
| `enable` | `array` | - | Array of dates to enable (all others disabled) |
| `light` | `boolean` | `false` | Specify if the control should use light styles (deprecated) |
| `locale` | `string \| object` | `'en'` | The locale for the calendar |
| `maxDate` | `string` | - | The maximum date allowed |
| `minDate` | `string` | - | The minimum date allowed |
| `onChange` | `func` | - | Function called when date changes. Signature: `(dates) => void` |
| `onClose` | `func` | - | Function called when calendar closes |
| `onOpen` | `func` | - | Function called when calendar opens |
| `readOnly` | `boolean` | `false` | Whether the DatePicker is read-only |
| `short` | `boolean` | `false` | Specify whether the DatePicker is short (deprecated, use size on DatePickerInput) |
| `value` | `string \| array` | - | The value(s) of the date picker |

### DatePickerInput

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `autoComplete` | `string` | `'off'` | Specify the autocomplete attribute |
| `className` | `string` | - | Specify an optional className to be applied to the input |
| `disabled` | `boolean` | `false` | Specify whether the input should be disabled |
| `helperText` | `node` | - | Provide helper text for additional guidance |
| `hideLabel` | `boolean` | `false` | Specify whether the label should be visually hidden |
| `iconDescription` | `string` | `'Icon description'` | The description for the calendar icon |
| `id` | `string` | **Required** | Specify an id for the input |
| `invalid` | `boolean` | `false` | Specify whether the input is invalid |
| `invalidText` | `node` | - | Provide the text for the invalid state |
| `labelText` | `node` | **Required** | Provide the label text |
| `onChange` | `func` | - | Function called when input changes |
| `onClick` | `func` | - | Function called when input is clicked |
| `pattern` | `string` | `'\\d{1,2}\\/\\d{1,2}\\/\\d{4}'` | Pattern to validate the input |
| `placeholder` | `string` | `'mm/dd/yyyy'` | Placeholder text for the input |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the input |
| `type` | `string` | `'text'` | The input type |
| `warn` | `boolean` | `false` | Specify whether the input is in a warning state |
| `warnText` | `node` | - | Provide the text for the warning state |

### DatePickerSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |
| `range` | `boolean` | `false` | Whether to show a range skeleton |

## Date Format Tokens

Common flatpickr format tokens:

| Token | Description | Example |
|-------|-------------|---------|
| `d` | Day of month (2 digits) | 01-31 |
| `D` | Weekday (short) | Mon-Sun |
| `j` | Day of month (no leading zero) | 1-31 |
| `l` | Weekday (full) | Monday-Sunday |
| `m` | Month (2 digits) | 01-12 |
| `M` | Month (short) | Jan-Dec |
| `n` | Month (no leading zero) | 1-12 |
| `F` | Month (full) | January-December |
| `Y` | Year (4 digits) | 2025 |
| `y` | Year (2 digits) | 25 |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to/from the date picker
- **Enter/Space**: Open calendar when input is focused
- **Escape**: Close calendar
- **Arrow keys**: Navigate calendar dates
- **Page Up/Down**: Change month
- **Shift + Page Up/Down**: Change year
- **Home**: Go to first day of week
- **End**: Go to last day of week

### Screen readers
- Label text is announced for the input
- Calendar is properly labeled
- Selected dates are announced
- Helper text is associated via `aria-describedby`
- Invalid states are announced

### Best practices
- Always provide meaningful `labelText`
- Use `helperText` to clarify date format or requirements
- Provide clear `invalidText` for error states
- Use `placeholder` to show expected format
- Set appropriate `minDate` and `maxDate` when applicable
- Ensure sufficient color contrast (4.5:1 for text)
- Don't rely solely on color to indicate state
- Consider time zones for date-sensitive applications
- Use simple date format for better clarity

### ARIA attributes
- `aria-label` for the calendar icon
- `aria-describedby` for helper/error text
- `aria-invalid` when in invalid state
- `role="application"` for the calendar
- `aria-selected` for selected dates

## Common Patterns

### Event Scheduling
```jsx
<DatePicker
  datePickerType="single"
  minDate={new Date().toLocaleDateString()}
>
  <DatePickerInput
    id="event-date"
    labelText="Event date"
    placeholder="mm/dd/yyyy"
  />
</DatePicker>
```

### Report Date Range
```jsx
<DatePicker
  datePickerType="range"
  maxDate={new Date().toLocaleDateString()}
>
  <DatePickerInput
    id="report-start"
    labelText="From"
    placeholder="mm/dd/yyyy"
  />
  <DatePickerInput
    id="report-end"
    labelText="To"
    placeholder="mm/dd/yyyy"
  />
</DatePicker>
```

### Booking System
```jsx
<DatePicker
  datePickerType="range"
  minDate={new Date().toLocaleDateString()}
  onChange={(dates) => {
    const nights = calculateNights(dates[0], dates[1]);
    updatePrice(nights);
  }}
>
  <DatePickerInput
    id="checkin"
    labelText="Check-in"
    placeholder="mm/dd/yyyy"
  />
  <DatePickerInput
    id="checkout"
    labelText="Check-out"
    placeholder="mm/dd/yyyy"
  />
</DatePicker>
```

## Related components

- **[TimePicker](TimePicker.md)**: For selecting time
- **[TextInput](TextInput.md)**: For manual date entry
- **[Dropdown](Dropdown.md)**: Alternative for selecting from predefined dates

## References

- [Carbon Design System - Date Picker Usage](https://www.carbondesignsystem.com/components/date-picker/usage)
- [Carbon Design System - Date Picker Accessibility](https://www.carbondesignsystem.com/components/date-picker/accessibility)
- [Carbon React Storybook - Date Picker](https://react.carbondesignsystem.com/?path=/docs/components-datepicker--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/DatePicker)
- [Flatpickr Documentation](https://flatpickr.js.org/) (underlying calendar library)

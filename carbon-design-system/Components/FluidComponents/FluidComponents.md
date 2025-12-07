# Fluid Components

## Overview

Fluid form components are variants of Carbon's standard form inputs that extend to fill the full width of their container and feature a different visual style optimized for use in forms and structured layouts. Unlike their standard counterparts, fluid components remove the field border and instead use a bottom border to define the input area, creating a more streamlined and space-efficient layout.

## Key Characteristics

- **Full-width**: Automatically span the full width of their container
- **Unified visual style**: Feature a bottom border instead of a full border
- **Label positioning**: Labels are positioned inside the input area at the top
- **Consistent spacing**: All fluid components maintain consistent vertical rhythm
- **Form optimization**: Designed specifically for forms and data entry workflows

## When to Use

- **Structured forms**: When building forms with a consistent, vertical layout
- **Narrow layouts**: When space efficiency is important and full-width inputs are beneficial
- **Unified appearance**: When you need all form inputs to have a consistent visual treatment
- **Dense layouts**: When you need to maximize content density while maintaining clarity

## When Not to Use

- **Inline forms**: Standard components work better for inline or horizontal layouts
- **Mixed layouts**: If your form mixes different input widths, standard components offer more flexibility
- **Custom widths**: When you need fine control over individual input widths

---

## Available Fluid Components

### FluidTextInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidtextinput--overview)

Text input field that extends full-width with fluid styling.

```jsx
<FluidTextInput
  id="text-input"
  labelText="Label text"
  placeholder="Placeholder text"
  invalid={false}
  invalidText="Error message"
  warn={false}
  warnText="Warning message"
/>
```

**Key Props:**
- `labelText` (string) - The label text
- `placeholder` (string) - Placeholder text
- `invalid` (boolean) - Whether the input is invalid
- `invalidText` (string) - Error message to display
- `warn` (boolean) - Whether to show warning state
- `warnText` (string) - Warning message to display
- `disabled` (boolean) - Whether the input is disabled
- `value` (string) - Controlled value
- `defaultValue` (string) - Default uncontrolled value
- `onChange` (function) - Change handler

---

### FluidTextArea

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidtextarea--overview)

Multi-line text input that extends full-width with fluid styling.

```jsx
<FluidTextArea
  id="text-area"
  labelText="Description"
  placeholder="Enter description"
  rows={4}
  enableCounter={true}
  maxCount={500}
/>
```

**Key Props:**
- `labelText` (string) - The label text
- `placeholder` (string) - Placeholder text
- `rows` (number) - Number of rows to display
- `enableCounter` (boolean) - Show character counter
- `maxCount` (number) - Maximum character count
- `invalid` (boolean) - Whether the input is invalid
- `invalidText` (string) - Error message
- `warn` (boolean) - Whether to show warning state
- `warnText` (string) - Warning message
- `onChange` (function) - Change handler

---

### FluidDropdown

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluiddropdown--overview)

Dropdown selector with fluid styling.

```jsx
<FluidDropdown
  id="dropdown"
  titleText="Select an option"
  label="Choose option"
  items={[
    { id: 'option1', text: 'Option 1' },
    { id: 'option2', text: 'Option 2' },
    { id: 'option3', text: 'Option 3' }
  ]}
  itemToString={(item) => item?.text}
  onChange={({ selectedItem }) => console.log(selectedItem)}
  invalid={false}
  invalidText="Error message"
/>
```

**Key Props:**
- `titleText` (string) - Label text above the dropdown
- `label` (string) - Placeholder text shown when no item is selected
- `items` (array) - Array of items to display
- `itemToString` (function) - Function to convert item to string
- `onChange` (function) - Called when selection changes
- `selectedItem` (object) - Currently selected item
- `invalid` (boolean) - Whether the dropdown is invalid
- `invalidText` (string) - Error message
- `warn` (boolean) - Whether to show warning state
- `warnText` (string) - Warning message
- `disabled` (boolean) - Whether the dropdown is disabled

---

### FluidComboBox

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidcombobox--overview)

Searchable combo box with fluid styling.

```jsx
<FluidComboBox
  id="combobox"
  titleText="Search items"
  placeholder="Filter items"
  items={items}
  itemToString={(item) => item?.text}
  onChange={({ selectedItem }) => console.log(selectedItem)}
/>
```

**Key Props:**
- `titleText` (string) - Label text
- `placeholder` (string) - Placeholder for search input
- `items` (array) - Array of items
- `itemToString` (function) - Convert item to string
- `onChange` (function) - Selection change handler
- `selectedItem` (object) - Selected item
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `disabled` (boolean) - Disabled state

---

### FluidMultiSelect

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidmultiselect--overview)

Multi-select dropdown with fluid styling.

```jsx
<FluidMultiSelect
  id="multiselect"
  titleText="Select multiple"
  label="Choose options"
  items={items}
  itemToString={(item) => item?.text}
  onChange={({ selectedItems }) => console.log(selectedItems)}
/>
```

**Key Props:**
- `titleText` (string) - Label text
- `label` (string) - Placeholder text
- `items` (array) - Array of items
- `itemToString` (function) - Convert item to string
- `onChange` (function) - Selection change handler
- `selectedItems` (array) - Array of selected items
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `disabled` (boolean) - Disabled state

---

### FluidDatePicker

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluiddatepicker--overview)

Date picker with fluid styling, supports single and range selection.

```jsx
{/* Single date */}
<FluidDatePicker datePickerType="single">
  <FluidDatePickerInput
    id="date"
    placeholder="mm/dd/yyyy"
    labelText="Date"
  />
</FluidDatePicker>

{/* Date range */}
<FluidDatePicker datePickerType="range">
  <FluidDatePickerInput
    id="start-date"
    placeholder="mm/dd/yyyy"
    labelText="Start date"
  />
  <FluidDatePickerInput
    id="end-date"
    placeholder="mm/dd/yyyy"
    labelText="End date"
  />
</FluidDatePicker>
```

**Key Props:**
- `datePickerType` ('single' | 'range') - Type of date selection
- `dateFormat` (string) - Date format string
- `onChange` (function) - Date change handler
- `value` (string | array) - Selected date(s)

**FluidDatePickerInput Props:**
- `labelText` (string) - Label text
- `placeholder` (string) - Placeholder text
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message

---

### FluidTimePicker

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidtimepicker--overview)

Time picker input with fluid styling.

```jsx
<FluidTimePicker
  id="time-picker"
  labelText="Time"
  placeholder="hh:mm"
  invalid={false}
  invalidText="Invalid time"
/>
```

**Key Props:**
- `labelText` (string) - Label text
- `placeholder` (string) - Placeholder text
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `value` (string) - Selected time
- `onChange` (function) - Time change handler

---

### FluidNumberInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidnumberinput--overview)

Number input with optional steppers, fluid styling.

```jsx
<FluidNumberInput
  id="number-input"
  label="Quantity"
  min={0}
  max={100}
  value={50}
  step={1}
  hideSteppers={false}
  invalid={false}
  invalidText="Invalid number"
/>
```

**Key Props:**
- `label` (string) - Label text
- `min` (number) - Minimum value
- `max` (number) - Maximum value
- `value` (number) - Current value
- `step` (number) - Step increment
- `hideSteppers` (boolean) - Hide increment/decrement buttons
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `warn` (boolean) - Warning state
- `warnText` (string) - Warning message
- `onChange` (function) - Value change handler

---

### FluidPasswordInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidpasswordinput--overview)

Password input with show/hide toggle, fluid styling.

```jsx
<FluidPasswordInput
  id="password"
  labelText="Password"
  placeholder="Enter password"
  invalid={false}
  invalidText="Invalid password"
/>
```

**Key Props:**
- `labelText` (string) - Label text
- `placeholder` (string) - Placeholder text
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `warn` (boolean) - Warning state
- `warnText` (string) - Warning message
- `showPasswordLabel` (string) - Aria label for show password button
- `hidePasswordLabel` (string) - Aria label for hide password button
- `onChange` (function) - Change handler

---

### FluidSearch

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidsearch--overview)

Search input with fluid styling.

```jsx
<FluidSearch
  id="search"
  labelText="Search"
  placeholder="Search..."
  onChange={(e) => console.log(e.target.value)}
  onClear={() => console.log('cleared')}
/>
```

**Key Props:**
- `labelText` (string) - Label text for accessibility
- `placeholder` (string) - Placeholder text
- `value` (string) - Search value
- `defaultValue` (string) - Default uncontrolled value
- `onChange` (function) - Change handler
- `onClear` (function) - Called when search is cleared
- `disabled` (boolean) - Disabled state
- `closeButtonLabelText` (string) - Aria label for clear button

---

### FluidSelect

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidselect--overview)

Native select element with fluid styling.

```jsx
<FluidSelect
  id="select"
  labelText="Select option"
  defaultValue="placeholder"
  invalid={false}
  invalidText="Required field"
>
  <SelectItem
    disabled
    hidden
    value="placeholder"
    text="Choose an option"
  />
  <SelectItem value="option1" text="Option 1" />
  <SelectItem value="option2" text="Option 2" />
  <SelectItem value="option3" text="Option 3" />
</FluidSelect>
```

**Key Props:**
- `labelText` (string) - Label text
- `defaultValue` (string) - Default selected value
- `value` (string) - Controlled value
- `invalid` (boolean) - Invalid state
- `invalidText` (string) - Error message
- `warn` (boolean) - Warning state
- `warnText` (string) - Warning message
- `disabled` (boolean) - Disabled state
- `onChange` (function) - Change handler

---

### FluidForm

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidform--overview)

Container component that provides consistent spacing for fluid form components.

```jsx
<FluidForm>
  <FluidTextInput
    id="name"
    labelText="Name"
    placeholder="Enter name"
  />
  <FluidTextInput
    id="email"
    labelText="Email"
    placeholder="Enter email"
  />
  <FluidTextArea
    id="message"
    labelText="Message"
    placeholder="Enter message"
    rows={4}
  />
</FluidForm>
```

**Key Props:**
- `children` (node) - Fluid form components
- `className` (string) - Additional CSS class

---

## Differences from Regular Components

| Aspect | Regular Components | Fluid Components |
|--------|-------------------|------------------|
| **Width** | Flexible, can be sized with CSS | Always full container width |
| **Border** | Full border around input | Bottom border only |
| **Label** | Above the input area | Inside the input area at top |
| **Spacing** | Customizable margins | Consistent vertical rhythm |
| **Use Case** | General purpose, flexible layouts | Structured forms, vertical layouts |
| **Visual Weight** | Defined by full border | Lighter, defined by bottom border |

## Form Layout Example

```jsx
<FluidForm>
  <Stack gap={0}>
    <FluidTextInput
      id="first-name"
      labelText="First name"
      placeholder="Enter first name"
    />
    <FluidTextInput
      id="last-name"
      labelText="Last name"
      placeholder="Enter last name"
    />
    <FluidTextInput
      id="email"
      labelText="Email"
      placeholder="Enter email"
      type="email"
    />
    <FluidDropdown
      id="country"
      titleText="Country"
      label="Select country"
      items={countries}
      itemToString={(item) => item?.text}
    />
    <FluidTextArea
      id="comments"
      labelText="Additional comments"
      placeholder="Enter any additional comments"
      rows={4}
    />
  </Stack>
</FluidForm>
```

## Accessibility

All fluid components maintain the same accessibility features as their regular counterparts:

- **Proper labeling**: All inputs must have associated labels via `labelText` prop
- **Error states**: `invalid` and `invalidText` props provide error messaging
- **Warning states**: `warn` and `warnText` props provide warning messaging
- **Keyboard navigation**: Full keyboard support for all interactions
- **Screen reader support**: Proper ARIA attributes and announcements
- **Focus management**: Clear focus indicators and logical tab order

### Accessibility Best Practices

1. Always provide descriptive `labelText` for each field
2. Use `invalidText` to provide clear, actionable error messages
3. Ensure error messages are announced to screen readers
4. Maintain logical tab order in forms
5. Group related fields using fieldsets when appropriate
6. Provide helpful placeholder text, but don't rely on it as the only label

## Implementation Notes

1. **Container width**: Fluid components will fill their parent container, so ensure the parent has appropriate width constraints
2. **Spacing**: Use FluidForm or Stack components to manage vertical spacing between fluid inputs
3. **Mixing styles**: Avoid mixing fluid and regular components in the same form for visual consistency
4. **Validation**: Implement proper form validation and use the `invalid` state to communicate errors
5. **Mobile responsive**: Fluid components work well on mobile due to their full-width nature

## Related Resources

- [Carbon Design System - Forms](https://www.carbondesignsystem.com/components/form/usage)
- [Carbon React Storybook - Fluid Components](https://react.carbondesignsystem.com/?path=/docs/components-fluid-components-fluidtextinput--overview)
- [Form validation patterns](https://www.carbondesignsystem.com/patterns/forms-pattern)

# Slider

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-slider--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Slider) | [Usage guidelines](https://www.carbondesignsystem.com/components/slider/usage) | [Accessibility](https://www.carbondesignsystem.com/components/slider/accessibility)

## Overview

Sliders provide a visual indication of adjustable content, where the user can increase or decrease the value by moving the handle along a horizontal track. They're ideal for adjusting settings that reflect intensity levels, such as volume, brightness, or price ranges.

## When to use

- **Adjusting settings**: When users need to adjust settings like volume, brightness, or zoom
- **Range selection**: When selecting a value from a continuous range
- **Visual feedback**: When users benefit from seeing the relative position in a range
- **Approximate values**: When exact precision isn't critical
- **Price ranges**: When filtering products by price or other numeric ranges

## When not to use

- **Precise values**: Use number input when exact values are critical
- **Few options**: Use radio buttons or a dropdown for a small set of discrete values
- **Large ranges**: Consider number input for very large numeric ranges
- **Text values**: Use other input types when values aren't numeric

## Live Demo

```jsx
import { Slider } from '@carbon/react';

function Example() {
  return (
    <Slider
      id="slider-1"
      labelText="Slider"
      min={0}
      max={100}
      step={1}
      value={50}
      onChange={({ value }) => console.log(value)}
    />
  );
}
```

## Variants

### Default
```jsx
<Slider
  id="slider-default"
  labelText="Default slider"
  min={0}
  max={100}
  value={50}
/>
```

### With step increments
```jsx
<Slider
  id="slider-step"
  labelText="Temperature (°C)"
  min={0}
  max={100}
  step={5}
  value={20}
/>
```

### With min/max labels
```jsx
<Slider
  id="slider-labels"
  labelText="Volume"
  min={0}
  max={100}
  minLabel="Quiet"
  maxLabel="Loud"
  value={75}
/>
```

### With input field
```jsx
<Slider
  id="slider-input"
  labelText="Price"
  min={0}
  max={1000}
  step={10}
  value={500}
  hideTextInput={false}
/>
```

### Without input field
```jsx
<Slider
  id="slider-no-input"
  labelText="Brightness"
  min={0}
  max={100}
  value={80}
  hideTextInput={true}
/>
```

### Disabled
```jsx
<Slider
  id="slider-disabled"
  labelText="Disabled slider"
  min={0}
  max={100}
  value={30}
  disabled
/>
```

### Read-only
```jsx
<Slider
  id="slider-readonly"
  labelText="Read-only slider"
  min={0}
  max={100}
  value={60}
  readOnly
/>
```

### Invalid state
```jsx
<Slider
  id="slider-invalid"
  labelText="Invalid slider"
  min={0}
  max={100}
  value={110}
  invalid
  invalidText="Value must be between 0 and 100"
/>
```

### Warning state
```jsx
<Slider
  id="slider-warn"
  labelText="Warning slider"
  min={0}
  max={100}
  value={95}
  warn
  warnText="Value is approaching maximum"
/>
```

### Skeleton state
```jsx
import { SliderSkeleton } from '@carbon/react';

<SliderSkeleton />
```

## Controlled Component

```jsx
import { useState } from 'react';
import { Slider } from '@carbon/react';

function ControlledSlider() {
  const [value, setValue] = useState(50);

  return (
    <div>
      <Slider
        id="controlled-slider"
        labelText="Volume"
        min={0}
        max={100}
        value={value}
        onChange={({ value }) => setValue(value)}
      />

      <p>Current value: {value}</p>
    </div>
  );
}
```

## Range Slider (Two Handles)

```jsx
import { useState } from 'react';
import { Slider } from '@carbon/react';

function PriceRangeSlider() {
  const [minPrice, setMinPrice] = useState(0);
  const [maxPrice, setMaxPrice] = useState(1000);

  return (
    <div>
      <Slider
        id="min-price"
        labelText="Minimum price"
        min={0}
        max={1000}
        value={minPrice}
        onChange={({ value }) => setMinPrice(Math.min(value, maxPrice))}
      />

      <Slider
        id="max-price"
        labelText="Maximum price"
        min={0}
        max={1000}
        value={maxPrice}
        onChange={({ value }) => setMaxPrice(Math.max(value, minPrice))}
      />

      <p>Price range: ${minPrice} - ${maxPrice}</p>
    </div>
  );
}
```

## With Custom Formatting

```jsx
import { useState } from 'react';
import { Slider } from '@carbon/react';

function FormattedSlider() {
  const [value, setValue] = useState(50);

  const formatLabel = (val) => {
    if (val < 33) return 'Low';
    if (val < 66) return 'Medium';
    return 'High';
  };

  return (
    <div>
      <Slider
        id="formatted-slider"
        labelText="Performance"
        min={0}
        max={100}
        value={value}
        onChange={({ value }) => setValue(value)}
      />

      <p>Level: {formatLabel(value)}</p>
    </div>
  );
}
```

## Settings Panel Example

```jsx
import { useState } from 'react';
import { Slider, Stack } from '@carbon/react';

function SettingsPanel() {
  const [settings, setSettings] = useState({
    volume: 75,
    brightness: 50,
    contrast: 80,
    saturation: 60
  });

  const handleChange = (key, value) => {
    setSettings(prev => ({
      ...prev,
      [key]: value
    }));
  };

  return (
    <Stack gap={7}>
      <h3>Display Settings</h3>

      <Slider
        id="volume-slider"
        labelText="Volume"
        min={0}
        max={100}
        value={settings.volume}
        onChange={({ value }) => handleChange('volume', value)}
        minLabel="0%"
        maxLabel="100%"
      />

      <Slider
        id="brightness-slider"
        labelText="Brightness"
        min={0}
        max={100}
        value={settings.brightness}
        onChange={({ value }) => handleChange('brightness', value)}
        minLabel="Dark"
        maxLabel="Bright"
      />

      <Slider
        id="contrast-slider"
        labelText="Contrast"
        min={0}
        max={100}
        value={settings.contrast}
        onChange={({ value }) => handleChange('contrast', value)}
      />

      <Slider
        id="saturation-slider"
        labelText="Saturation"
        min={0}
        max={100}
        value={settings.saturation}
        onChange={({ value }) => handleChange('saturation', value)}
      />
    </Stack>
  );
}
```

## Filter with Slider

```jsx
import { useState } from 'react';
import { Slider } from '@carbon/react';

function ProductFilter() {
  const [maxPrice, setMaxPrice] = useState(500);
  const [products] = useState([
    { id: 1, name: 'Product A', price: 250 },
    { id: 2, name: 'Product B', price: 450 },
    { id: 3, name: 'Product C', price: 350 },
    { id: 4, name: 'Product D', price: 650 }
  ]);

  const filteredProducts = products.filter(p => p.price <= maxPrice);

  return (
    <div>
      <Slider
        id="price-filter"
        labelText="Maximum price"
        min={0}
        max={1000}
        step={50}
        value={maxPrice}
        onChange={({ value }) => setMaxPrice(value)}
        formatLabel={(value) => `$${value}`}
      />

      <div>
        <h4>Products (${filteredProducts.length} found)</h4>
        {filteredProducts.map(product => (
          <div key={product.id}>
            {product.name} - ${product.price}
          </div>
        ))}
      </div>
    </div>
  );
}
```

## With Validation

```jsx
import { useState } from 'react';
import { Slider } from '@carbon/react';

function ValidatedSlider() {
  const [value, setValue] = useState(50);
  const [error, setError] = useState('');

  const handleChange = ({ value: newValue }) => {
    setValue(newValue);

    if (newValue < 30) {
      setError('Value should be at least 30');
    } else if (newValue > 80) {
      setError('Value should not exceed 80');
    } else {
      setError('');
    }
  };

  return (
    <Slider
      id="validated-slider"
      labelText="Recommended range: 30-80"
      min={0}
      max={100}
      value={value}
      onChange={handleChange}
      warn={!!error}
      warnText={error}
    />
  );
}
```

## Component API

### Slider

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `ariaLabelInput` | `string` | - | The `aria-label` for the `<input>` element |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `disabled` | `boolean` | `false` | Specify whether the Slider should be disabled |
| `formatLabel` | `func` | `(value) => value` | Function to format the label or min/max values. Signature: `(value, type) => string` |
| `hideTextInput` | `boolean` | `false` | Specify whether to hide the number input box |
| `id` | `string` | **Required** | Provide an id for the Slider |
| `inputType` | `string` | `'number'` | Type of the `<input>` element |
| `invalid` | `boolean` | `false` | Specify whether the Slider is in an invalid state |
| `invalidText` | `node` | - | Provide the text for the invalid state |
| `labelText` | `node` | - | Provide label text for the Slider |
| `max` | `number` | `100` | The maximum value |
| `min` | `number` | `0` | The minimum value |
| `minLabel` | `string` | - | Label for the minimum value |
| `maxLabel` | `string` | - | Label for the maximum value |
| `name` | `string` | - | Provide a name for the `<input>` element |
| `onChange` | `func` | `() => {}` | Provide an optional function to be called when the value changes. Signature: `({ value }) => void` |
| `onRelease` | `func` | `() => {}` | Provide an optional function to be called when the handle is released |
| `readOnly` | `boolean` | `false` | Whether the Slider should be read-only |
| `required` | `boolean` | `false` | Whether the Slider is required in a form |
| `step` | `number` | `1` | The step increment |
| `stepMultiplier` | `number` | `4` | Multiplier for Shift+arrow key interactions |
| `value` | `number` | **Required** | The value of the Slider |
| `warn` | `boolean` | `false` | Specify whether the Slider is in a warning state |
| `warnText` | `node` | - | Provide the text for the warning state |

### SliderSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |
| `hideLabel` | `boolean` | `false` | Specify whether to hide the label skeleton |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to the slider handle
- **Arrow Left/Down**: Decrease value by step amount
- **Arrow Right/Up**: Increase value by step amount
- **Home**: Jump to minimum value
- **End**: Jump to maximum value
- **Page Down**: Decrease value by larger increment
- **Page Up**: Increase value by larger increment
- **Shift + Arrow keys**: Use `stepMultiplier` for larger increments

### Screen readers
- Label text is announced
- Current value is announced
- Min and max values are announced
- Value changes are announced as user moves the handle
- Invalid and warning states are announced

### Best practices
- Always provide meaningful `labelText`
- Use `minLabel` and `maxLabel` for context
- Provide clear `invalidText` or `warnText` for validation states
- Use appropriate `step` values for the use case
- Ensure the slider track has sufficient color contrast
- Don't rely solely on color to indicate state
- Consider providing an alternative number input (`hideTextInput={false}`)
- Use `ariaLabelInput` for additional context on the input

### ARIA attributes
- `role="slider"` on the handle
- `aria-valuemin` indicates minimum value
- `aria-valuemax` indicates maximum value
- `aria-valuenow` indicates current value
- `aria-valuetext` for formatted value display
- `aria-labelledby` references the label
- `aria-describedby` for helper/error text
- `aria-invalid` when in invalid state
- `aria-disabled` when disabled

## Common Patterns

### Volume Control
```jsx
<Slider
  id="volume"
  labelText="Volume"
  min={0}
  max={100}
  value={75}
  minLabel="🔇"
  maxLabel="🔊"
  onChange={({ value }) => setVolume(value)}
/>
```

### Price Range Filter
```jsx
<Slider
  id="max-price"
  labelText="Maximum price"
  min={0}
  max={1000}
  step={10}
  value={500}
  formatLabel={(value) => `$${value}`}
  onChange={({ value }) => setMaxPrice(value)}
/>
```

### Zoom Level
```jsx
<Slider
  id="zoom"
  labelText="Zoom"
  min={50}
  max={200}
  step={10}
  value={100}
  formatLabel={(value) => `${value}%`}
  onChange={({ value }) => setZoom(value)}
/>
```

### Rating Scale
```jsx
<Slider
  id="rating"
  labelText="How would you rate this product?"
  min={1}
  max={5}
  step={1}
  value={3}
  minLabel="Poor"
  maxLabel="Excellent"
  onChange={({ value }) => setRating(value)}
/>
```

## Best Practices

### DO
- Provide clear labels that describe what the slider controls
- Use appropriate min, max, and step values
- Show current value when precision matters
- Use min/max labels to provide context
- Provide visual feedback when dragging
- Make the slider large enough to interact with easily

### DON'T
- Use sliders for precise value entry (use number input instead)
- Make the slider track too small or hard to click
- Use too many decimal places in step values
- Forget to provide labels for min/max values
- Use sliders for small ranges with few options (use radio buttons)

## Related components

- **[NumberInput](NumberInput.md)**: For precise numeric entry
- **[RadioButton](RadioButton.md)**: For discrete choices
- **[Toggle](Toggle.md)**: For binary on/off states
- **[ProgressBar](ProgressBar.md)**: For showing progress (non-interactive)

## References

- [Carbon Design System - Slider Usage](https://www.carbondesignsystem.com/components/slider/usage)
- [Carbon Design System - Slider Accessibility](https://www.carbondesignsystem.com/components/slider/accessibility)
- [Carbon React Storybook - Slider](https://react.carbondesignsystem.com/?path=/docs/components-slider--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Slider)
- [WAI-ARIA Slider Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/slider/)

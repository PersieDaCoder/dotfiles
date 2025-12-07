# Toggle

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-toggle--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Toggle) | [Usage guidelines](https://www.carbondesignsystem.com/components/toggle/usage) | [Accessibility](https://www.carbondesignsystem.com/components/toggle/accessibility)

## Overview

Toggle is used for switching between two mutually exclusive states, such as on/off or enabled/disabled. Unlike checkboxes, changes made with a toggle usually apply immediately.

## When to use

- **Immediate action**: When changes take effect immediately without requiring a save or submit action
- **Binary states**: When you need to switch between two opposite states (on/off, enabled/disabled)
- **Settings**: For turning features or preferences on and off
- **Quick activation**: When users need to quickly enable or disable a feature

## When not to use

- **Delayed action**: Use a checkbox if changes require save/submit to take effect
- **Multiple selections**: Use checkboxes when users can select multiple independent options
- **Mutually exclusive options**: Use radio buttons for choosing one option from several
- **Confirmation needed**: If the action is critical and needs confirmation, consider using a modal

## Live Demo

```jsx
import { Toggle } from '@carbon/react';

function Example() {
  return (
    <Toggle
      id="toggle-1"
      labelText="Notifications"
      labelA="Off"
      labelB="On"
    />
  );
}
```

## Variants

### Default (Small)
```jsx
<Toggle
  id="toggle-default"
  labelText="Enable feature"
  labelA="Off"
  labelB="On"
  size="sm"
/>
```

### Medium size
```jsx
<Toggle
  id="toggle-medium"
  labelText="Enable feature"
  labelA="Off"
  labelB="On"
  size="md"
/>
```

### Toggled by default
```jsx
<Toggle
  id="toggle-on"
  labelText="Notifications enabled"
  labelA="Off"
  labelB="On"
  defaultToggled
/>
```

### Disabled
```jsx
<Toggle
  id="toggle-disabled"
  labelText="Premium feature"
  labelA="Off"
  labelB="On"
  disabled
/>
```

### Disabled and toggled
```jsx
<Toggle
  id="toggle-disabled-on"
  labelText="System setting"
  labelA="Off"
  labelB="On"
  disabled
  defaultToggled
/>
```

### Read-only
```jsx
<Toggle
  id="toggle-readonly"
  labelText="View-only setting"
  labelA="Off"
  labelB="On"
  readOnly
  defaultToggled
/>
```

### Hide label
```jsx
<Toggle
  id="toggle-hidden-label"
  labelText="Hidden label"
  labelA="Off"
  labelB="On"
  hideLabel
/>
```

### With onChange handler
```jsx
<Toggle
  id="toggle-handler"
  labelText="Dark mode"
  labelA="Light"
  labelB="Dark"
  onToggle={(checked) => {
    console.log('Dark mode:', checked);
  }}
/>
```

### Skeleton state
```jsx
import { ToggleSkeleton } from '@carbon/react';

<ToggleSkeleton />
```

## Controlled Component

```jsx
import { useState } from 'react';
import { Toggle } from '@carbon/react';

function ControlledExample() {
  const [enabled, setEnabled] = useState(false);

  return (
    <div>
      <Toggle
        id="controlled-toggle"
        labelText="Notifications"
        labelA="Disabled"
        labelB="Enabled"
        toggled={enabled}
        onToggle={(checked) => setEnabled(checked)}
      />

      <p>Status: {enabled ? 'Enabled' : 'Disabled'}</p>
    </div>
  );
}
```

## Settings Panel Example

```jsx
import { useState } from 'react';
import { Toggle, Stack } from '@carbon/react';

function SettingsPanel() {
  const [settings, setSettings] = useState({
    notifications: true,
    autoSave: false,
    darkMode: false,
    analytics: true
  });

  const handleToggle = (key, value) => {
    setSettings(prev => ({
      ...prev,
      [key]: value
    }));
  };

  return (
    <Stack gap={5}>
      <h3>Application Settings</h3>

      <Toggle
        id="notifications-toggle"
        labelText="Email notifications"
        labelA="Off"
        labelB="On"
        toggled={settings.notifications}
        onToggle={(checked) => handleToggle('notifications', checked)}
      />

      <Toggle
        id="autosave-toggle"
        labelText="Auto-save"
        labelA="Off"
        labelB="On"
        toggled={settings.autoSave}
        onToggle={(checked) => handleToggle('autoSave', checked)}
      />

      <Toggle
        id="darkmode-toggle"
        labelText="Dark mode"
        labelA="Light"
        labelB="Dark"
        toggled={settings.darkMode}
        onToggle={(checked) => handleToggle('darkMode', checked)}
      />

      <Toggle
        id="analytics-toggle"
        labelText="Usage analytics"
        labelA="Off"
        labelB="On"
        toggled={settings.analytics}
        onToggle={(checked) => handleToggle('analytics', checked)}
      />
    </Stack>
  );
}
```

## Conditional Feature Example

```jsx
import { useState } from 'react';
import { Toggle, TextInput } from '@carbon/react';

function ConditionalFeature() {
  const [customEnabled, setCustomEnabled] = useState(false);

  return (
    <div>
      <Toggle
        id="custom-toggle"
        labelText="Use custom domain"
        labelA="Off"
        labelB="On"
        toggled={customEnabled}
        onToggle={setCustomEnabled}
      />

      {customEnabled && (
        <TextInput
          id="custom-domain"
          labelText="Custom domain"
          placeholder="example.com"
        />
      )}
    </div>
  );
}
```

## Component API

### Toggle

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the wrapper |
| `defaultToggled` | `boolean` | `false` | Specify whether the toggle should be on by default (uncontrolled) |
| `disabled` | `boolean` | `false` | Specify whether the toggle should be disabled |
| `hideLabel` | `boolean` | `false` | Specify whether the label should be visually hidden |
| `id` | `string` | **Required** | Provide an id for the toggle input |
| `labelA` | `string` | `'Off'` | Specify the label for the "off" position |
| `labelB` | `string` | `'On'` | Specify the label for the "on" position |
| `labelText` | `node` | **Required** | Provide the text that describes the toggle |
| `onToggle` | `func` | - | Provide an optional function to be called when toggle is clicked. Signature: `(checked, id, event) => void` |
| `readOnly` | `boolean` | `false` | Whether the toggle should be read-only |
| `size` | `'sm' \| 'md'` | `'sm'` | Specify the size of the toggle |
| `toggled` | `boolean` | - | Specify whether the toggle is on (controlled) |

### ToggleSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to the toggle
- **Space**: Toggle the switch state
- **Enter**: Toggle the switch state

### Screen readers
- Toggle state (on/off) is announced
- Label text is announced
- State labels (labelA/labelB) provide additional context
- Changes are announced when toggled

### Best practices
- Always provide meaningful `labelText`
- Use clear `labelA` and `labelB` text (e.g., "Off"/"On", "Disabled"/"Enabled")
- Don't use toggle for actions that require save/submit
- Provide immediate feedback when state changes
- Use toggle only for binary choices
- Ensure sufficient color contrast (3:1 for UI components)
- Don't rely solely on color to indicate state
- Consider adding confirmation for critical toggles

### ARIA attributes
- `role="switch"` for proper semantics
- `aria-checked` indicates current state
- `aria-labelledby` references the label
- `aria-disabled` when disabled

## Toggle vs Checkbox vs Radio Button

| Feature | Toggle | Checkbox | Radio Button |
|---------|--------|----------|--------------|
| **Purpose** | Immediate on/off action | Multiple selections or single yes/no | Mutually exclusive options |
| **Action timing** | Immediate | On submit/save | On submit/save |
| **States** | 2 (on/off) | 2-3 (checked/unchecked/indeterminate) | 2 (selected/unselected) |
| **Use in groups** | Individual | Yes | Required |
| **Selection** | One at a time | Multiple | One from group |
| **Example** | Enable notifications | Accept terms, select items | Choose size (S/M/L) |

## Common Patterns

### Enabling/Disabling Features
```jsx
<Toggle
  id="feature-toggle"
  labelText="Enable advanced mode"
  labelA="Basic"
  labelB="Advanced"
  onToggle={(checked) => {
    // Apply changes immediately
    if (checked) {
      enableAdvancedMode();
    } else {
      disableAdvancedMode();
    }
  }}
/>
```

### Theme Switching
```jsx
<Toggle
  id="theme-toggle"
  labelText="Appearance"
  labelA="Light"
  labelB="Dark"
  toggled={theme === 'dark'}
  onToggle={(checked) => {
    setTheme(checked ? 'dark' : 'light');
  }}
/>
```

### Privacy Settings
```jsx
<Toggle
  id="privacy-toggle"
  labelText="Profile visibility"
  labelA="Private"
  labelB="Public"
  toggled={isPublic}
  onToggle={setIsPublic}
/>
```

## Related components

- **[Checkbox](Checkbox.md)**: For selections that require save/submit
- **[Radio Button](RadioButton.md)**: For mutually exclusive options
- **[ContentSwitcher](ContentSwitcher.md)**: For switching between different content views

## References

- [Carbon Design System - Toggle Usage](https://www.carbondesignsystem.com/components/toggle/usage)
- [Carbon Design System - Toggle Accessibility](https://www.carbondesignsystem.com/components/toggle/accessibility)
- [Carbon React Storybook - Toggle](https://react.carbondesignsystem.com/?path=/docs/components-toggle--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Toggle)

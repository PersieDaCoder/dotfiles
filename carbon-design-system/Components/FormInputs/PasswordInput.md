# PasswordInput

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-passwordinput--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/text-input/usage) | [Accessibility](https://www.carbondesignsystem.com/components/text-input/accessibility)

## Overview

Password inputs are specialized text input fields that mask entered characters for security and include a visibility toggle button. They provide a secure way to collect sensitive password data while maintaining the option for users to reveal the password to verify their input.

## When to Use

- **Password entry**: For login forms, registration flows, or password change interfaces
- **Sensitive data**: When collecting any sensitive alphanumeric data that should be obscured during entry
- **Password validation**: When users need to enter and confirm passwords with format requirements
- **Multi-factor authentication**: For PIN codes or security codes that should be masked

## When Not to Use

- **Non-sensitive text**: Use TextInput for regular, non-confidential data entry
- **Username/email fields**: These should use TextInput for better usability
- **Numbers only**: Use NumberInput for numeric-only password alternatives (like PINs)
- **Long-form content**: Use TextArea for multi-line sensitive content

## Component API

### Basic Usage

```jsx
import { PasswordInput } from '@carbon/react';

<PasswordInput
  id="password"
  labelText="Password"
  helperText="Must be at least 8 characters"
/>
```

### With Validation

```jsx
<PasswordInput
  id="password"
  labelText="Password"
  invalid={!isValid}
  invalidText="Password must be at least 8 characters with one number"
  warn={isWeak}
  warnText="This password is weak. Consider adding special characters."
/>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier for the input |
| `labelText` | `node` | required | Label text displayed above the input |
| `type` | `string` | `"password"` | Input type (always password) |
| `value` | `string` | - | Controlled input value |
| `defaultValue` | `string` | - | Uncontrolled default value |
| `placeholder` | `string` | - | Placeholder text when empty |
| `helperText` | `node` | - | Helper text below the input |
| `hidePasswordLabel` | `string` | `"Hide password"` | Label for hide password button |
| `showPasswordLabel` | `string` | `"Show password"` | Label for show password button |
| `invalid` | `bool` | `false` | Show error state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `bool` | `false` | Show warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `bool` | `false` | Disable the input |
| `readOnly` | `bool` | `false` | Make input read-only |
| `light` | `bool` | `false` | Use light variant |
| `size` | `string` | `"md"` | Size: `"sm"`, `"md"`, `"lg"` |
| `onChange` | `func` | - | Change event handler |
| `onClick` | `func` | - | Click event handler |
| `onBlur` | `func` | - | Blur event handler |
| `className` | `string` | - | Additional CSS classes |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from the input field |
| `Space/Enter` | Toggles password visibility (when button is focused) |

### Screen Reader Support

- The component includes proper ARIA attributes for the visibility toggle button
- Screen readers announce the button's current state (show/hide)
- Invalid and warning states are properly communicated
- Helper text is associated with the input using `aria-describedby`

### Best Practices

- Always provide a clear `labelText`
- Use `helperText` to indicate password requirements before validation
- Ensure error messages are specific and actionable
- Don't disable the visibility toggle - users need to verify their input
- Maintain sufficient color contrast (4.5:1 minimum)

## Patterns

### Password Strength Indicator

```jsx
function PasswordWithStrength() {
  const [password, setPassword] = useState('');
  const strength = calculateStrength(password);

  return (
    <>
      <PasswordInput
        id="password"
        labelText="Create password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        warn={strength === 'weak'}
        warnText="Weak password"
      />
      <PasswordStrengthMeter strength={strength} />
    </>
  );
}
```

### Password Confirmation

```jsx
function PasswordConfirmation() {
  const [password, setPassword] = useState('');
  const [confirm, setConfirm] = useState('');
  const matches = password === confirm && confirm !== '';

  return (
    <Stack gap={5}>
      <PasswordInput
        id="password"
        labelText="Password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />
      <PasswordInput
        id="confirm"
        labelText="Confirm password"
        value={confirm}
        onChange={(e) => setConfirm(e.target.value)}
        invalid={confirm !== '' && !matches}
        invalidText="Passwords do not match"
      />
    </Stack>
  );
}
```

## Related Components

- **TextInput**: For non-sensitive text entry
- **NumberInput**: For numeric-only PIN codes
- **Form**: For wrapping password inputs in forms
- **FormGroup**: For grouping password with confirmation field

## References

- [Carbon Design System - Text Input](https://www.carbondesignsystem.com/components/text-input/usage)
- [React Storybook - PasswordInput](https://react.carbondesignsystem.com/?path=/docs/components-passwordinput--overview)
- [WCAG 2.1 - Password Inputs](https://www.w3.org/WAI/WCAG21/Understanding/identify-input-purpose.html)

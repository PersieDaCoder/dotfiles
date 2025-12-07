# ToastNotification

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-notifications-toast--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/notification/usage) | [Accessibility](https://www.carbondesignsystem.com/components/notification/accessibility)

## Overview

ToastNotification displays brief, non-blocking messages that appear temporarily. They're announced by screen readers but don't trap focus, making them ideal for status updates that don't require user action.

## When to Use

- For success confirmations after user actions
- For system status updates
- For non-critical error messages
- When feedback should auto-dismiss

## When Not to Use

- When user action is required (use ActionableNotification)
- For critical errors requiring acknowledgment (use Modal)
- For inline validation feedback (use form validation)
- For persistent information (use InlineNotification)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard toast notification |
| **Low Contrast** | Lighter visual treatment |
| **With Close Only** | Only close button, no timeout |

---

## Kinds

| Kind | Use Case |
|------|----------|
| `error` | Operation failed, error occurred |
| `info` | General information, neutral |
| `success` | Operation completed successfully |
| `warning` | Caution, potential issue |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `kind` | `'error' \| 'info' \| 'success' \| 'warning'` | required | Notification type |
| `title` | `string` | required | Main notification text |
| `subtitle` | `node` | - | Additional detail text |
| `caption` | `node` | - | Timestamp or additional info |
| `timeout` | `number` | `0` | Auto-dismiss delay in ms (0 = no auto-dismiss) |
| `lowContrast` | `boolean` | `false` | Use low contrast style |
| `hideCloseButton` | `boolean` | `false` | Hide close button |
| `onClose` | `function` | - | Called when notification closes |
| `onCloseButtonClick` | `function` | - | Called when close button clicked |
| `role` | `'alert' \| 'log' \| 'status'` | `'status'` | ARIA role |
| `statusIconDescription` | `string` | - | Icon description for screen readers |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Usage

```jsx
import { ToastNotification } from '@carbon/react';

<ToastNotification
  kind="success"
  title="Success"
  subtitle="Your changes have been saved"
  timeout={3000}
/>
```

### Different Kinds

```jsx
<ToastNotification kind="error" title="Error" subtitle="Operation failed" />
<ToastNotification kind="warning" title="Warning" subtitle="Check your input" />
<ToastNotification kind="info" title="Info" subtitle="New updates available" />
<ToastNotification kind="success" title="Success" subtitle="File uploaded" />
```

### With Caption

```jsx
<ToastNotification
  kind="info"
  title="New message"
  subtitle="You have a new notification"
  caption="2 minutes ago"
/>
```

### Low Contrast

```jsx
<ToastNotification
  kind="success"
  title="Saved"
  subtitle="Changes saved successfully"
  lowContrast
/>
```

### With Auto-Dismiss

```jsx
function AutoDismissNotification() {
  const [visible, setVisible] = useState(true);

  if (!visible) return null;

  return (
    <ToastNotification
      kind="success"
      title="Success"
      subtitle="Your changes have been saved"
      timeout={5000}
      onClose={() => setVisible(false)}
    />
  );
}
```

### Toast Container Pattern

```jsx
function ToastContainer({ notifications, onClose }) {
  return (
    <div className="toast-container">
      {notifications.map((notification) => (
        <ToastNotification
          key={notification.id}
          kind={notification.kind}
          title={notification.title}
          subtitle={notification.subtitle}
          timeout={3000}
          onClose={() => onClose(notification.id)}
        />
      ))}
    </div>
  );
}
```

---

## Accessibility

- Automatically announced by screen readers
- Doesn't trap focus (non-blocking)
- Use `role="alert"` for urgent messages
- Provide `statusIconDescription` for icon context
- Ensure sufficient display time (3-5 seconds minimum)

---

## Related Components

- [InlineNotification](InlineNotification.md) - For inline, persistent messages
- [ActionableNotification](ActionableNotification.md) - When user action is required

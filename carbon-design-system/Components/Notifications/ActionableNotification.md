# ActionableNotification

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-notifications-actionable--overview) | [Usage Guidelines](https://carbondesignsystem.com/components/notification/usage) | [Accessibility](https://carbondesignsystem.com/components/notification/accessibility)

## Overview
ActionableNotification is an interactive notification component that displays messages requiring user action or response. It extends the functionality of InlineNotification by including action buttons, allowing users to respond directly to the notification without navigating elsewhere.

## When to Use

- **User action required**: Display notifications that require immediate user response or decision-making
- **Confirmable operations**: Present actions that users can accept, decline, or modify before proceeding
- **Retry mechanisms**: Offer users the ability to retry failed operations directly from the notification
- **Workflow decisions**: Present choices that affect the current workflow or process
- **Reversible actions**: Allow users to undo recent actions or revert changes
- **Multi-step processes**: Guide users through sequential actions with contextual prompts

## When Not to Use

- **Informational messages**: Use InlineNotification for messages that don't require user action
- **Critical blocking errors**: Use Modal for errors that must prevent further interaction
- **Simple confirmations**: Use InlineNotification with auto-dismiss for simple success messages
- **Complex forms**: Use dedicated form components for multi-field input requirements
- **Navigation prompts**: Use dedicated navigation components for routing decisions

## Component API

### Basic Usage
```jsx
import { ActionableNotification } from '@carbon/react';

function App() {
  return (
    <ActionableNotification
      kind="error"
      title="Action required"
      subtitle="Your session will expire soon"
      actionButtonLabel="Extend session"
      onActionButtonClick={() => console.log('Session extended')}
    />
  );
}
```

### Different Action Types
```jsx
import { ActionableNotification } from '@carbon/react';

function ActionExamples() {
  const handleRetry = () => {
    console.log('Retrying operation...');
  };

  const handleUndo = () => {
    console.log('Undoing changes...');
  };

  const handleReview = () => {
    console.log('Opening review...');
  };

  return (
    <div>
      {/* Error with retry action */}
      <ActionableNotification
        kind="error"
        title="Upload failed"
        subtitle="Connection timeout while uploading file.jpg"
        actionButtonLabel="Retry"
        onActionButtonClick={handleRetry}
        onClose={() => console.log('Closed')}
      />

      {/* Success with undo action */}
      <ActionableNotification
        kind="success"
        title="Item deleted"
        subtitle="The item has been removed from your list"
        actionButtonLabel="Undo"
        onActionButtonClick={handleUndo}
        onClose={() => console.log('Closed')}
      />

      {/* Warning with review action */}
      <ActionableNotification
        kind="warning"
        title="Changes detected"
        subtitle="You have unsaved changes that may be lost"
        actionButtonLabel="Review changes"
        onActionButtonClick={handleReview}
        onClose={() => console.log('Closed')}
      />
    </div>
  );
}
```

### Inline Variant
```jsx
import { ActionableNotification } from '@carbon/react';

function InlineActionable() {
  return (
    <ActionableNotification
      inline
      kind="info"
      title="Update available"
      subtitle="A new version of this application is ready"
      actionButtonLabel="Update now"
      onActionButtonClick={() => console.log('Updating...')}
    />
  );
}
```

### Low Contrast with Custom Close Handler
```jsx
import { useState } from 'react';
import { ActionableNotification } from '@carbon/react';

function CustomActionable() {
  const [visible, setVisible] = useState(true);

  const handleAction = () => {
    console.log('Action performed');
    setVisible(false);
  };

  if (!visible) return null;

  return (
    <ActionableNotification
      lowContrast
      kind="warning"
      title="Storage limit approaching"
      subtitle="You've used 90% of your storage quota"
      actionButtonLabel="Upgrade storage"
      onActionButtonClick={handleAction}
      onClose={() => setVisible(false)}
      closeOnEscape={true}
    />
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| kind | `'error'` \| `'info'` \| `'info-square'` \| `'success'` \| `'warning'` \| `'warning-alt'` | `'info'` | Specify the type of notification |
| title | `string` | - | Required. Notification title |
| subtitle | `string` \| `ReactNode` | - | Notification subtitle or message content |
| actionButtonLabel | `string` | - | Required. Label for the action button |
| onActionButtonClick | `(event: MouseEvent) => void` | - | Callback when action button is clicked |
| inline | `boolean` | `false` | Use inline variant with reduced spacing |
| lowContrast | `boolean` | `false` | Use low contrast variant for subtle appearance |
| hideCloseButton | `boolean` | `false` | Hide the close button |
| onClose | `(event: Event) => void` | - | Callback when notification is closed (any method) |
| onCloseButtonClick | `(event: MouseEvent) => void` | - | Callback when close button is clicked |
| role | `'alert'` \| `'alertdialog'` \| `'status'` | `'alertdialog'` | ARIA role for accessibility |
| statusIconDescription | `string` | - | Description for the status icon (accessibility) |
| closeOnEscape | `boolean` | `true` | Close notification when Escape key is pressed |
| className | `string` | - | Additional CSS class names |
| ariaLabel | `string` | - | ARIA label for the notification |
| hasFocus | `boolean` | `true` | Auto-focus the notification when it appears |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Move focus between action button and close button |
| `Shift + Tab` | Move focus backwards between buttons |
| `Enter` or `Space` | Activate the focused button (action or close) |
| `Escape` | Close the notification (if closeOnEscape is true) |

### Screen Reader Support

ActionableNotification provides comprehensive screen reader support:
- Uses `role="alertdialog"` by default for interactive notifications
- Automatically receives focus when displayed (if hasFocus is true)
- Action button is properly labeled and accessible
- Close button has descriptive ARIA label
- Status icon meaning is conveyed through accessible text
- Title and subtitle are announced when notification appears

### Best Practices

1. **Clear action labels**: Use descriptive, action-oriented button labels (e.g., "Retry upload" instead of "OK")
2. **Appropriate urgency**: Match the notification kind to the action urgency
3. **Focus management**: Ensure focus moves logically when notification appears or closes
4. **Action outcomes**: Provide clear feedback when action button is clicked
5. **Keyboard accessibility**: Ensure all interactive elements are keyboard accessible
6. **Timeout consideration**: For time-sensitive actions, display countdown or urgency indicator
7. **Single primary action**: Limit to one primary action per notification for clarity
8. **Dismissible notifications**: Always allow users to dismiss actionable notifications

## Patterns

### Retry Failed Operation
```jsx
import { useState } from 'react';
import { ActionableNotification, Button } from '@carbon/react';

function RetryPattern() {
  const [status, setStatus] = useState('idle');
  const [error, setError] = useState(null);

  const uploadFile = async () => {
    setStatus('uploading');
    setError(null);

    try {
      // Simulate upload
      await new Promise((resolve, reject) => {
        setTimeout(() => {
          Math.random() > 0.5 ? resolve() : reject(new Error('Network error'));
        }, 2000);
      });

      setStatus('success');
    } catch (err) {
      setStatus('error');
      setError(err.message);
    }
  };

  const handleRetry = () => {
    uploadFile();
  };

  return (
    <div>
      {status === 'error' && (
        <ActionableNotification
          kind="error"
          title="Upload failed"
          subtitle={`Error: ${error}. Please check your connection and try again.`}
          actionButtonLabel="Retry upload"
          onActionButtonClick={handleRetry}
          onClose={() => setStatus('idle')}
          style={{ marginBottom: '1rem' }}
        />
      )}

      {status === 'success' && (
        <ActionableNotification
          kind="success"
          title="Upload successful"
          subtitle="Your file has been uploaded and processed"
          actionButtonLabel="View file"
          onActionButtonClick={() => console.log('View file')}
          onClose={() => setStatus('idle')}
          style={{ marginBottom: '1rem' }}
        />
      )}

      <Button onClick={uploadFile} disabled={status === 'uploading'}>
        {status === 'uploading' ? 'Uploading...' : 'Upload File'}
      </Button>
    </div>
  );
}
```

### Undo Destructive Action
```jsx
import { useState, useEffect } from 'react';
import { ActionableNotification, Button } from '@carbon/react';

function UndoPattern() {
  const [items, setItems] = useState([
    { id: 1, name: 'Item 1' },
    { id: 2, name: 'Item 2' },
    { id: 3, name: 'Item 3' }
  ]);
  const [deletedItem, setDeletedItem] = useState(null);
  const [showUndo, setShowUndo] = useState(false);

  useEffect(() => {
    if (showUndo) {
      const timer = setTimeout(() => {
        setShowUndo(false);
        setDeletedItem(null);
      }, 10000); // 10 second undo window

      return () => clearTimeout(timer);
    }
  }, [showUndo]);

  const handleDelete = (item) => {
    setDeletedItem(item);
    setItems(prev => prev.filter(i => i.id !== item.id));
    setShowUndo(true);
  };

  const handleUndo = () => {
    if (deletedItem) {
      setItems(prev => [...prev, deletedItem].sort((a, b) => a.id - b.id));
      setDeletedItem(null);
      setShowUndo(false);
    }
  };

  return (
    <div>
      {showUndo && deletedItem && (
        <ActionableNotification
          kind="info"
          title="Item deleted"
          subtitle={`${deletedItem.name} has been removed`}
          actionButtonLabel="Undo"
          onActionButtonClick={handleUndo}
          onClose={() => {
            setShowUndo(false);
            setDeletedItem(null);
          }}
          style={{ marginBottom: '1rem' }}
        />
      )}

      <div>
        {items.map(item => (
          <div key={item.id} style={{ marginBottom: '0.5rem' }}>
            <span>{item.name}</span>
            <Button
              size="sm"
              kind="danger--ghost"
              onClick={() => handleDelete(item)}
              style={{ marginLeft: '1rem' }}
            >
              Delete
            </Button>
          </div>
        ))}
      </div>
    </div>
  );
}
```

### Session Timeout Warning
```jsx
import { useState, useEffect } from 'react';
import { ActionableNotification } from '@carbon/react';

function SessionTimeoutWarning() {
  const [showWarning, setShowWarning] = useState(false);
  const [timeRemaining, setTimeRemaining] = useState(60);

  useEffect(() => {
    // Simulate session timeout warning
    const warningTimer = setTimeout(() => {
      setShowWarning(true);
    }, 5000);

    return () => clearTimeout(warningTimer);
  }, []);

  useEffect(() => {
    if (showWarning && timeRemaining > 0) {
      const countdown = setInterval(() => {
        setTimeRemaining(prev => prev - 1);
      }, 1000);

      return () => clearInterval(countdown);
    } else if (timeRemaining === 0) {
      // Handle session expiration
      console.log('Session expired');
      setShowWarning(false);
    }
  }, [showWarning, timeRemaining]);

  const handleExtendSession = () => {
    console.log('Session extended');
    setShowWarning(false);
    setTimeRemaining(60);
  };

  if (!showWarning) return null;

  return (
    <ActionableNotification
      kind="warning"
      title="Session expiring soon"
      subtitle={`Your session will expire in ${timeRemaining} seconds due to inactivity`}
      actionButtonLabel="Extend session"
      onActionButtonClick={handleExtendSession}
      hideCloseButton={true}
      hasFocus={true}
    />
  );
}
```

### Form Unsaved Changes Warning
```jsx
import { useState, useEffect } from 'react';
import { ActionableNotification, TextInput, Button, Form } from '@carbon/react';

function UnsavedChangesWarning() {
  const [formData, setFormData] = useState({ name: '', email: '' });
  const [savedData, setSavedData] = useState({ name: '', email: '' });
  const [hasUnsavedChanges, setHasUnsavedChanges] = useState(false);

  useEffect(() => {
    const hasChanges =
      formData.name !== savedData.name ||
      formData.email !== savedData.email;
    setHasUnsavedChanges(hasChanges);
  }, [formData, savedData]);

  const handleSave = () => {
    setSavedData(formData);
    console.log('Saved:', formData);
  };

  const handleDiscard = () => {
    setFormData(savedData);
  };

  return (
    <div>
      {hasUnsavedChanges && (
        <ActionableNotification
          inline
          lowContrast
          kind="warning"
          title="Unsaved changes"
          subtitle="You have unsaved changes that will be lost if you navigate away"
          actionButtonLabel="Save changes"
          onActionButtonClick={handleSave}
          onClose={handleDiscard}
          style={{ marginBottom: '1rem' }}
        />
      )}

      <Form>
        <TextInput
          id="name"
          labelText="Name"
          value={formData.name}
          onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
          style={{ marginBottom: '1rem' }}
        />
        <TextInput
          id="email"
          labelText="Email"
          value={formData.email}
          onChange={(e) => setFormData(prev => ({ ...prev, email: e.target.value }))}
          style={{ marginBottom: '1rem' }}
        />
        <Button onClick={handleSave}>Save</Button>
      </Form>
    </div>
  );
}
```

### Update Available Notification
```jsx
import { useState, useEffect } from 'react';
import { ActionableNotification } from '@carbon/react';

function UpdateNotification() {
  const [updateAvailable, setUpdateAvailable] = useState(false);
  const [updating, setUpdating] = useState(false);

  useEffect(() => {
    // Simulate update check
    const checkForUpdates = () => {
      setTimeout(() => {
        setUpdateAvailable(true);
      }, 3000);
    };

    checkForUpdates();
  }, []);

  const handleUpdate = async () => {
    setUpdating(true);

    try {
      // Simulate update process
      await new Promise(resolve => setTimeout(resolve, 3000));

      // Reload page after update
      window.location.reload();
    } catch (error) {
      console.error('Update failed:', error);
      setUpdating(false);
    }
  };

  if (!updateAvailable) return null;

  return (
    <ActionableNotification
      kind="info"
      title={updating ? 'Updating application...' : 'Update available'}
      subtitle={
        updating
          ? 'Please wait while the application updates. This page will reload automatically.'
          : 'A new version of this application is available. Update now to get the latest features and improvements.'
      }
      actionButtonLabel={updating ? 'Updating...' : 'Update now'}
      onActionButtonClick={handleUpdate}
      onClose={() => setUpdateAvailable(false)}
      hideCloseButton={updating}
    />
  );
}
```

## Related Components

- **InlineNotification**: Use for non-interactive notifications that don't require user action
- **ToastNotification**: Use for temporary, auto-dismissing notifications at the application level
- **Modal**: Use for critical decisions that require full user attention and block interaction
- **ConfirmationModal**: Use for explicit confirmation of destructive or important actions
- **Banner**: Use for persistent announcements that don't require immediate action
- **InlineLoading**: Use to show action progress after user clicks the action button

## References

- [Carbon Design System - Notification](https://carbondesignsystem.com/components/notification/usage)
- [Carbon React Storybook - ActionableNotification](https://react.carbondesignsystem.com/?path=/docs/components-notifications-actionable--overview)
- [Notification Accessibility](https://carbondesignsystem.com/components/notification/accessibility)
- [ARIA Alertdialog Role](https://www.w3.org/WAI/ARIA/apg/patterns/alertdialog/)

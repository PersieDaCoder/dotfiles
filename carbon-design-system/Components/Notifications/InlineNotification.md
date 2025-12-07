# InlineNotification

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-notifications-inline--overview) | [Usage Guidelines](https://carbondesignsystem.com/components/notification/usage) | [Accessibility](https://carbondesignsystem.com/components/notification/accessibility)

## Overview
InlineNotification is a non-modal, time-based or closable component that displays brief messages about app processes or system status. It appears within the page content flow and can communicate success, informational, warning, or error messages without interrupting the user's workflow.

## When to Use

- **Contextual feedback**: Provide immediate feedback about an action or operation that just completed within a specific section of the page
- **Form validation**: Display validation errors or success messages directly above or below form sections
- **Process status updates**: Communicate the status of background processes or system updates to users
- **Non-critical alerts**: Present informational messages that don't require immediate action or interrupt user workflow
- **Persistent notifications**: Show notifications that should remain visible until explicitly dismissed by the user
- **Section-specific messages**: Communicate messages related to a particular component or page section

## When Not to Use

- **Critical system errors**: Use ActionableNotification or Modal for errors requiring immediate attention
- **Global notifications**: Use Toast notifications for app-wide messages that appear temporarily
- **Interactive notifications**: Use ActionableNotification when users need to take action on the notification
- **Transient messages**: Use Toast notifications for temporary messages that auto-dismiss
- **Full-page blocking alerts**: Use Modal dialogs for critical messages that must block interaction

## Component API

### Basic Usage
```jsx
import { InlineNotification } from '@carbon/react';

function App() {
  return (
    <InlineNotification
      kind="success"
      title="Success"
      subtitle="Your changes have been saved successfully"
    />
  );
}
```

### Different Notification Types
```jsx
import { InlineNotification } from '@carbon/react';

function NotificationExamples() {
  return (
    <div>
      {/* Success notification */}
      <InlineNotification
        kind="success"
        title="Upload complete"
        subtitle="Your file has been uploaded successfully"
        onClose={() => console.log('Closed')}
      />

      {/* Error notification */}
      <InlineNotification
        kind="error"
        title="Upload failed"
        subtitle="There was a problem uploading your file. Please try again."
        onClose={() => console.log('Closed')}
      />

      {/* Warning notification */}
      <InlineNotification
        kind="warning"
        title="Storage space low"
        subtitle="You have less than 10% storage space remaining"
        onClose={() => console.log('Closed')}
      />

      {/* Info notification */}
      <InlineNotification
        kind="info"
        title="New features available"
        subtitle="Check out the latest updates to your dashboard"
        onClose={() => console.log('Closed')}
      />
    </div>
  );
}
```

### Low Contrast Variant
```jsx
import { InlineNotification } from '@carbon/react';

function LowContrastNotification() {
  return (
    <InlineNotification
      kind="info"
      lowContrast
      title="Low contrast notification"
      subtitle="This notification uses a more subtle appearance"
      onClose={() => console.log('Closed')}
    />
  );
}
```

### Controlled Visibility
```jsx
import { useState } from 'react';
import { InlineNotification, Button } from '@carbon/react';

function ControlledNotification() {
  const [isVisible, setIsVisible] = useState(false);

  return (
    <div>
      <Button onClick={() => setIsVisible(true)}>
        Show Notification
      </Button>

      {isVisible && (
        <InlineNotification
          kind="success"
          title="Changes saved"
          subtitle="Your profile has been updated"
          onClose={() => setIsVisible(false)}
          onCloseButtonClick={() => setIsVisible(false)}
        />
      )}
    </div>
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| kind | `'error'` \| `'info'` \| `'info-square'` \| `'success'` \| `'warning'` \| `'warning-alt'` | `'info'` | Specify the type of notification |
| title | `string` | - | Required. Notification title |
| subtitle | `string` \| `ReactNode` | - | Notification subtitle or message content |
| lowContrast | `boolean` | `false` | Use low contrast variant for more subtle appearance |
| hideCloseButton | `boolean` | `false` | Hide the close button, making the notification non-dismissible |
| onClose | `(event: Event) => void` | - | Callback when notification is closed (any method) |
| onCloseButtonClick | `(event: MouseEvent) => void` | - | Callback when close button is clicked |
| role | `'alert'` \| `'log'` \| `'status'` | `'alert'` | ARIA role for accessibility |
| statusIconDescription | `string` | - | Description for the status icon (accessibility) |
| closeOnEscape | `boolean` | `true` | Close notification when Escape key is pressed |
| className | `string` | - | Additional CSS class names |
| ariaLabel | `string` | - | ARIA label for the notification |
| timeout | `number` | - | Auto-close after specified milliseconds |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Move focus to the close button |
| `Enter` or `Space` | Close the notification (when close button is focused) |
| `Escape` | Close the notification (if closeOnEscape is true) |

### Screen Reader Support

InlineNotification announces its presence and content to screen readers automatically:
- Uses `role="alert"` by default for immediate announcement of important messages
- Can use `role="status"` for less urgent notifications
- Can use `role="log"` for sequential updates
- Icon meaning is conveyed through accessible text
- Close button has proper ARIA labeling

### Best Practices

1. **Provide meaningful titles**: Use clear, concise titles that describe the notification purpose
2. **Use appropriate kind**: Match the notification type to the message severity
3. **Keep messages brief**: Notification text should be scannable and concise
4. **Use proper roles**: Choose the correct ARIA role based on message urgency
5. **Don't overuse**: Too many notifications can be overwhelming and reduce effectiveness
6. **Position logically**: Place notifications near the content or action they relate to
7. **Allow dismissal**: Provide a way to close persistent notifications
8. **Consider timing**: For auto-dismissing notifications, allow sufficient reading time

## Patterns

### Form Validation Feedback
```jsx
import { useState } from 'react';
import { InlineNotification, TextInput, Button, Form } from '@carbon/react';

function FormWithValidation() {
  const [email, setEmail] = useState('');
  const [error, setError] = useState(null);
  const [success, setSuccess] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    setError(null);
    setSuccess(false);

    if (!email.includes('@')) {
      setError('Please enter a valid email address');
      return;
    }

    // Submit logic here
    setSuccess(true);
    setTimeout(() => setSuccess(false), 5000);
  };

  return (
    <Form onSubmit={handleSubmit}>
      {error && (
        <InlineNotification
          kind="error"
          title="Validation error"
          subtitle={error}
          onClose={() => setError(null)}
          style={{ marginBottom: '1rem' }}
        />
      )}

      {success && (
        <InlineNotification
          kind="success"
          title="Success"
          subtitle="Your email has been saved"
          onClose={() => setSuccess(false)}
          style={{ marginBottom: '1rem' }}
        />
      )}

      <TextInput
        id="email"
        labelText="Email address"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        invalid={!!error}
      />

      <Button type="submit" style={{ marginTop: '1rem' }}>
        Submit
      </Button>
    </Form>
  );
}
```

### File Upload Status
```jsx
import { useState } from 'react';
import { InlineNotification, FileUploader, Button } from '@carbon/react';

function FileUploadWithStatus() {
  const [uploadStatus, setUploadStatus] = useState(null);

  const handleUpload = async (files) => {
    setUploadStatus({ kind: 'info', message: 'Uploading file...' });

    try {
      // Simulate upload
      await new Promise(resolve => setTimeout(resolve, 2000));

      if (Math.random() > 0.3) {
        setUploadStatus({
          kind: 'success',
          message: `${files[0].name} uploaded successfully`
        });
      } else {
        throw new Error('Upload failed');
      }
    } catch (error) {
      setUploadStatus({
        kind: 'error',
        message: 'Upload failed. Please try again.'
      });
    }
  };

  return (
    <div>
      {uploadStatus && (
        <InlineNotification
          kind={uploadStatus.kind}
          title={uploadStatus.kind === 'success' ? 'Upload complete' :
                 uploadStatus.kind === 'error' ? 'Upload failed' : 'Uploading'}
          subtitle={uploadStatus.message}
          onClose={() => setUploadStatus(null)}
          style={{ marginBottom: '1rem' }}
          hideCloseButton={uploadStatus.kind === 'info'}
        />
      )}

      <FileUploader
        labelTitle="Upload file"
        labelDescription="Max file size is 10MB"
        buttonLabel="Add file"
        onChange={(e) => handleUpload(e.target.files)}
      />
    </div>
  );
}
```

### Multiple Notification Stack
```jsx
import { useState } from 'react';
import { InlineNotification, Button } from '@carbon/react';

function NotificationStack() {
  const [notifications, setNotifications] = useState([]);

  const addNotification = (kind, title, subtitle) => {
    const id = Date.now();
    setNotifications(prev => [...prev, { id, kind, title, subtitle }]);
  };

  const removeNotification = (id) => {
    setNotifications(prev => prev.filter(n => n.id !== id));
  };

  return (
    <div>
      <div style={{ marginBottom: '1rem' }}>
        <Button
          onClick={() => addNotification('success', 'Success', 'Operation completed')}
          style={{ marginRight: '0.5rem' }}
        >
          Add Success
        </Button>
        <Button
          onClick={() => addNotification('error', 'Error', 'Operation failed')}
          kind="danger"
        >
          Add Error
        </Button>
      </div>

      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
        {notifications.map(notification => (
          <InlineNotification
            key={notification.id}
            kind={notification.kind}
            title={notification.title}
            subtitle={notification.subtitle}
            onClose={() => removeNotification(notification.id)}
          />
        ))}
      </div>
    </div>
  );
}
```

### Auto-Dismissing Notification
```jsx
import { useState, useEffect } from 'react';
import { InlineNotification, Button } from '@carbon/react';

function AutoDismissNotification() {
  const [notification, setNotification] = useState(null);

  useEffect(() => {
    if (notification) {
      const timer = setTimeout(() => {
        setNotification(null);
      }, 5000);

      return () => clearTimeout(timer);
    }
  }, [notification]);

  const showNotification = () => {
    setNotification({
      kind: 'success',
      title: 'Auto-dismiss notification',
      subtitle: 'This notification will automatically close in 5 seconds'
    });
  };

  return (
    <div>
      <Button onClick={showNotification}>
        Show Auto-Dismiss Notification
      </Button>

      {notification && (
        <InlineNotification
          kind={notification.kind}
          title={notification.title}
          subtitle={notification.subtitle}
          onClose={() => setNotification(null)}
          style={{ marginTop: '1rem' }}
        />
      )}
    </div>
  );
}
```

### Data Table Operation Feedback
```jsx
import { useState } from 'react';
import { InlineNotification, DataTable, Button } from '@carbon/react';

function DataTableWithNotifications() {
  const [notification, setNotification] = useState(null);
  const [rows, setRows] = useState([
    { id: '1', name: 'Item 1', status: 'Active' },
    { id: '2', name: 'Item 2', status: 'Inactive' }
  ]);

  const handleDelete = (id) => {
    try {
      setRows(prev => prev.filter(row => row.id !== id));
      setNotification({
        kind: 'success',
        title: 'Item deleted',
        subtitle: 'The item has been removed from the list'
      });
      setTimeout(() => setNotification(null), 3000);
    } catch (error) {
      setNotification({
        kind: 'error',
        title: 'Delete failed',
        subtitle: 'Unable to delete the item. Please try again.'
      });
    }
  };

  return (
    <div>
      {notification && (
        <InlineNotification
          kind={notification.kind}
          title={notification.title}
          subtitle={notification.subtitle}
          onClose={() => setNotification(null)}
          style={{ marginBottom: '1rem' }}
        />
      )}

      <DataTable rows={rows} headers={[
        { key: 'name', header: 'Name' },
        { key: 'status', header: 'Status' },
        { key: 'actions', header: 'Actions' }
      ]}>
        {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
          <table {...getTableProps()}>
            <thead>
              <tr>
                {headers.map(header => (
                  <th {...getHeaderProps({ header })} key={header.key}>
                    {header.header}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map(row => (
                <tr {...getRowProps({ row })} key={row.id}>
                  {row.cells.map(cell => (
                    <td key={cell.id}>
                      {cell.info.header === 'actions' ? (
                        <Button
                          size="sm"
                          kind="danger--ghost"
                          onClick={() => handleDelete(row.id)}
                        >
                          Delete
                        </Button>
                      ) : cell.value}
                    </td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </DataTable>
    </div>
  );
}
```

## Related Components

- **ActionableNotification**: Use when the notification requires user action or interaction
- **ToastNotification**: Use for temporary, auto-dismissing notifications that appear globally
- **Modal**: Use for critical messages that require user attention and block interaction
- **Banner**: Use for persistent, page-level announcements or system status messages
- **ErrorBoundary**: Use to catch and display React component errors gracefully
- **InlineLoading**: Use to show loading states inline with content

## References

- [Carbon Design System - Notification](https://carbondesignsystem.com/components/notification/usage)
- [Carbon React Storybook - InlineNotification](https://react.carbondesignsystem.com/?path=/docs/components-notifications-inline--overview)
- [Notification Accessibility](https://carbondesignsystem.com/components/notification/accessibility)
- [ARIA Alert Role](https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html)

# InlineLoading

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-inlineloading--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/loading/usage) | [Accessibility](https://www.carbondesignsystem.com/components/loading/accessibility)

## Overview

Inline loading indicators provide visual feedback about loading states within specific UI sections like buttons, form fields, or inline actions. They show users that a process is active without blocking the entire interface, displaying status changes from active to success or error states.

## When to Use

- **Button actions**: Show loading state within buttons during form submissions or API calls
- **Inline operations**: Indicate processing for specific actions without blocking the page
- **Form field validation**: Display loading during asynchronous validation checks
- **Localized loading**: Show loading state for a specific section or component
- **Status transitions**: Communicate progression through active, success, and error states
- **Quick operations**: Operations expected to complete within seconds

## When Not to Use

- **Page-level loading**: Use Loading component for full page or major section loads
- **Initial data load**: Use SkeletonText or SkeletonPlaceholder for content placeholders
- **Long operations**: Use ProgressBar or ProgressIndicator for operations >10 seconds
- **Background processes**: Use notifications for processes that don't need immediate feedback
- **Multiple simultaneous loads**: Can create visual clutter; consider consolidating feedback

## Component API

### Basic Usage

```jsx
import { InlineLoading } from '@carbon/react';

<InlineLoading
  status="active"
  description="Loading..."
/>
```

### All Status States

```jsx
// Active state - shows spinner
<InlineLoading status="active" description="Saving..." />

// Success state - shows checkmark
<InlineLoading status="finished" description="Saved!" />

// Error state - shows error icon
<InlineLoading status="error" description="Failed to save" />

// Inactive state - hidden
<InlineLoading status="inactive" description="" />
```

### In Button

```jsx
function SaveButton({ onSave }) {
  const [status, setStatus] = useState('inactive');

  const handleSave = async () => {
    setStatus('active');
    try {
      await onSave();
      setStatus('finished');
      setTimeout(() => setStatus('inactive'), 2000);
    } catch (error) {
      setStatus('error');
      setTimeout(() => setStatus('inactive'), 3000);
    }
  };

  return (
    <Button onClick={handleSave} disabled={status === 'active'}>
      {status === 'inactive' ? 'Save' : <InlineLoading status={status} description="" />}
    </Button>
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `status` | `string` | `"active"` | Loading status: `"inactive"`, `"active"`, `"finished"`, `"error"` |
| `description` | `string` | - | Text describing the loading state |
| `iconDescription` | `string` | - | Accessible label for the status icon |
| `onSuccess` | `func` | - | Callback fired when status changes to "finished" |
| `successDelay` | `number` | `1500` | Delay in ms before firing onSuccess callback |
| `className` | `string` | - | Additional CSS classes |

## Accessibility

### Screen Reader Support

- Status changes are announced to screen readers
- Loading spinner has proper ARIA labels
- Success and error states communicated clearly
- Description text provides context

### Best Practices

- Always provide meaningful `description` text
- Keep descriptions concise (2-4 words)
- Show success state briefly before returning to inactive
- Don't leave in error state indefinitely
- Disable triggering element during active state

## Patterns

### Form Submission

```jsx
function ContactForm() {
  const [loadingStatus, setLoadingStatus] = useState('inactive');
  const [formData, setFormData] = useState({ name: '', email: '' });

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoadingStatus('active');

    try {
      await submitForm(formData);
      setLoadingStatus('finished');
      setTimeout(() => {
        setLoadingStatus('inactive');
        setFormData({ name: '', email: '' });
      }, 2000);
    } catch (error) {
      setLoadingStatus('error');
      setTimeout(() => setLoadingStatus('inactive'), 3000);
    }
  };

  return (
    <Form onSubmit={handleSubmit}>
      <TextInput
        id="name"
        labelText="Name"
        value={formData.name}
        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
      />
      <TextInput
        id="email"
        labelText="Email"
        value={formData.email}
        onChange={(e) => setFormData({ ...formData, email: e.target.value })}
      />
      <Button type="submit" disabled={loadingStatus === 'active'}>
        {loadingStatus === 'inactive' ? 'Submit' : ''}
      </Button>
      {loadingStatus !== 'inactive' && (
        <InlineLoading
          status={loadingStatus}
          description={
            loadingStatus === 'active' ? 'Submitting...' :
            loadingStatus === 'finished' ? 'Submitted!' :
            'Submission failed'
          }
        />
      )}
    </Form>
  );
}
```

### Async Validation

```jsx
function UsernameInput() {
  const [username, setUsername] = useState('');
  const [validationStatus, setValidationStatus] = useState('inactive');

  const validateUsername = async (value) => {
    if (!value) {
      setValidationStatus('inactive');
      return;
    }

    setValidationStatus('active');
    try {
      const available = await checkUsernameAvailability(value);
      setValidationStatus(available ? 'finished' : 'error');
    } catch (error) {
      setValidationStatus('error');
    }
  };

  const handleChange = (e) => {
    setUsername(e.target.value);
    validateUsername(e.target.value);
  };

  return (
    <div>
      <TextInput
        id="username"
        labelText="Username"
        value={username}
        onChange={handleChange}
      />
      {validationStatus !== 'inactive' && (
        <InlineLoading
          status={validationStatus}
          description={
            validationStatus === 'active' ? 'Checking availability...' :
            validationStatus === 'finished' ? 'Available!' :
            'Username taken'
          }
        />
      )}
    </div>
  );
}
```

### Action with Retry

```jsx
function DeleteAction({ itemId, onDelete }) {
  const [status, setStatus] = useState('inactive');

  const handleDelete = async () => {
    setStatus('active');
    try {
      await onDelete(itemId);
      setStatus('finished');
    } catch (error) {
      setStatus('error');
    }
  };

  const handleRetry = () => {
    setStatus('inactive');
  };

  return (
    <div>
      {status === 'inactive' && (
        <Button kind="danger" onClick={handleDelete}>
          Delete
        </Button>
      )}
      {status === 'active' && (
        <InlineLoading status="active" description="Deleting..." />
      )}
      {status === 'finished' && (
        <InlineLoading status="finished" description="Deleted successfully" />
      )}
      {status === 'error' && (
        <>
          <InlineLoading status="error" description="Delete failed" />
          <Button kind="ghost" onClick={handleRetry}>
            Retry
          </Button>
        </>
      )}
    </div>
  );
}
```

### Multi-step Process

```jsx
function MultiStepLoader() {
  const [currentStep, setCurrentStep] = useState(0);
  const [status, setStatus] = useState('inactive');

  const steps = [
    { label: 'Validating data...', action: validateData },
    { label: 'Uploading files...', action: uploadFiles },
    { label: 'Processing...', action: processData },
    { label: 'Finalizing...', action: finalize }
  ];

  const executeSteps = async () => {
    setStatus('active');

    for (let i = 0; i < steps.length; i++) {
      setCurrentStep(i);
      try {
        await steps[i].action();
      } catch (error) {
        setStatus('error');
        return;
      }
    }

    setStatus('finished');
    setTimeout(() => {
      setStatus('inactive');
      setCurrentStep(0);
    }, 2000);
  };

  return (
    <div>
      <Button onClick={executeSteps} disabled={status === 'active'}>
        Start Process
      </Button>
      {status !== 'inactive' && (
        <InlineLoading
          status={status === 'finished' ? 'finished' : status === 'error' ? 'error' : 'active'}
          description={
            status === 'finished' ? 'Complete!' :
            status === 'error' ? 'Failed at step ' + (currentStep + 1) :
            steps[currentStep].label
          }
        />
      )}
    </div>
  );
}
```

## Status Lifecycle

```
inactive → active → finished → inactive
                 ↘ error → inactive
```

**Recommended Timings:**
- **Active**: As long as operation takes
- **Finished**: 1.5-2 seconds before returning to inactive
- **Error**: 3-5 seconds before returning to inactive or requiring user action

## Related Components

- **Loading**: For full page or section loading states
- **ProgressBar**: For determinate progress with percentage
- **ProgressIndicator**: For multi-step processes with defined steps
- **SkeletonText**: For content loading placeholders
- **Button**: Often used together with InlineLoading

## References

- [Carbon Design System - Loading](https://www.carbondesignsystem.com/components/loading/usage)
- [React Storybook - InlineLoading](https://react.carbondesignsystem.com/?path=/docs/components-inlineloading--overview)
- [WCAG 2.1 - Status Messages](https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html)

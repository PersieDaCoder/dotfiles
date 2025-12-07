# ComposedModal

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-composedmodal--overview) | [Usage Guidelines](https://carbondesignsystem.com/components/modal/usage) | [Accessibility](https://carbondesignsystem.com/components/modal/accessibility)

## Overview
ComposedModal is a flexible, composable modal dialog component that provides granular control over modal content and behavior. Unlike the basic Modal component, ComposedModal allows you to compose custom modal layouts using ModalHeader, ModalBody, and ModalFooter sub-components, giving you complete control over structure and styling.

## When to Use

- **Complex modal layouts**: Build modals with custom layouts, multiple sections, or specialized content arrangements
- **Form dialogs**: Create modal forms with validation, multiple steps, or complex input requirements
- **Confirmation dialogs**: Build custom confirmation flows with detailed information and multiple actions
- **Multi-step wizards**: Implement wizard-style interfaces with progressive disclosure
- **Data presentation**: Display detailed information, previews, or content that requires more space than inline views
- **Custom workflows**: Design modal experiences that don't fit the standard modal pattern

## When Not to Use

- **Simple confirmations**: Use the basic Modal component for straightforward confirm/cancel dialogs
- **Transient notifications**: Use Toast or InlineNotification for temporary messages
- **Contextual help**: Use Tooltip or Toggletip for inline help and definitions
- **Navigation**: Use dedicated navigation components instead of modal-based navigation
- **Full-page content**: Consider dedicated routes for content that requires significant interaction

## Component API

### Basic Usage
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button
} from '@carbon/react';

function BasicModal() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>Open Modal</Button>

      <ComposedModal open={open} onClose={() => setOpen(false)}>
        <ModalHeader>
          <h3>Modal Title</h3>
        </ModalHeader>
        <ModalBody>
          <p>Modal content goes here.</p>
        </ModalBody>
        <ModalFooter>
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Cancel
          </Button>
          <Button kind="primary" onClick={() => setOpen(false)}>
            Save
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Modal with Form
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  TextInput,
  TextArea
} from '@carbon/react';

function FormModal() {
  const [open, setOpen] = useState(false);
  const [formData, setFormData] = useState({ name: '', description: '' });

  const handleSubmit = () => {
    console.log('Submitting:', formData);
    setOpen(false);
  };

  return (
    <>
      <Button onClick={() => setOpen(true)}>Add Item</Button>

      <ComposedModal open={open} onClose={() => setOpen(false)}>
        <ModalHeader label="Add New" buttonOnClick={() => setOpen(false)}>
          <h3>Create Item</h3>
        </ModalHeader>
        <ModalBody hasForm>
          <TextInput
            id="item-name"
            labelText="Name"
            value={formData.name}
            onChange={(e) => setFormData({ ...formData, name: e.target.value })}
            style={{ marginBottom: '1rem' }}
          />
          <TextArea
            id="item-description"
            labelText="Description"
            value={formData.description}
            onChange={(e) => setFormData({ ...formData, description: e.target.value })}
          />
        </ModalBody>
        <ModalFooter>
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Cancel
          </Button>
          <Button kind="primary" onClick={handleSubmit}>
            Create
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Passive Modal (No Footer)
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  Button
} from '@carbon/react';

function PassiveModal() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>Show Info</Button>

      <ComposedModal
        open={open}
        onClose={() => setOpen(false)}
        preventCloseOnClickOutside
      >
        <ModalHeader buttonOnClick={() => setOpen(false)}>
          <h3>Information</h3>
        </ModalHeader>
        <ModalBody>
          <p>This is a passive modal without footer actions.</p>
          <p>Users can only close it using the X button or Escape key.</p>
        </ModalBody>
      </ComposedModal>
    </>
  );
}
```

### Modal with Scrolling Content
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button
} from '@carbon/react';

function ScrollingModal() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>View Terms</Button>

      <ComposedModal open={open} onClose={() => setOpen(false)}>
        <ModalHeader buttonOnClick={() => setOpen(false)}>
          <h3>Terms and Conditions</h3>
        </ModalHeader>
        <ModalBody hasScrollingContent>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
          {/* Long content that scrolls */}
          {Array.from({ length: 20 }).map((_, i) => (
            <p key={i}>
              Section {i + 1}: More terms and conditions content here.
            </p>
          ))}
        </ModalBody>
        <ModalFooter>
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Decline
          </Button>
          <Button kind="primary" onClick={() => setOpen(false)}>
            Accept
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

## Props

### ComposedModal

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| open | `boolean` | `false` | Control modal visibility |
| onClose | `() => void` | - | Callback when modal is closed |
| size | `'xs'` \| `'sm'` \| `'md'` \| `'lg'` | `'md'` | Modal width size |
| preventCloseOnClickOutside | `boolean` | `false` | Prevent closing when clicking outside modal |
| containerClassName | `string` | - | CSS class for modal container |
| className | `string` | - | CSS class for modal |
| selectorPrimaryFocus | `string` | - | CSS selector for element to receive initial focus |

### ModalHeader

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| label | `string` | - | Optional label above the title |
| title | `string` | - | Modal title (alternative to children) |
| buttonOnClick | `() => void` | - | Click handler for close button |
| closeModal | `() => void` | - | Function to close modal |
| iconDescription | `string` | `'Close'` | Description for close icon |
| className | `string` | - | Additional CSS classes |

### ModalBody

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| hasForm | `boolean` | `false` | Indicates body contains form content |
| hasScrollingContent | `boolean` | `false` | Enable scrolling for long content |
| aria-label | `string` | - | ARIA label for the modal body |
| className | `string` | - | Additional CSS classes |

### ModalFooter

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| primaryButtonText | `string` | - | Text for primary action button |
| primaryButtonDisabled | `boolean` | `false` | Disable primary button |
| secondaryButtonText | `string` | - | Text for secondary action button |
| onRequestSubmit | `() => void` | - | Primary button click handler |
| onRequestClose | `() => void` | - | Secondary button click handler |
| danger | `boolean` | `false` | Use danger variant for primary button |
| className | `string` | - | Additional CSS classes |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Escape` | Close the modal |
| `Tab` | Move focus forward through modal interactive elements |
| `Shift + Tab` | Move focus backward through modal interactive elements |
| `Enter` or `Space` | Activate focused button or control |

### Screen Reader Support

ComposedModal provides comprehensive accessibility:
- Uses `role="dialog"` with proper ARIA attributes
- Automatically manages focus when opening and closing
- Traps focus within modal when open
- Returns focus to trigger element when closed
- Announces modal title and content to screen readers
- Close button has descriptive label
- Proper heading hierarchy for modal content

### Best Practices

1. **Focus management**: Ensure focus moves to modal when opened and returns to trigger when closed
2. **Meaningful titles**: Provide clear, descriptive modal titles
3. **Keyboard navigation**: All interactive elements must be keyboard accessible
4. **Escape to close**: Always allow Escape key to close modal (unless critical)
5. **Focus trap**: Keep focus within modal while open
6. **Primary action clarity**: Make the primary action obvious and appropriately styled
7. **Loading states**: Show loading indicators for async operations
8. **Error handling**: Display validation errors clearly within the modal

## Patterns

### Confirmation Dialog with Danger Action
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button
} from '@carbon/react';

function DeleteConfirmation() {
  const [open, setOpen] = useState(false);
  const [itemToDelete, setItemToDelete] = useState(null);

  const handleDelete = (item) => {
    setItemToDelete(item);
    setOpen(true);
  };

  const confirmDelete = () => {
    console.log('Deleting:', itemToDelete);
    // Perform delete operation
    setOpen(false);
    setItemToDelete(null);
  };

  return (
    <>
      <Button kind="danger" onClick={() => handleDelete({ id: 1, name: 'Important File' })}>
        Delete File
      </Button>

      <ComposedModal
        open={open}
        onClose={() => setOpen(false)}
        preventCloseOnClickOutside
      >
        <ModalHeader buttonOnClick={() => setOpen(false)}>
          <h3>Delete {itemToDelete?.name}?</h3>
        </ModalHeader>
        <ModalBody>
          <p>
            This action cannot be undone. The file will be permanently deleted
            from your account.
          </p>
        </ModalBody>
        <ModalFooter danger>
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Cancel
          </Button>
          <Button kind="danger" onClick={confirmDelete}>
            Delete
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Multi-Step Wizard Modal
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  TextInput,
  ProgressIndicator,
  ProgressStep
} from '@carbon/react';

function WizardModal() {
  const [open, setOpen] = useState(false);
  const [currentStep, setCurrentStep] = useState(0);
  const [formData, setFormData] = useState({
    step1: '',
    step2: '',
    step3: ''
  });

  const steps = ['Basic Info', 'Details', 'Review'];

  const handleNext = () => {
    if (currentStep < steps.length - 1) {
      setCurrentStep(currentStep + 1);
    } else {
      console.log('Submit:', formData);
      setOpen(false);
      setCurrentStep(0);
    }
  };

  const handleBack = () => {
    if (currentStep > 0) {
      setCurrentStep(currentStep - 1);
    }
  };

  return (
    <>
      <Button onClick={() => setOpen(true)}>Start Wizard</Button>

      <ComposedModal
        open={open}
        onClose={() => {
          setOpen(false);
          setCurrentStep(0);
        }}
        size="lg"
      >
        <ModalHeader label="Setup Wizard" buttonOnClick={() => setOpen(false)}>
          <h3>Create New Project</h3>
        </ModalHeader>
        <ModalBody>
          <ProgressIndicator currentIndex={currentStep} spaceEqually>
            {steps.map((step, index) => (
              <ProgressStep
                key={index}
                label={step}
                complete={index < currentStep}
              />
            ))}
          </ProgressIndicator>

          <div style={{ marginTop: '2rem' }}>
            {currentStep === 0 && (
              <TextInput
                id="step1"
                labelText="Project Name"
                value={formData.step1}
                onChange={(e) => setFormData({ ...formData, step1: e.target.value })}
              />
            )}
            {currentStep === 1 && (
              <TextInput
                id="step2"
                labelText="Description"
                value={formData.step2}
                onChange={(e) => setFormData({ ...formData, step2: e.target.value })}
              />
            )}
            {currentStep === 2 && (
              <div>
                <p><strong>Project Name:</strong> {formData.step1}</p>
                <p><strong>Description:</strong> {formData.step2}</p>
              </div>
            )}
          </div>
        </ModalBody>
        <ModalFooter>
          {currentStep > 0 && (
            <Button kind="secondary" onClick={handleBack}>
              Back
            </Button>
          )}
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Cancel
          </Button>
          <Button kind="primary" onClick={handleNext}>
            {currentStep === steps.length - 1 ? 'Finish' : 'Next'}
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Modal with Inline Loading
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  InlineLoading
} from '@carbon/react';

function LoadingModal() {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);

  const handleSubmit = async () => {
    setLoading(true);
    setSuccess(false);

    try {
      // Simulate async operation
      await new Promise(resolve => setTimeout(resolve, 2000));
      setSuccess(true);
      setLoading(false);

      setTimeout(() => {
        setOpen(false);
        setSuccess(false);
      }, 1500);
    } catch (error) {
      setLoading(false);
      console.error('Operation failed:', error);
    }
  };

  return (
    <>
      <Button onClick={() => setOpen(true)}>Submit Data</Button>

      <ComposedModal
        open={open}
        onClose={() => !loading && setOpen(false)}
        preventCloseOnClickOutside={loading}
      >
        <ModalHeader buttonOnClick={() => !loading && setOpen(false)}>
          <h3>Submit Form</h3>
        </ModalHeader>
        <ModalBody>
          {loading ? (
            <InlineLoading description="Processing your request..." />
          ) : success ? (
            <InlineLoading
              status="finished"
              description="Success! Your data has been submitted."
            />
          ) : (
            <p>Click submit to process your data.</p>
          )}
        </ModalBody>
        <ModalFooter>
          <Button
            kind="secondary"
            onClick={() => setOpen(false)}
            disabled={loading}
          >
            Cancel
          </Button>
          <Button
            kind="primary"
            onClick={handleSubmit}
            disabled={loading || success}
          >
            {loading ? 'Processing...' : 'Submit'}
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Form Validation Modal
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  TextInput,
  InlineNotification
} from '@carbon/react';

function ValidationModal() {
  const [open, setOpen] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState({});

  const validate = () => {
    const newErrors = {};

    if (!email) {
      newErrors.email = 'Email is required';
    } else if (!/\S+@\S+\.\S+/.test(email)) {
      newErrors.email = 'Email is invalid';
    }

    if (!password) {
      newErrors.password = 'Password is required';
    } else if (password.length < 8) {
      newErrors.password = 'Password must be at least 8 characters';
    }

    return newErrors;
  };

  const handleSubmit = () => {
    const validationErrors = validate();

    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
      return;
    }

    console.log('Form submitted:', { email, password });
    setOpen(false);
    setEmail('');
    setPassword('');
    setErrors({});
  };

  return (
    <>
      <Button onClick={() => setOpen(true)}>Sign Up</Button>

      <ComposedModal open={open} onClose={() => setOpen(false)}>
        <ModalHeader label="Welcome" buttonOnClick={() => setOpen(false)}>
          <h3>Create Account</h3>
        </ModalHeader>
        <ModalBody hasForm>
          {Object.keys(errors).length > 0 && (
            <InlineNotification
              kind="error"
              title="Validation failed"
              subtitle="Please correct the errors below"
              lowContrast
              hideCloseButton
              style={{ marginBottom: '1rem' }}
            />
          )}

          <TextInput
            id="email"
            labelText="Email"
            value={email}
            onChange={(e) => {
              setEmail(e.target.value);
              setErrors(prev => ({ ...prev, email: undefined }));
            }}
            invalid={!!errors.email}
            invalidText={errors.email}
            style={{ marginBottom: '1rem' }}
          />

          <TextInput
            id="password"
            type="password"
            labelText="Password"
            value={password}
            onChange={(e) => {
              setPassword(e.target.value);
              setErrors(prev => ({ ...prev, password: undefined }));
            }}
            invalid={!!errors.password}
            invalidText={errors.password}
          />
        </ModalBody>
        <ModalFooter>
          <Button kind="secondary" onClick={() => setOpen(false)}>
            Cancel
          </Button>
          <Button kind="primary" onClick={handleSubmit}>
            Create Account
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Size Variants
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button
} from '@carbon/react';

function SizeVariants() {
  const [openSize, setOpenSize] = useState(null);

  return (
    <>
      <Button onClick={() => setOpenSize('xs')} style={{ marginRight: '0.5rem' }}>
        XS Modal
      </Button>
      <Button onClick={() => setOpenSize('sm')} style={{ marginRight: '0.5rem' }}>
        SM Modal
      </Button>
      <Button onClick={() => setOpenSize('md')} style={{ marginRight: '0.5rem' }}>
        MD Modal
      </Button>
      <Button onClick={() => setOpenSize('lg')}>
        LG Modal
      </Button>

      <ComposedModal
        open={!!openSize}
        onClose={() => setOpenSize(null)}
        size={openSize}
      >
        <ModalHeader buttonOnClick={() => setOpenSize(null)}>
          <h3>{openSize?.toUpperCase()} Modal</h3>
        </ModalHeader>
        <ModalBody>
          <p>This is a {openSize} sized modal.</p>
        </ModalBody>
        <ModalFooter>
          <Button kind="primary" onClick={() => setOpenSize(null)}>
            Close
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

## Related Components

- **Modal**: Use for simple, pre-composed modal dialogs with standard layouts
- **ModalWrapper**: Use for simpler modal implementations with less customization
- **InlineNotification**: Use for non-blocking notifications within the page
- **OverflowMenu**: Use for contextual actions that don't require modal dialogs
- **Popover**: Use for lightweight contextual information and actions
- **Tooltip**: Use for simple help text and definitions

## References

- [Carbon Design System - Modal](https://carbondesignsystem.com/components/modal/usage)
- [Carbon React Storybook - ComposedModal](https://react.carbondesignsystem.com/?path=/docs/components-composedmodal--overview)
- [Modal Accessibility](https://carbondesignsystem.com/components/modal/accessibility)
- [ARIA Dialog Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/)

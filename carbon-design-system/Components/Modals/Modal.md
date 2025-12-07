# Modal

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-modal--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/modal/usage) | [Accessibility](https://www.carbondesignsystem.com/components/modal/accessibility)

## Overview

Modals are dialog overlays that require user interaction before returning to the main content. They focus the user's attention on a specific task or piece of information.

## When to Use

- For confirmation of destructive actions
- To display critical information requiring acknowledgment
- For forms or data entry that should be completed before continuing
- When user input is required to proceed

## When Not to Use

- For non-critical information (use Notification)
- For content that doesn't require immediate action
- For complex workflows (consider a separate page)
- For frequently accessed features (consider inline UI)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Two buttons (cancel/confirm) |
| **Passive** | No buttons, closes on click outside or Escape |
| **Danger** | Two buttons with danger styling for destructive actions |
| **With Form** | Optimized padding for form content |
| **With Scrolling Content** | Shows scroll indicator for long content |

---

## Sizes

| Size | Width | Use Case |
|------|-------|----------|
| `xs` | 320px | Simple confirmations |
| `sm` | 400px | Short messages with actions |
| `md` | 576px | Default, forms and moderate content |
| `lg` | 768px | Complex content or larger forms |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `open` | `boolean` | `false` | Controls modal visibility |
| `onRequestClose` | `function` | - | Called when modal should close |
| `onRequestSubmit` | `function` | - | Called when primary button clicked |
| `modalHeading` | `node` | - | Modal title text |
| `modalLabel` | `node` | - | Optional label above title |
| `primaryButtonText` | `string` | - | Primary button label |
| `secondaryButtonText` | `string` | - | Secondary button label |
| `primaryButtonDisabled` | `boolean` | `false` | Disable primary button |
| `danger` | `boolean` | `false` | Use danger styling |
| `passiveModal` | `boolean` | `false` | No action buttons |
| `size` | `'xs' \| 'sm' \| 'md' \| 'lg'` | `'md'` | Modal size |
| `hasForm` | `boolean` | `false` | Adjust padding for forms |
| `hasScrollingContent` | `boolean` | `false` | Show scroll indicator |
| `preventCloseOnClickOutside` | `boolean` | `false` | Disable outside click close |
| `selectorPrimaryFocus` | `string` | - | Selector for initial focus element |
| `selectorsFloatingMenus` | `array` | - | Selectors for floating menus |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Modal

```jsx
import { Modal, Button } from '@carbon/react';
import { useState } from 'react';

function BasicModal() {
  const [open, setOpen] = useState(false);

  return (
    <>
      <Button onClick={() => setOpen(true)}>Open Modal</Button>
      <Modal
        open={open}
        onRequestClose={() => setOpen(false)}
        onRequestSubmit={() => {
          // Handle submit
          setOpen(false);
        }}
        modalHeading="Modal heading"
        modalLabel="Optional label"
        primaryButtonText="Submit"
        secondaryButtonText="Cancel"
      >
        <p>Modal content goes here.</p>
      </Modal>
    </>
  );
}
```

### Danger Modal

```jsx
<Modal
  open={isOpen}
  onRequestClose={handleClose}
  onRequestSubmit={handleDelete}
  modalHeading="Delete item?"
  primaryButtonText="Delete"
  secondaryButtonText="Cancel"
  danger
>
  <p>
    Are you sure you want to delete this item?
    This action cannot be undone.
  </p>
</Modal>
```

### Passive Modal

```jsx
<Modal
  open={isOpen}
  onRequestClose={handleClose}
  modalHeading="Information"
  passiveModal
>
  <p>This is informational content that doesn't require action.</p>
</Modal>
```

### Modal with Form

```jsx
import { Modal, TextInput, Dropdown, Stack } from '@carbon/react';

<Modal
  open={isOpen}
  onRequestClose={handleClose}
  onRequestSubmit={handleSubmit}
  modalHeading="Create new item"
  primaryButtonText="Create"
  secondaryButtonText="Cancel"
  hasForm
>
  <Stack gap={5}>
    <TextInput
      id="item-name"
      labelText="Name"
      placeholder="Enter name"
    />
    <Dropdown
      id="item-category"
      titleText="Category"
      label="Select category"
      items={categories}
      itemToString={(item) => item?.name}
    />
  </Stack>
</Modal>
```

### Modal with Scrolling Content

```jsx
<Modal
  open={isOpen}
  onRequestClose={handleClose}
  modalHeading="Terms and Conditions"
  primaryButtonText="Accept"
  secondaryButtonText="Decline"
  hasScrollingContent
>
  <div style={{ height: '300px' }}>
    {/* Long content here */}
  </div>
</Modal>
```

### Custom Focus Management

```jsx
<Modal
  open={isOpen}
  onRequestClose={handleClose}
  modalHeading="Edit profile"
  primaryButtonText="Save"
  secondaryButtonText="Cancel"
  selectorPrimaryFocus="#first-name-input"
>
  <TextInput id="first-name-input" labelText="First name" />
  <TextInput id="last-name-input" labelText="Last name" />
</Modal>
```

---

## Focus Management

- Focus is trapped within the modal when open
- Use `selectorPrimaryFocus` or `data-modal-primary-focus` to set initial focus
- Focus returns to trigger element when modal closes
- Use `selectorsFloatingMenus` for dropdowns/menus inside modal

---

## Accessibility

- Modal automatically manages focus trapping
- Press Escape to close (unless prevented)
- Screen readers announce modal content
- Ensure modal heading describes the purpose
- Provide clear button labels

---

## Related Components

- [ComposedModal](ComposedModal.md) - More flexible modal composition
- [InlineNotification](InlineNotification.md) - For non-blocking messages

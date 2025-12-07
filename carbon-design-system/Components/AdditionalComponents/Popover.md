# Popover

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-popover--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/popover/usage)

## Overview

Popover displays rich content in a floating container positioned relative to a trigger element. It's more flexible than tooltips, supporting interactive content, forms, and complex layouts while maintaining proper positioning and accessibility.

## When to Use

- For displaying rich, interactive content
- When showing contextual information with actions
- For inline forms or settings
- When content includes links, buttons, or inputs
- For displaying detailed information on demand
- When tooltip content becomes too complex

## When Not to Use

- For simple text information (use Tooltip instead)
- For term definitions (use DefinitionTooltip)
- For large amounts of content (use Modal)
- For primary navigation
- When content should be always visible

---

## Code Examples

### Basic Usage

```jsx
import { Popover, PopoverContent } from '@carbon/react';
import { Button } from '@carbon/react';

<Popover open align="bottom">
  <button className="trigger">Click me</button>
  <PopoverContent>
    <p>This is popover content</p>
  </PopoverContent>
</Popover>
```

### Controlled Popover

```jsx
import { Popover, PopoverContent } from '@carbon/react';
import { useState } from 'react';

function ControlledPopover() {
  const [open, setOpen] = useState(false);

  return (
    <Popover open={open} onRequestClose={() => setOpen(false)}>
      <button onClick={() => setOpen(!open)}>Toggle</button>
      <PopoverContent>
        <div className="popover-content">
          <h4>Title</h4>
          <p>Content goes here</p>
          <button onClick={() => setOpen(false)}>Close</button>
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

### Different Alignments

```jsx
import { Popover, PopoverContent } from '@carbon/react';

<Popover align="top">
  <button>Top</button>
  <PopoverContent>Appears above</PopoverContent>
</Popover>

<Popover align="bottom">
  <button>Bottom</button>
  <PopoverContent>Appears below</PopoverContent>
</Popover>

<Popover align="left">
  <button>Left</button>
  <PopoverContent>Appears to the left</PopoverContent>
</Popover>

<Popover align="right">
  <button>Right</button>
  <PopoverContent>Appears to the right</PopoverContent>
</Popover>
```

### With Form

```jsx
import { Popover, PopoverContent, TextInput, Button, Stack } from '@carbon/react';
import { useState } from 'react';

function QuickAddForm() {
  const [open, setOpen] = useState(false);
  const [name, setName] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle form submission
    setOpen(false);
  };

  return (
    <Popover open={open} onRequestClose={() => setOpen(false)}>
      <Button onClick={() => setOpen(!open)}>Quick Add</Button>
      <PopoverContent>
        <form onSubmit={handleSubmit}>
          <Stack gap={4}>
            <h5>Add New Item</h5>
            <TextInput
              id="item-name"
              labelText="Name"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
            <div style={{ display: 'flex', gap: '8px' }}>
              <Button size="sm" type="submit">Add</Button>
              <Button size="sm" kind="secondary" onClick={() => setOpen(false)}>
                Cancel
              </Button>
            </div>
          </Stack>
        </form>
      </PopoverContent>
    </Popover>
  );
}
```

### User Profile Card

```jsx
import { Popover, PopoverContent } from '@carbon/react';

function UserPopover({ user }) {
  return (
    <Popover>
      <button className="user-avatar">
        <img src={user.avatar} alt={user.name} />
      </button>
      <PopoverContent>
        <div className="user-card">
          <img src={user.avatar} alt={user.name} className="large-avatar" />
          <h4>{user.name}</h4>
          <p>{user.role}</p>
          <p>{user.email}</p>
          <div className="actions">
            <a href={`/users/${user.id}`}>View Profile</a>
            <a href={`/messages/${user.id}`}>Send Message</a>
          </div>
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

### Filter Menu

```jsx
import { Popover, PopoverContent, Checkbox, Button } from '@carbon/react';
import { useState } from 'react';

function FilterPopover({ filters, onApply }) {
  const [open, setOpen] = useState(false);
  const [selected, setSelected] = useState([]);

  const handleApply = () => {
    onApply(selected);
    setOpen(false);
  };

  return (
    <Popover open={open} onRequestClose={() => setOpen(false)}>
      <Button onClick={() => setOpen(!open)}>Filters</Button>
      <PopoverContent>
        <div className="filter-menu">
          <h5>Filter by:</h5>
          {filters.map(filter => (
            <Checkbox
              key={filter.id}
              id={filter.id}
              labelText={filter.label}
              checked={selected.includes(filter.id)}
              onChange={(checked) => {
                if (checked) {
                  setSelected([...selected, filter.id]);
                } else {
                  setSelected(selected.filter(id => id !== filter.id));
                }
              }}
            />
          ))}
          <Button size="sm" onClick={handleApply}>Apply</Button>
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

### Color Picker

```jsx
import { Popover, PopoverContent } from '@carbon/react';
import { useState } from 'react';

function ColorPicker({ value, onChange }) {
  const [open, setOpen] = useState(false);
  const colors = ['#FF0000', '#00FF00', '#0000FF', '#FFFF00', '#FF00FF', '#00FFFF'];

  return (
    <Popover open={open} onRequestClose={() => setOpen(false)}>
      <button
        style={{ backgroundColor: value, width: '40px', height: '40px' }}
        onClick={() => setOpen(!open)}
      />
      <PopoverContent>
        <div className="color-picker">
          {colors.map(color => (
            <button
              key={color}
              style={{ backgroundColor: color, width: '30px', height: '30px' }}
              onClick={() => {
                onChange(color);
                setOpen(false);
              }}
            />
          ))}
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

### Share Menu

```jsx
import { Popover, PopoverContent, CopyButton } from '@carbon/react';
import { Share } from '@carbon/icons-react';

function SharePopover({ url }) {
  return (
    <Popover>
      <button>
        <Share /> Share
      </button>
      <PopoverContent>
        <div className="share-menu">
          <h5>Share this page</h5>
          <div className="share-url">
            <input value={url} readOnly />
            <CopyButton />
          </div>
          <div className="share-social">
            <button>Twitter</button>
            <button>Facebook</button>
            <button>LinkedIn</button>
          </div>
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus into and through popover content
- **Esc**: Close the popover
- **Enter/Space**: Activate trigger (if button)

### Screen Reader Support

- Popover content is announced when opened
- Proper ARIA attributes for overlay
- Focus is managed when opening/closing
- Trigger and content are properly associated

### Best Practices

- Ensure popover closes on outside click
- Manage focus appropriately when opening
- Return focus to trigger when closing
- Provide clear close mechanism
- Test with keyboard-only navigation
- Ensure sufficient color contrast
- Don't nest popovers

---

## Patterns

### Action Menu with Confirmation

```jsx
import { Popover, PopoverContent, Button } from '@carbon/react';
import { useState } from 'react';

function DeletePopover({ onConfirm }) {
  const [open, setOpen] = useState(false);

  return (
    <Popover open={open} onRequestClose={() => setOpen(false)}>
      <Button kind="danger" onClick={() => setOpen(true)}>
        Delete
      </Button>
      <PopoverContent>
        <div className="confirm-delete">
          <p>Are you sure you want to delete this item?</p>
          <div style={{ display: 'flex', gap: '8px' }}>
            <Button
              size="sm"
              kind="danger"
              onClick={() => {
                onConfirm();
                setOpen(false);
              }}
            >
              Delete
            </Button>
            <Button size="sm" kind="secondary" onClick={() => setOpen(false)}>
              Cancel
            </Button>
          </div>
        </div>
      </PopoverContent>
    </Popover>
  );
}
```

---

## Related Components

- [Tooltip](../Tooltip/Tooltip.md) - For simple hover information
- [Toggletip](../Tooltip/Toggletip.md) - For interactive tooltip content
- [DefinitionTooltip](../Tooltip/DefinitionTooltip.md) - For term definitions
- [Modal](../Modals/Modal.md) - For larger overlays
- [OverflowMenu](OverflowMenu.md) - For action menus

---

## References

- [Carbon Design System - Popover](https://www.carbondesignsystem.com/components/popover/usage)
- [WCAG 2.1 - Dialog Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/dialog-modal/)
- [Popper.js Documentation](https://popper.js.org/)

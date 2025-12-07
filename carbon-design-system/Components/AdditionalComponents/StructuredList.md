# StructuredList

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-structuredlist--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/structured-list/usage)

## Overview

StructuredList displays simple tabular data in a list format without the complexity of a full data table. It's ideal for presenting key-value pairs, metadata, or structured information in a clean, organized manner.

## When to Use

- For displaying metadata or properties
- When showing key-value pairs
- For simple tabular data without sorting or filtering
- In settings panels or configuration displays
- When data doesn't require complex table features
- For read-only information displays

## When Not to Use

- For complex data tables (use DataTable instead)
- When sorting, filtering, or pagination is needed
- For editable data
- When rows need checkboxes or actions
- For large datasets (use DataTable with pagination)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Basic list structure |
| **Selectable** | Rows can be selected with radio buttons |
| **Condensed** | Reduced vertical spacing |

---

## Code Examples

### Basic Usage

```jsx
import {
  StructuredListWrapper,
  StructuredListHead,
  StructuredListBody,
  StructuredListRow,
  StructuredListCell
} from '@carbon/react';

<StructuredListWrapper>
  <StructuredListHead>
    <StructuredListRow head>
      <StructuredListCell head>Property</StructuredListCell>
      <StructuredListCell head>Value</StructuredListCell>
    </StructuredListRow>
  </StructuredListHead>
  <StructuredListBody>
    <StructuredListRow>
      <StructuredListCell>Status</StructuredListCell>
      <StructuredListCell>Active</StructuredListCell>
    </StructuredListRow>
    <StructuredListRow>
      <StructuredListCell>Created</StructuredListCell>
      <StructuredListCell>2024-01-15</StructuredListCell>
    </StructuredListRow>
  </StructuredListBody>
</StructuredListWrapper>
```

### Selectable Rows

```jsx
import {
  StructuredListWrapper,
  StructuredListHead,
  StructuredListBody,
  StructuredListRow,
  StructuredListCell,
  StructuredListInput
} from '@carbon/react';
import { useState } from 'react';

function SelectableList() {
  const [selected, setSelected] = useState('option-1');

  return (
    <StructuredListWrapper selection>
      <StructuredListBody>
        <StructuredListRow>
          <StructuredListCell>
            <StructuredListInput
              id="option-1"
              value="option-1"
              name="options"
              checked={selected === 'option-1'}
              onChange={() => setSelected('option-1')}
            />
          </StructuredListCell>
          <StructuredListCell>Option 1</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>
            <StructuredListInput
              id="option-2"
              value="option-2"
              name="options"
              checked={selected === 'option-2'}
              onChange={() => setSelected('option-2')}
            />
          </StructuredListCell>
          <StructuredListCell>Option 2</StructuredListCell>
        </StructuredListRow>
      </StructuredListBody>
    </StructuredListWrapper>
  );
}
```

### Server Information

```jsx
import { StructuredListWrapper, StructuredListHead, StructuredListBody, StructuredListRow, StructuredListCell } from '@carbon/react';

function ServerInfo({ server }) {
  return (
    <StructuredListWrapper>
      <StructuredListHead>
        <StructuredListRow head>
          <StructuredListCell head>Property</StructuredListCell>
          <StructuredListCell head>Details</StructuredListCell>
        </StructuredListRow>
      </StructuredListHead>
      <StructuredListBody>
        <StructuredListRow>
          <StructuredListCell>Hostname</StructuredListCell>
          <StructuredListCell>{server.hostname}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>IP Address</StructuredListCell>
          <StructuredListCell>{server.ip}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>Status</StructuredListCell>
          <StructuredListCell>{server.status}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>Uptime</StructuredListCell>
          <StructuredListCell>{server.uptime}</StructuredListCell>
        </StructuredListRow>
      </StructuredListBody>
    </StructuredListWrapper>
  );
}
```

### Product Specifications

```jsx
import { StructuredListWrapper, StructuredListBody, StructuredListRow, StructuredListCell } from '@carbon/react';

function ProductSpecs({ specs }) {
  return (
    <StructuredListWrapper>
      <StructuredListBody>
        {Object.entries(specs).map(([key, value]) => (
          <StructuredListRow key={key}>
            <StructuredListCell><strong>{key}</strong></StructuredListCell>
            <StructuredListCell>{value}</StructuredListCell>
          </StructuredListRow>
        ))}
      </StructuredListBody>
    </StructuredListWrapper>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus through selectable rows
- **Space**: Select focused row (in selectable lists)
- **Arrow Keys**: Navigate between rows

### Screen Reader Support

- Headers are properly announced
- Selection state is communicated
- Row relationships are maintained

### Best Practices

- Use semantic header cells
- Provide clear labels for all content
- Ensure sufficient color contrast
- Maintain logical reading order
- Use selectable variant when user choice is needed

---

## Patterns

### User Profile Details

```jsx
import { StructuredListWrapper, StructuredListBody, StructuredListRow, StructuredListCell } from '@carbon/react';

function UserProfile({ user }) {
  return (
    <StructuredListWrapper>
      <StructuredListBody>
        <StructuredListRow>
          <StructuredListCell>Name</StructuredListCell>
          <StructuredListCell>{user.name}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>Email</StructuredListCell>
          <StructuredListCell>{user.email}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>Role</StructuredListCell>
          <StructuredListCell>{user.role}</StructuredListCell>
        </StructuredListRow>
        <StructuredListRow>
          <StructuredListCell>Last Login</StructuredListCell>
          <StructuredListCell>{user.lastLogin}</StructuredListCell>
        </StructuredListRow>
      </StructuredListBody>
    </StructuredListWrapper>
  );
}
```

---

## Related Components

- [DataTable](../DataTable/DataTable.md) - For complex tabular data
- [Tile](../Tile/Tile.md) - For card-based layouts
- [Accordion](../Accordion/Accordion.md) - For expandable content sections

---

## References

- [Carbon Design System - Structured List](https://www.carbondesignsystem.com/components/structured-list/usage)
- [WCAG 2.1 - Tables](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships)

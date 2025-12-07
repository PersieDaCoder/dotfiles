# ContainedList

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-containedlist--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/contained-list/usage)

## Overview

ContainedList displays a set of items in a contained, bordered list format. It provides a clear visual container for list items with support for actions, icons, and interactive elements, making it ideal for configuration lists, file lists, and action menus.

## When to Use

- For lists of actionable items
- When displaying files or resources
- In settings or configuration panels
- For inbox or notification lists
- When list items need actions or icons
- For contained list layouts with clear boundaries

## When Not to Use

- For simple text lists (use standard HTML lists)
- When a table format is more appropriate
- For large datasets requiring pagination
- When hierarchical display is needed (use TreeView)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard contained list |
| **With Actions** | Items include action buttons |
| **With Icons** | Items display icons |
| **Interactive** | Clickable/hoverable items |

---

## Code Examples

### Basic Usage

```jsx
import { ContainedList, ContainedListItem } from '@carbon/react';

<ContainedList label="Items" kind="on-page">
  <ContainedListItem>Item 1</ContainedListItem>
  <ContainedListItem>Item 2</ContainedListItem>
  <ContainedListItem>Item 3</ContainedListItem>
</ContainedList>
```

### With Actions

```jsx
import { ContainedList, ContainedListItem } from '@carbon/react';
import { OverflowMenuVertical } from '@carbon/icons-react';

<ContainedList label="Files" kind="on-page">
  <ContainedListItem
    action={
      <button aria-label="Actions">
        <OverflowMenuVertical />
      </button>
    }
  >
    document.pdf
  </ContainedListItem>
  <ContainedListItem
    action={
      <button aria-label="Actions">
        <OverflowMenuVertical />
      </button>
    }
  >
    spreadsheet.xlsx
  </ContainedListItem>
</ContainedList>
```

### Clickable Items

```jsx
import { ContainedList, ContainedListItem } from '@carbon/react';

<ContainedList label="Navigation" kind="on-page">
  <ContainedListItem onClick={() => console.log('Item 1 clicked')}>
    Dashboard
  </ContainedListItem>
  <ContainedListItem onClick={() => console.log('Item 2 clicked')}>
    Reports
  </ContainedListItem>
  <ContainedListItem onClick={() => console.log('Item 3 clicked')}>
    Settings
  </ContainedListItem>
</ContainedList>
```

### File List

```jsx
import { ContainedList, ContainedListItem, Button } from '@carbon/react';
import { Download, TrashCan } from '@carbon/icons-react';

function FileList({ files }) {
  return (
    <ContainedList label="Uploaded Files" kind="on-page">
      {files.map(file => (
        <ContainedListItem
          key={file.id}
          action={
            <div style={{ display: 'flex', gap: '8px' }}>
              <Button
                size="sm"
                kind="ghost"
                hasIconOnly
                renderIcon={Download}
                iconDescription="Download"
                onClick={() => downloadFile(file.id)}
              />
              <Button
                size="sm"
                kind="danger--ghost"
                hasIconOnly
                renderIcon={TrashCan}
                iconDescription="Delete"
                onClick={() => deleteFile(file.id)}
              />
            </div>
          }
        >
          <div>
            <div>{file.name}</div>
            <div className="file-meta">{file.size} • {file.date}</div>
          </div>
        </ContainedListItem>
      ))}
    </ContainedList>
  );
}
```

### Notification List

```jsx
import { ContainedList, ContainedListItem } from '@carbon/react';

function NotificationList({ notifications }) {
  return (
    <ContainedList label="Notifications" kind="on-page">
      {notifications.map(notif => (
        <ContainedListItem
          key={notif.id}
          onClick={() => markAsRead(notif.id)}
        >
          <div>
            <strong>{notif.title}</strong>
            <p>{notif.message}</p>
            <small>{notif.time}</small>
          </div>
        </ContainedListItem>
      ))}
    </ContainedList>
  );
}
```

### Settings List

```jsx
import { ContainedList, ContainedListItem, Toggle } from '@carbon/react';

function SettingsList() {
  return (
    <ContainedList label="Preferences" kind="on-page">
      <ContainedListItem
        action={<Toggle id="notifications" size="sm" />}
      >
        <div>
          <div>Email Notifications</div>
          <small>Receive updates via email</small>
        </div>
      </ContainedListItem>
      <ContainedListItem
        action={<Toggle id="dark-mode" size="sm" />}
      >
        <div>
          <div>Dark Mode</div>
          <small>Use dark theme</small>
        </div>
      </ContainedListItem>
    </ContainedList>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Navigate through interactive items
- **Enter/Space**: Activate clickable items or actions
- **Arrow Keys**: Navigate between items in list

### Screen Reader Support

- List label is properly announced
- Item count is communicated
- Interactive elements are clearly identified
- Actions are properly labeled

### Best Practices

- Provide descriptive labels for the list
- Ensure actions have clear aria-labels
- Use semantic HTML within items
- Maintain sufficient color contrast
- Ensure touch targets are at least 44x44px

---

## Patterns

### Recent Documents

```jsx
import { ContainedList, ContainedListItem } from '@carbon/react';
import { Document } from '@carbon/icons-react';

function RecentDocuments({ documents }) {
  return (
    <ContainedList label="Recent Documents" kind="on-page">
      {documents.map(doc => (
        <ContainedListItem
          key={doc.id}
          onClick={() => openDocument(doc.id)}
        >
          <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
            <Document size={20} />
            <div>
              <div>{doc.name}</div>
              <small>Last edited {doc.lastEdited}</small>
            </div>
          </div>
        </ContainedListItem>
      ))}
    </ContainedList>
  );
}
```

### Task List

```jsx
import { ContainedList, ContainedListItem, Checkbox } from '@carbon/react';

function TaskList({ tasks, onToggle }) {
  return (
    <ContainedList label="Tasks" kind="on-page">
      {tasks.map(task => (
        <ContainedListItem
          key={task.id}
          action={
            <Checkbox
              id={`task-${task.id}`}
              checked={task.completed}
              onChange={() => onToggle(task.id)}
            />
          }
        >
          <div style={{ textDecoration: task.completed ? 'line-through' : 'none' }}>
            {task.title}
          </div>
        </ContainedListItem>
      ))}
    </ContainedList>
  );
}
```

---

## Related Components

- [StructuredList](StructuredList.md) - For key-value pair displays
- [DataTable](../DataTable/DataTable.md) - For complex tabular data
- [TreeView](TreeView.md) - For hierarchical lists
- [Tile](../Tile/Tile.md) - For card-based layouts

---

## References

- [Carbon Design System - Contained List](https://www.carbondesignsystem.com/components/contained-list/usage)
- [WCAG 2.1 - Lists](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships)

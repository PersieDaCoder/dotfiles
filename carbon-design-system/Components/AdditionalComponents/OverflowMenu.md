# OverflowMenu

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-overflowmenu--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/overflow-menu/usage)

## Overview

OverflowMenu provides a compact way to display additional actions in a dropdown menu. It's commonly used when space is limited or when secondary actions need to be tucked away to reduce visual clutter.

## When to Use

- For secondary or less frequently used actions
- When horizontal space is limited
- In data tables for row actions
- For contextual actions on cards or tiles
- When you have more than 2-3 actions
- To maintain a clean, uncluttered interface

## When Not to Use

- For primary actions (use visible buttons)
- When all actions should be immediately visible
- For navigation (use proper navigation components)
- When there are only 1-2 actions (show them directly)

---

## Code Examples

### Basic Usage

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

<OverflowMenu aria-label="Actions">
  <OverflowMenuItem itemText="Edit" />
  <OverflowMenuItem itemText="Share" />
  <OverflowMenuItem itemText="Delete" hasDivider isDelete />
</OverflowMenu>
```

### With Icons

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';
import { Edit, Share, TrashCan } from '@carbon/icons-react';

<OverflowMenu aria-label="Actions">
  <OverflowMenuItem itemText="Edit" renderIcon={Edit} />
  <OverflowMenuItem itemText="Share" renderIcon={Share} />
  <OverflowMenuItem
    itemText="Delete"
    renderIcon={TrashCan}
    hasDivider
    isDelete
  />
</OverflowMenu>
```

### Different Directions

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

<OverflowMenu aria-label="Actions" direction="top">
  <OverflowMenuItem itemText="Action 1" />
  <OverflowMenuItem itemText="Action 2" />
</OverflowMenu>

<OverflowMenu aria-label="Actions" direction="left">
  <OverflowMenuItem itemText="Action 1" />
  <OverflowMenuItem itemText="Action 2" />
</OverflowMenu>
```

### With onClick Handlers

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

<OverflowMenu aria-label="Actions">
  <OverflowMenuItem
    itemText="Edit"
    onClick={() => handleEdit(item.id)}
  />
  <OverflowMenuItem
    itemText="Duplicate"
    onClick={() => handleDuplicate(item.id)}
  />
  <OverflowMenuItem
    itemText="Delete"
    onClick={() => handleDelete(item.id)}
    hasDivider
    isDelete
  />
</OverflowMenu>
```

### In Data Table

```jsx
import { DataTable, Table, TableHead, TableRow, TableHeader, TableBody, TableCell, OverflowMenu, OverflowMenuItem } from '@carbon/react';

function DataTableWithActions({ rows, headers }) {
  return (
    <DataTable rows={rows} headers={headers}>
      {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
        <Table {...getTableProps()}>
          <TableHead>
            <TableRow>
              {headers.map(header => (
                <TableHeader {...getHeaderProps({ header })}>
                  {header.header}
                </TableHeader>
              ))}
              <TableHeader />
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map(row => (
              <TableRow {...getRowProps({ row })}>
                {row.cells.map(cell => (
                  <TableCell key={cell.id}>{cell.value}</TableCell>
                ))}
                <TableCell>
                  <OverflowMenu aria-label="Row actions" flipped>
                    <OverflowMenuItem itemText="Edit" onClick={() => editRow(row.id)} />
                    <OverflowMenuItem itemText="Delete" onClick={() => deleteRow(row.id)} isDelete />
                  </OverflowMenu>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      )}
    </DataTable>
  );
}
```

### Card Actions

```jsx
import { ClickableTile, OverflowMenu, OverflowMenuItem } from '@carbon/react';

function ProductCard({ product }) {
  return (
    <ClickableTile href={`/products/${product.id}`}>
      <div className="card-header">
        <h3>{product.name}</h3>
        <OverflowMenu
          aria-label="Product actions"
          flipped
          onClick={(e) => e.stopPropagation()}
        >
          <OverflowMenuItem itemText="Edit" />
          <OverflowMenuItem itemText="Duplicate" />
          <OverflowMenuItem itemText="Archive" hasDivider />
          <OverflowMenuItem itemText="Delete" isDelete />
        </OverflowMenu>
      </div>
      <p>{product.description}</p>
    </ClickableTile>
  );
}
```

### Disabled Items

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

<OverflowMenu aria-label="Actions">
  <OverflowMenuItem itemText="Edit" />
  <OverflowMenuItem itemText="Share" disabled />
  <OverflowMenuItem itemText="Download" />
  <OverflowMenuItem itemText="Delete" disabled isDelete />
</OverflowMenu>
```

### Custom Menu Items

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

<OverflowMenu aria-label="Actions">
  <OverflowMenuItem itemText="View Details" />
  <OverflowMenuItem itemText="Export as PDF" />
  <OverflowMenuItem itemText="Export as CSV" />
  <OverflowMenuItem itemText="Print" hasDivider />
  <OverflowMenuItem
    itemText="Move to Trash"
    requireTitle
    isDelete
  />
</OverflowMenu>
```

---

## Accessibility

### Keyboard Support

- **Tab**: Focus the overflow menu button
- **Enter/Space**: Open/close the menu
- **Arrow Down**: Navigate to next menu item
- **Arrow Up**: Navigate to previous menu item
- **Esc**: Close the menu
- **Home**: Focus first menu item
- **End**: Focus last menu item

### Screen Reader Support

- Menu button has descriptive aria-label
- Menu items are properly announced
- Disabled items are identified
- Dangerous actions are clearly marked

### Best Practices

- Always provide aria-label for the menu button
- Use `isDelete` for destructive actions
- Use `hasDivider` to group related actions
- Ensure menu items have clear, action-oriented labels
- Don't nest overflow menus
- Test with keyboard-only navigation

---

## Patterns

### File Manager Actions

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

function FileActions({ file }) {
  return (
    <OverflowMenu aria-label="File actions">
      <OverflowMenuItem
        itemText="Download"
        onClick={() => downloadFile(file.id)}
      />
      <OverflowMenuItem
        itemText="Rename"
        onClick={() => renameFile(file.id)}
      />
      <OverflowMenuItem
        itemText="Move"
        onClick={() => moveFile(file.id)}
      />
      <OverflowMenuItem
        itemText="Share"
        onClick={() => shareFile(file.id)}
        hasDivider
      />
      <OverflowMenuItem
        itemText="Delete"
        onClick={() => deleteFile(file.id)}
        isDelete
      />
    </OverflowMenu>
  );
}
```

### User Management

```jsx
import { OverflowMenu, OverflowMenuItem } from '@carbon/react';

function UserActions({ user }) {
  return (
    <OverflowMenu aria-label="User actions">
      <OverflowMenuItem
        itemText="View Profile"
        onClick={() => viewProfile(user.id)}
      />
      <OverflowMenuItem
        itemText="Edit Permissions"
        onClick={() => editPermissions(user.id)}
      />
      <OverflowMenuItem
        itemText={user.active ? 'Deactivate' : 'Activate'}
        onClick={() => toggleUserStatus(user.id)}
        hasDivider
      />
      <OverflowMenuItem
        itemText="Remove User"
        onClick={() => removeUser(user.id)}
        isDelete
      />
    </OverflowMenu>
  );
}
```

---

## Related Components

- [MenuButton](../Buttons/MenuButton.md) - For primary actions with dropdown
- [Dropdown](../FormInputs/Dropdown.md) - For form selections
- [Popover](Popover.md) - For rich content overlays
- [DataTable](../DataTable/DataTable.md) - Often uses overflow menus

---

## References

- [Carbon Design System - Overflow Menu](https://www.carbondesignsystem.com/components/overflow-menu/usage)
- [WCAG 2.1 - Menu Pattern](https://www.w3.org/WAI/ARIA/apg/patterns/menubutton/)

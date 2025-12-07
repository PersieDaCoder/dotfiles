# DataTable

> 📖 [Storybook - Basic](https://react.carbondesignsystem.com/?path=/docs/components-datatable-basic--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/data-table/usage) | [Accessibility](https://www.carbondesignsystem.com/components/data-table/accessibility)

## Overview

DataTable is a flexible, feature-rich table component that manages internal state for sorting, filtering, selection, and expansion while allowing full control over rendering through render props.

## When to Use

- For displaying structured tabular data
- When data needs sorting, filtering, or selection
- For batch actions on multiple rows
- When rows need expandable detail sections

## When Not to Use

- For simple key-value display (use StructuredList)
- For navigation lists (use List components)
- For very simple tables without features (use basic HTML table)
- When cards would better represent the data

---

## Features

| Feature | Description |
|---------|-------------|
| **Sorting** | Click column headers to sort data |
| **Selection** | Checkbox selection for batch actions |
| **Expansion** | Expandable rows for additional details |
| **Filtering** | Toolbar search and filters |
| **Batch Actions** | Actions on selected rows |
| **Pagination** | Navigate through large datasets |

---

## Core Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `rows` | `array` | required | Data array with unique `id` per row |
| `headers` | `array` | required | Column definitions with `key` and `header` |
| `children` | `function` | - | Render function receiving table props |
| `isSortable` | `boolean` | `false` | Enable column sorting |
| `sortRow` | `function` | - | Custom sort comparison function |
| `filterRows` | `function` | - | Custom filter function |
| `radio` | `boolean` | `false` | Single selection mode |
| `experimentalAutoAlign` | `boolean` | `false` | Auto-align overflowing content |

---

## Render Props API

The render function receives these helpers:

| Helper | Description |
|--------|-------------|
| `rows` | Processed row data |
| `headers` | Header definitions |
| `selectedRows` | Currently selected rows |
| `getTableProps()` | Props for Table component |
| `getHeaderProps({ header })` | Props for TableHeader |
| `getRowProps({ row })` | Props for TableRow |
| `getCellProps({ cell })` | Props for TableCell |
| `getSelectionProps()` | Props for selection checkboxes |
| `getExpandedRowProps()` | Props for expanded rows |
| `getToolbarProps()` | Props for toolbar |
| `sortBy(headerKey)` | Sort by column |
| `selectRow(rowId)` | Select a row |
| `selectAll()` | Select all rows |
| `expandRow(rowId)` | Expand a row |
| `expandAll()` | Expand all rows |
| `onInputChange(value)` | Handle search input |

---

## Code Examples

### Basic Table

```jsx
import {
  DataTable,
  Table,
  TableHead,
  TableRow,
  TableHeader,
  TableBody,
  TableCell,
} from '@carbon/react';

const headers = [
  { key: 'name', header: 'Name' },
  { key: 'email', header: 'Email' },
  { key: 'status', header: 'Status' },
];

const rows = [
  { id: '1', name: 'John Doe', email: 'john@example.com', status: 'Active' },
  { id: '2', name: 'Jane Smith', email: 'jane@example.com', status: 'Inactive' },
];

<DataTable rows={rows} headers={headers}>
  {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
    <Table {...getTableProps()}>
      <TableHead>
        <TableRow>
          {headers.map((header) => (
            <TableHeader key={header.key} {...getHeaderProps({ header })}>
              {header.header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <TableRow key={row.id} {...getRowProps({ row })}>
            {row.cells.map((cell) => (
              <TableCell key={cell.id}>{cell.value}</TableCell>
            ))}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )}
</DataTable>
```

### With Sorting

```jsx
<DataTable rows={rows} headers={headers} isSortable>
  {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
    <Table {...getTableProps()}>
      <TableHead>
        <TableRow>
          {headers.map((header) => (
            <TableHeader
              key={header.key}
              {...getHeaderProps({ header })}
              isSortable
            >
              {header.header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <TableRow key={row.id} {...getRowProps({ row })}>
            {row.cells.map((cell) => (
              <TableCell key={cell.id}>{cell.value}</TableCell>
            ))}
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )}
</DataTable>
```

### With Selection and Batch Actions

```jsx
import {
  DataTable, Table, TableHead, TableRow, TableHeader,
  TableBody, TableCell, TableSelectAll, TableSelectRow,
  TableToolbar, TableBatchActions, TableBatchAction,
  TableToolbarContent, TableToolbarSearch, TableContainer,
} from '@carbon/react';
import { TrashCan, Download } from '@carbon/icons-react';

<DataTable rows={rows} headers={headers}>
  {({
    rows, headers, getTableProps, getHeaderProps, getRowProps,
    getSelectionProps, selectedRows, getBatchActionProps,
  }) => (
    <TableContainer>
      <TableToolbar>
        <TableBatchActions {...getBatchActionProps()}>
          <TableBatchAction
            renderIcon={TrashCan}
            onClick={() => handleDelete(selectedRows)}
          >
            Delete
          </TableBatchAction>
          <TableBatchAction
            renderIcon={Download}
            onClick={() => handleExport(selectedRows)}
          >
            Export
          </TableBatchAction>
        </TableBatchActions>
        <TableToolbarContent>
          <TableToolbarSearch onChange={onInputChange} />
        </TableToolbarContent>
      </TableToolbar>
      <Table {...getTableProps()}>
        <TableHead>
          <TableRow>
            <TableSelectAll {...getSelectionProps()} />
            {headers.map((header) => (
              <TableHeader key={header.key} {...getHeaderProps({ header })}>
                {header.header}
              </TableHeader>
            ))}
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow key={row.id} {...getRowProps({ row })}>
              <TableSelectRow {...getSelectionProps({ row })} />
              {row.cells.map((cell) => (
                <TableCell key={cell.id}>{cell.value}</TableCell>
              ))}
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  )}
</DataTable>
```

### With Expansion

```jsx
import {
  TableExpandHeader, TableExpandRow, TableExpandedRow,
} from '@carbon/react';

<DataTable rows={rows} headers={headers}>
  {({
    rows, headers, getTableProps, getHeaderProps, getRowProps,
    getExpandedRowProps,
  }) => (
    <Table {...getTableProps()}>
      <TableHead>
        <TableRow>
          <TableExpandHeader />
          {headers.map((header) => (
            <TableHeader key={header.key} {...getHeaderProps({ header })}>
              {header.header}
            </TableHeader>
          ))}
        </TableRow>
      </TableHead>
      <TableBody>
        {rows.map((row) => (
          <React.Fragment key={row.id}>
            <TableExpandRow {...getRowProps({ row })}>
              {row.cells.map((cell) => (
                <TableCell key={cell.id}>{cell.value}</TableCell>
              ))}
            </TableExpandRow>
            <TableExpandedRow
              colSpan={headers.length + 1}
              {...getExpandedRowProps({ row })}
            >
              <p>Expanded content for {row.id}</p>
            </TableExpandedRow>
          </React.Fragment>
        ))}
      </TableBody>
    </Table>
  )}
</DataTable>
```

---

## Accessibility

- Provide accessible name via `aria-label`, `aria-labelledby`, or `title`
- Sortable headers announce sort direction
- Selection state announced to screen readers
- Keyboard: Arrow keys, Space to select, Enter to expand

---

## Related Components

- [Pagination](Pagination.md) - For paginating table data
- [StructuredList](StructuredList.md) - For simpler data display

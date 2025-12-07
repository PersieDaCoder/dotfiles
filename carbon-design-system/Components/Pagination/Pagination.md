# Pagination

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-pagination--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/pagination/usage) | [Accessibility](https://www.carbondesignsystem.com/components/pagination/accessibility)

## Overview

Pagination divides content into separate pages, allowing users to navigate through large datasets. It provides controls for page size selection, page navigation, and displays the current position within the dataset.

## When to Use

- For tables or lists with large datasets (more than 25 items)
- When you need to improve page load performance by limiting displayed items
- To provide users with control over how much content they see at once
- In data tables, search results, or product listings
- When the total number of items is known
- To maintain consistent performance regardless of dataset size

## When Not to Use

- For small datasets that fit comfortably on one page (less than 25 items)
- When infinite scrolling is more appropriate (social media feeds)
- For sequential content that should be viewed continuously
- When the total count is unknown or difficult to determine
- In mobile contexts where scrolling is more natural (consider alternatives)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard pagination with all controls |
| **Multiple Sizes** | Different page size options |
| **Disabled** | Non-interactive state |
| **Custom Page Sizes** | Configurable size options |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `totalItems` | `number` | required | Total number of items in the dataset |
| `pageSize` | `number` | `10` | Number of items per page |
| `pageSizes` | `number[]` | `[10, 20, 30, 40, 50]` | Available page size options |
| `page` | `number` | `1` | Current page number (controlled) |
| `defaultPage` | `number` | `1` | Initial page (uncontrolled) |
| `onChange` | `function` | - | Callback when page or size changes |
| `disabled` | `boolean` | `false` | Disable all pagination controls |
| `isLastPage` | `boolean` | - | Override last page detection |
| `itemsPerPageText` | `string` | `'Items per page:'` | Label for page size selector |
| `pageRangeText` | `function` | - | Custom function for range text |
| `pageText` | `function` | - | Custom function for page number text |
| `itemText` | `function` | - | Custom function for item text |
| `itemRangeText` | `function` | - | Custom function for item range text |
| `pagesUnknown` | `boolean` | `false` | Hide total page count |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Pagination size variant |

---

## Code Examples

### Basic Usage

```jsx
import { Pagination } from '@carbon/react';
import { useState } from 'react';

function DataList() {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(10);

  return (
    <>
      <Pagination
        totalItems={100}
        pageSize={pageSize}
        page={page}
        pageSizes={[10, 20, 30, 40, 50]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
        }}
      />
    </>
  );
}
```

### With Data Table

```jsx
import { Pagination, DataTable, Table, TableHead, TableRow, TableHeader, TableBody, TableCell } from '@carbon/react';
import { useState } from 'react';

function PaginatedTable({ rows, headers }) {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(10);

  const startIndex = (page - 1) * pageSize;
  const endIndex = startIndex + pageSize;
  const paginatedRows = rows.slice(startIndex, endIndex);

  return (
    <>
      <DataTable rows={paginatedRows} headers={headers}>
        {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
          <Table {...getTableProps()}>
            <TableHead>
              <TableRow>
                {headers.map(header => (
                  <TableHeader {...getHeaderProps({ header })}>
                    {header.header}
                  </TableHeader>
                ))}
              </TableRow>
            </TableHead>
            <TableBody>
              {rows.map(row => (
                <TableRow {...getRowProps({ row })}>
                  {row.cells.map(cell => (
                    <TableCell key={cell.id}>{cell.value}</TableCell>
                  ))}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        )}
      </DataTable>

      <Pagination
        totalItems={rows.length}
        pageSize={pageSize}
        page={page}
        pageSizes={[10, 20, 30, 40, 50]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
        }}
      />
    </>
  );
}
```

### Uncontrolled

```jsx
import { Pagination } from '@carbon/react';

<Pagination
  totalItems={200}
  defaultPage={1}
  pageSize={20}
  pageSizes={[10, 20, 50, 100]}
  onChange={({ page, pageSize }) => {
    console.log('Page changed to:', page);
    console.log('Page size:', pageSize);
  }}
/>
```

### Different Sizes

```jsx
import { Pagination } from '@carbon/react';

<Pagination
  size="sm"
  totalItems={100}
  pageSize={10}
  pageSizes={[10, 20, 30]}
/>

<Pagination
  size="md"
  totalItems={100}
  pageSize={10}
  pageSizes={[10, 20, 30]}
/>

<Pagination
  size="lg"
  totalItems={100}
  pageSize={10}
  pageSizes={[10, 20, 30]}
/>
```

### Custom Text Functions

```jsx
import { Pagination } from '@carbon/react';

<Pagination
  totalItems={100}
  pageSize={10}
  pageSizes={[10, 20, 30]}
  itemsPerPageText="Results per page:"
  pageRangeText={(current, total) => `Page ${current} of ${total}`}
  itemRangeText={(min, max, total) =>
    `Showing ${min}–${max} of ${total} results`
  }
/>
```

### With API Data

```jsx
import { Pagination } from '@carbon/react';
import { useState, useEffect } from 'react';

function RemoteDataTable() {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(20);
  const [data, setData] = useState([]);
  const [totalItems, setTotalItems] = useState(0);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    fetch(`/api/data?page=${page}&limit=${pageSize}`)
      .then(res => res.json())
      .then(result => {
        setData(result.items);
        setTotalItems(result.total);
        setLoading(false);
      });
  }, [page, pageSize]);

  return (
    <>
      {loading ? (
        <div>Loading...</div>
      ) : (
        <div>
          {data.map(item => (
            <div key={item.id}>{item.name}</div>
          ))}
        </div>
      )}

      <Pagination
        totalItems={totalItems}
        pageSize={pageSize}
        page={page}
        pageSizes={[10, 20, 50, 100]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
        }}
      />
    </>
  );
}
```

### Disabled State

```jsx
import { Pagination } from '@carbon/react';

<Pagination
  totalItems={100}
  pageSize={10}
  pageSizes={[10, 20, 30]}
  disabled
/>
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus between pagination controls
- **Enter/Space**: Activate focused button or select page size
- **Arrow Keys**: Navigate through page size dropdown options

### Screen Reader Support

- Page navigation buttons include descriptive labels
- Current page and total pages are announced
- Page size selector is properly labeled
- Item range information is announced when changed

### Best Practices

- Ensure sufficient color contrast for all interactive elements
- Maintain visible focus indicators on all controls
- Use semantic navigation landmarks when appropriate
- Announce page changes to screen reader users
- Keep disabled state visually distinct
- Ensure touch targets are at least 44x44 pixels

---

## Patterns

### Search Results Pagination

```jsx
import { Pagination, Search } from '@carbon/react';
import { useState } from 'react';

function SearchResults() {
  const [searchTerm, setSearchTerm] = useState('');
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(20);
  const [results, setResults] = useState([]);
  const [totalResults, setTotalResults] = useState(0);

  const handleSearch = (value) => {
    setSearchTerm(value);
    setPage(1); // Reset to first page on new search
    // Fetch results...
  };

  return (
    <div>
      <Search
        labelText="Search"
        placeholder="Search..."
        onChange={(e) => handleSearch(e.target.value)}
      />

      <div className="results">
        {results.map(item => (
          <div key={item.id}>{item.title}</div>
        ))}
      </div>

      <Pagination
        totalItems={totalResults}
        pageSize={pageSize}
        page={page}
        pageSizes={[10, 20, 50]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
        }}
      />
    </div>
  );
}
```

### E-commerce Product Listing

```jsx
import { Pagination, Grid, Column } from '@carbon/react';
import { useState } from 'react';

function ProductListing({ products }) {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(12);

  const startIndex = (page - 1) * pageSize;
  const endIndex = startIndex + pageSize;
  const visibleProducts = products.slice(startIndex, endIndex);

  return (
    <div className="product-listing">
      <Grid>
        {visibleProducts.map(product => (
          <Column key={product.id} lg={4} md={4} sm={4}>
            <ProductCard product={product} />
          </Column>
        ))}
      </Grid>

      <Pagination
        totalItems={products.length}
        pageSize={pageSize}
        page={page}
        pageSizes={[12, 24, 48]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        }}
      />
    </div>
  );
}
```

### Admin Dashboard Table

```jsx
import { Pagination, DataTable, TableToolbar, TableToolbarContent, TableToolbarSearch } from '@carbon/react';
import { useState } from 'react';

function AdminTable({ data }) {
  const [page, setPage] = useState(1);
  const [pageSize, setPageSize] = useState(25);
  const [filteredData, setFilteredData] = useState(data);

  const paginatedData = filteredData.slice(
    (page - 1) * pageSize,
    page * pageSize
  );

  return (
    <div>
      <TableToolbar>
        <TableToolbarContent>
          <TableToolbarSearch
            onChange={(e) => {
              const filtered = data.filter(item =>
                item.name.toLowerCase().includes(e.target.value.toLowerCase())
              );
              setFilteredData(filtered);
              setPage(1);
            }}
          />
        </TableToolbarContent>
      </TableToolbar>

      {/* Render table with paginatedData */}

      <Pagination
        totalItems={filteredData.length}
        pageSize={pageSize}
        page={page}
        pageSizes={[25, 50, 100]}
        onChange={({ page, pageSize }) => {
          setPage(page);
          setPageSize(pageSize);
        }}
      />
    </div>
  );
}
```

---

## Related Components

- [PaginationNav](PaginationNav.md) - Simplified page-only navigation
- [DataTable](../DataTable/DataTable.md) - Often used with pagination
- [OverflowMenu](../AdditionalComponents/OverflowMenu.md) - For additional table actions
- [Dropdown](../FormInputs/Dropdown.md) - Similar selector pattern

---

## References

- [Carbon Design System - Pagination](https://www.carbondesignsystem.com/components/pagination/usage)
- [WCAG 2.1 - Pagination](https://www.w3.org/WAI/WCAG21/Techniques/general/G125)
- [UX Pagination Best Practices](https://www.nngroup.com/articles/item-list-view-all/)

# Search

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-search--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Search) | [Usage guidelines](https://www.carbondesignsystem.com/components/search/usage) | [Accessibility](https://www.carbondesignsystem.com/components/search/accessibility)

## Overview

Search enables users to specify a word or phrase to find relevant content without navigation. It's typically used to filter or refine a set of results or to find content within a page or application.

## When to use

- **Filter results**: When users need to quickly find specific items in a list or dataset
- **Site search**: For global navigation and content discovery
- **Filter tables**: When filtering rows in a data table
- **Narrow options**: When helping users narrow down a large set of options
- **Autocomplete**: When providing search suggestions or autocomplete

## When not to use

- **Simple text input**: Use TextInput for general text entry without search functionality
- **Complex filtering**: Use advanced filter components for multi-criteria filtering
- **Navigation**: Use breadcrumbs or navigation components for site structure

## Live Demo

```jsx
import { Search } from '@carbon/react';

function Example() {
  return (
    <Search
      labelText="Search"
      placeholder="Search..."
      closeButtonLabelText="Clear search input"
      id="search-1"
      onChange={(e) => console.log(e.target.value)}
    />
  );
}
```

## Variants

### Default
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-default"
  size="md"
/>
```

### Small size
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-small"
  size="sm"
/>
```

### Large size
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-large"
  size="lg"
/>
```

### Expandable
```jsx
import { ExpandableSearch } from '@carbon/react';

<ExpandableSearch
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-expandable"
  size="lg"
/>
```

### Disabled
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-disabled"
  disabled
/>
```

### With initial value
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-value"
  defaultValue="Initial search"
/>
```

### With light theme
```jsx
<Search
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search input"
  id="search-light"
  light
/>
```

## Controlled Component

```jsx
import { useState } from 'react';
import { Search } from '@carbon/react';

function ControlledSearch() {
  const [searchValue, setSearchValue] = useState('');

  return (
    <div>
      <Search
        labelText="Search"
        placeholder="Search..."
        closeButtonLabelText="Clear search input"
        id="controlled-search"
        value={searchValue}
        onChange={(e) => setSearchValue(e.target.value)}
        onClear={() => setSearchValue('')}
      />

      <p>Searching for: {searchValue}</p>
    </div>
  );
}
```

## Data Table Search

```jsx
import { useState } from 'react';
import { Search } from '@carbon/react';

function TableSearch() {
  const [data] = useState([
    { id: 1, name: 'Alice Johnson', email: 'alice@example.com' },
    { id: 2, name: 'Bob Smith', email: 'bob@example.com' },
    { id: 3, name: 'Charlie Brown', email: 'charlie@example.com' }
  ]);

  const [searchTerm, setSearchTerm] = useState('');

  const filteredData = data.filter(item =>
    item.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    item.email.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      <Search
        labelText="Search users"
        placeholder="Search by name or email..."
        closeButtonLabelText="Clear search input"
        id="table-search"
        onChange={(e) => setSearchTerm(e.target.value)}
        onClear={() => setSearchTerm('')}
      />

      <table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          {filteredData.map(item => (
            <tr key={item.id}>
              <td>{item.name}</td>
              <td>{item.email}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <p>{filteredData.length} results found</p>
    </div>
  );
}
```

## Debounced Search

```jsx
import { useState, useEffect } from 'react';
import { Search } from '@carbon/react';

function DebouncedSearch() {
  const [value, setValue] = useState('');
  const [debouncedValue, setDebouncedValue] = useState('');

  // Debounce search input
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedValue(value);
    }, 500);

    return () => clearTimeout(timer);
  }, [value]);

  // Perform search when debounced value changes
  useEffect(() => {
    if (debouncedValue) {
      performSearch(debouncedValue);
    }
  }, [debouncedValue]);

  const performSearch = (query) => {
    console.log('Searching for:', query);
    // API call here
  };

  return (
    <Search
      labelText="Search"
      placeholder="Search products..."
      closeButtonLabelText="Clear search input"
      id="debounced-search"
      value={value}
      onChange={(e) => setValue(e.target.value)}
      onClear={() => setValue('')}
    />
  );
}
```

## Search with Autocomplete

```jsx
import { useState } from 'react';
import { Search } from '@carbon/react';

function AutocompleteSearch() {
  const [searchValue, setSearchValue] = useState('');
  const [suggestions, setSuggestions] = useState([]);

  const allItems = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry',
    'Fig', 'Grape', 'Honeydew', 'Kiwi', 'Lemon'
  ];

  const handleChange = (e) => {
    const value = e.target.value;
    setSearchValue(value);

    if (value.length > 0) {
      const filtered = allItems.filter(item =>
        item.toLowerCase().includes(value.toLowerCase())
      );
      setSuggestions(filtered);
    } else {
      setSuggestions([]);
    }
  };

  return (
    <div>
      <Search
        labelText="Search"
        placeholder="Search fruits..."
        closeButtonLabelText="Clear search input"
        id="autocomplete-search"
        value={searchValue}
        onChange={handleChange}
        onClear={() => {
          setSearchValue('');
          setSuggestions([]);
        }}
      />

      {suggestions.length > 0 && (
        <ul style={{ listStyle: 'none', padding: 0, margin: 0 }}>
          {suggestions.map((suggestion, index) => (
            <li
              key={index}
              style={{ padding: '8px', cursor: 'pointer' }}
              onClick={() => {
                setSearchValue(suggestion);
                setSuggestions([]);
              }}
            >
              {suggestion}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
```

## Expandable Search Pattern

```jsx
import { useState } from 'react';
import { ExpandableSearch } from '@carbon/react';

function ExpandableSearchExample() {
  const [isExpanded, setIsExpanded] = useState(false);
  const [searchValue, setSearchValue] = useState('');

  return (
    <ExpandableSearch
      labelText="Search"
      placeholder="Search..."
      closeButtonLabelText="Clear search input"
      id="expandable-example"
      size="lg"
      value={searchValue}
      onChange={(e) => setSearchValue(e.target.value)}
      onExpand={() => setIsExpanded(true)}
      onClear={() => setSearchValue('')}
    />
  );
}
```

## Component API

### Search

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `autoComplete` | `string` | `'off'` | Specify the autocomplete attribute for the input |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `closeButtonLabelText` | `string` | `'Clear search input'` | Label text for the close button |
| `defaultValue` | `string \| number` | - | Default value of the input (uncontrolled) |
| `disabled` | `boolean` | `false` | Specify whether the input should be disabled |
| `id` | `string` | - | Specify a custom id for the input |
| `labelText` | `node` | **Required** | Provide the label text for the Search icon |
| `light` | `boolean` | `false` | Specify whether to use light styles (deprecated) |
| `onChange` | `func` | `() => {}` | Provide an optional function to be called when the search value changes. Signature: `(event) => void` |
| `onClear` | `func` | `() => {}` | Provide an optional function to be called when the search value is cleared |
| `onKeyDown` | `func` | - | Provide a handler that is invoked on the key down event for the input |
| `placeholder` | `string` | `'Search'` | Provide an optional placeholder text for the Search |
| `renderIcon` | `func \| object` | - | Custom icon component to render instead of the default search icon |
| `role` | `string` | - | Deprecated: Specify the role for the underlying input |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the Search |
| `type` | `string` | `'search'` | Specify the type of the input |
| `value` | `string \| number` | - | Specify the value of the input (controlled) |

### ExpandableSearch

Inherits all props from `Search` with these additions:

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `isExpanded` | `boolean` | `true` | Specify whether the ExpandableSearch should render expanded or not |
| `onExpand` | `func` | - | Provide an optional function to be called when the magnifier icon is clicked |

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to/from the search input
- **Enter**: Submit search or trigger search action
- **Escape**: Clear search input and close expandable search
- **Down Arrow**: Move to search suggestions (if implemented)
- **Up Arrow**: Move to previous suggestion (if implemented)

### Screen readers
- Label text is announced for the input
- Placeholder provides additional context
- Clear button is properly labeled
- Search icon has appropriate description
- Results count should be announced when available

### Best practices
- Always provide meaningful `labelText`
- Use clear `placeholder` text to indicate what can be searched
- Provide `closeButtonLabelText` for screen readers
- Announce search results count
- Announce when no results are found
- Provide feedback during search
- Ensure sufficient color contrast (4.5:1 for text)
- Don't rely solely on color to indicate state
- Consider debouncing for API searches

### ARIA attributes
- `role="search"` for the search container
- `aria-label` for the input
- `aria-describedby` for additional context
- `aria-live="polite"` for search results
- `aria-busy` during search operations

## Search Patterns

### Global Site Search
```jsx
<Search
  labelText="Site search"
  placeholder="Search documentation..."
  closeButtonLabelText="Clear search"
  id="site-search"
  size="lg"
  onChange={handleSiteSearch}
/>
```

### Table Filtering
```jsx
<Search
  labelText="Filter table"
  placeholder="Filter rows..."
  closeButtonLabelText="Clear filter"
  id="table-filter"
  size="md"
  onChange={handleTableFilter}
/>
```

### Inline Search
```jsx
<Search
  labelText="Quick search"
  placeholder="Search..."
  closeButtonLabelText="Clear"
  id="inline-search"
  size="sm"
  onChange={handleInlineSearch}
/>
```

### Header Search
```jsx
<ExpandableSearch
  labelText="Search"
  placeholder="Search..."
  closeButtonLabelText="Clear search"
  id="header-search"
  size="lg"
/>
```

## Performance Tips

1. **Debounce search input** - Prevent excessive API calls by debouncing user input
2. **Limit results** - Show a maximum number of results and provide pagination
3. **Cache results** - Store recent search results to avoid redundant API calls
4. **Use lazy loading** - Load results as the user scrolls
5. **Optimize queries** - Use indexed database fields for better search performance

## Related components

- **[TextInput](TextInput.md)**: For general text entry without search
- **[Dropdown](Dropdown.md)**: For selecting from predefined options
- **[ComboBox](ComboBox.md)**: For searchable dropdown
- **[DataTable](DataTable.md)**: Often used with search for filtering

## References

- [Carbon Design System - Search Usage](https://www.carbondesignsystem.com/components/search/usage)
- [Carbon Design System - Search Accessibility](https://www.carbondesignsystem.com/components/search/accessibility)
- [Carbon React Storybook - Search](https://react.carbondesignsystem.com/?path=/docs/components-search--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/Search)

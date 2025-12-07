# Loading

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-loading--overview) | [Usage Guidelines](https://carbondesignsystem.com/components/loading/usage) | [Accessibility](https://carbondesignsystem.com/components/loading/accessibility)

## Overview
Loading is a full-page or overlay loading indicator that displays a spinning animation to communicate that content or an operation is in progress. It provides visual feedback during data fetching, processing, or any asynchronous operation that requires user patience.

## When to Use

- **Initial page load**: Display while fetching primary page content or data
- **Full-page operations**: Show during operations that affect the entire page or application
- **Data processing**: Indicate when long-running processes are executing
- **Overlay scenarios**: Block user interaction during critical operations that must complete
- **App transitions**: Provide feedback during route changes or major state transitions
- **Modal operations**: Display within modals during async operations

## When Not to Use

- **Inline content**: Use InlineLoading for loading states within specific components
- **Table rows**: Use SkeletonText or SkeletonPlaceholder for table loading states
- **Button actions**: Use Button loading state for individual button operations
- **Progressive loading**: Use skeleton components for initial page structure
- **Quick operations**: For operations under 300ms, loading indicators may cause more disruption than value

## Component API

### Basic Usage
```jsx
import { Loading } from '@carbon/react';

function App() {
  return (
    <Loading description="Loading content..." />
  );
}
```

### With Overlay
```jsx
import { Loading } from '@carbon/react';

function OverlayLoading() {
  return (
    <Loading
      description="Processing your request..."
      withOverlay={true}
    />
  );
}
```

### Small Variant
```jsx
import { Loading } from '@carbon/react';

function SmallLoading() {
  return (
    <Loading
      description="Loading..."
      small
    />
  );
}
```

### Conditional Loading
```jsx
import { useState, useEffect } from 'react';
import { Loading } from '@carbon/react';

function ConditionalLoading() {
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => setIsLoading(false), 3000);
  }, []);

  return (
    <div>
      {isLoading && (
        <Loading
          description="Fetching data..."
          withOverlay={true}
        />
      )}
      <div>
        <h2>Content</h2>
        <p>Your content appears after loading completes.</p>
      </div>
    </div>
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| description | `string` | `'Loading'` | Accessible description for the loading indicator |
| withOverlay | `boolean` | `false` | Show semi-transparent overlay behind loading indicator |
| small | `boolean` | `false` | Use smaller loading indicator size |
| active | `boolean` | `true` | Control loading indicator visibility |
| className | `string` | - | Additional CSS class names |
| id | `string` | - | ID for the loading element |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| N/A | Loading indicator is not interactive |

### Screen Reader Support

Loading provides accessibility through:
- Uses `role="progressbar"` for screen reader announcement
- `aria-live="assertive"` announces loading state immediately
- `aria-busy="true"` indicates busy state to assistive technologies
- Description is announced to screen readers
- Overlay blocks interaction and prevents focus on underlying content

### Best Practices

1. **Provide meaningful descriptions**: Use clear, contextual loading messages
2. **Show early**: Display loading indicator immediately when operation starts
3. **Don't overuse overlays**: Only use withOverlay when blocking interaction is necessary
4. **Consider alternatives**: For known content structure, use skeleton components
5. **Minimum display time**: Consider showing loading for at least 300ms to avoid flashing
6. **Progress indication**: For long operations, consider using ProgressBar with percentage
7. **Error states**: Always handle and display error states when loading fails
8. **Cancellation**: Provide a way to cancel long-running operations when appropriate

## Patterns

### Page-Level Loading
```jsx
import { useState, useEffect } from 'react';
import { Loading } from '@carbon/react';

function PageLoading() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        const response = await fetch('/api/data');
        const result = await response.json();
        setData(result);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, []);

  if (loading) {
    return <Loading description="Loading page content..." withOverlay />;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>Page Content</h1>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
}
```

### Modal with Loading State
```jsx
import { useState } from 'react';
import {
  ComposedModal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Button,
  Loading
} from '@carbon/react';

function ModalWithLoading() {
  const [open, setOpen] = useState(false);
  const [loading, setLoading] = useState(false);

  const handleSubmit = async () => {
    setLoading(true);

    try {
      await new Promise(resolve => setTimeout(resolve, 2000));
      console.log('Operation completed');
      setOpen(false);
    } catch (error) {
      console.error('Operation failed:', error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <>
      <Button onClick={() => setOpen(true)}>Open Modal</Button>

      <ComposedModal
        open={open}
        onClose={() => !loading && setOpen(false)}
        preventCloseOnClickOutside={loading}
      >
        <ModalHeader>
          <h3>Process Data</h3>
        </ModalHeader>
        <ModalBody>
          {loading ? (
            <Loading description="Processing data..." />
          ) : (
            <p>Click submit to process your data.</p>
          )}
        </ModalBody>
        <ModalFooter>
          <Button kind="secondary" onClick={() => setOpen(false)} disabled={loading}>
            Cancel
          </Button>
          <Button kind="primary" onClick={handleSubmit} disabled={loading}>
            Submit
          </Button>
        </ModalFooter>
      </ComposedModal>
    </>
  );
}
```

### Data Table Loading
```jsx
import { useState, useEffect } from 'react';
import { Loading, DataTable, Button } from '@carbon/react';

function DataTableLoading() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(false);

  const loadData = async () => {
    setLoading(true);
    try {
      await new Promise(resolve => setTimeout(resolve, 1500));
      setRows([
        { id: '1', name: 'Item 1', status: 'Active' },
        { id: '2', name: 'Item 2', status: 'Inactive' }
      ]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  const headers = [
    { key: 'name', header: 'Name' },
    { key: 'status', header: 'Status' }
  ];

  return (
    <div style={{ position: 'relative', minHeight: '200px' }}>
      {loading && <Loading description="Loading table data..." withOverlay />}

      <Button onClick={loadData} disabled={loading} style={{ marginBottom: '1rem' }}>
        Refresh Data
      </Button>

      <DataTable rows={rows} headers={headers}>
        {({ rows, headers, getTableProps, getHeaderProps, getRowProps }) => (
          <table {...getTableProps()}>
            <thead>
              <tr>
                {headers.map(header => (
                  <th {...getHeaderProps({ header })} key={header.key}>
                    {header.header}
                  </th>
                ))}
              </tr>
            </thead>
            <tbody>
              {rows.map(row => (
                <tr {...getRowProps({ row })} key={row.id}>
                  {row.cells.map(cell => (
                    <td key={cell.id}>{cell.value}</td>
                  ))}
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </DataTable>
    </div>
  );
}
```

### Timed Loading with Minimum Duration
```jsx
import { useState } from 'react';
import { Loading, Button } from '@carbon/react';

function TimedLoading() {
  const [loading, setLoading] = useState(false);

  const handleOperation = async () => {
    setLoading(true);
    const startTime = Date.now();

    try {
      // Perform actual operation
      await new Promise(resolve => setTimeout(resolve, 500));

      // Ensure minimum loading duration of 800ms
      const elapsed = Date.now() - startTime;
      const remaining = Math.max(0, 800 - elapsed);
      await new Promise(resolve => setTimeout(resolve, remaining));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <Button onClick={handleOperation} disabled={loading}>
        Start Operation
      </Button>

      {loading && (
        <div style={{ marginTop: '2rem' }}>
          <Loading description="Processing..." withOverlay={false} />
        </div>
      )}
    </div>
  );
}
```

### Multiple Loading States
```jsx
import { useState } from 'react';
import { Loading, Button } from '@carbon/react';

function MultipleLoadingStates() {
  const [states, setStates] = useState({
    users: false,
    posts: false,
    comments: false
  });

  const loadSection = async (section) => {
    setStates(prev => ({ ...prev, [section]: true }));
    await new Promise(resolve => setTimeout(resolve, 2000));
    setStates(prev => ({ ...prev, [section]: false }));
  };

  return (
    <div>
      <div style={{ display: 'flex', gap: '1rem', marginBottom: '2rem' }}>
        <Button onClick={() => loadSection('users')}>Load Users</Button>
        <Button onClick={() => loadSection('posts')}>Load Posts</Button>
        <Button onClick={() => loadSection('comments')}>Load Comments</Button>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: '1rem' }}>
        <div style={{ position: 'relative', minHeight: '150px', border: '1px solid #ccc', padding: '1rem' }}>
          <h3>Users</h3>
          {states.users && <Loading description="Loading users..." small />}
        </div>
        <div style={{ position: 'relative', minHeight: '150px', border: '1px solid #ccc', padding: '1rem' }}>
          <h3>Posts</h3>
          {states.posts && <Loading description="Loading posts..." small />}
        </div>
        <div style={{ position: 'relative', minHeight: '150px', border: '1px solid #ccc', padding: '1rem' }}>
          <h3>Comments</h3>
          {states.comments && <Loading description="Loading comments..." small />}
        </div>
      </div>
    </div>
  );
}
```

## Related Components

- **InlineLoading**: Use for inline loading states within components or next to specific elements
- **SkeletonText**: Use to show placeholder content while data loads
- **SkeletonPlaceholder**: Use for custom skeleton loading states
- **ProgressIndicator**: Use for multi-step processes with defined stages
- **ProgressBar**: Use for operations with measurable progress percentage
- **Button (loading state)**: Use for button-specific loading states

## References

- [Carbon Design System - Loading](https://carbondesignsystem.com/components/loading/usage)
- [Carbon React Storybook - Loading](https://react.carbondesignsystem.com/?path=/docs/components-loading--overview)
- [Loading Accessibility](https://carbondesignsystem.com/components/loading/accessibility)
- [ARIA Progressbar Role](https://www.w3.org/WAI/ARIA/apg/patterns/meter/)

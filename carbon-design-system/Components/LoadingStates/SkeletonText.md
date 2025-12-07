# SkeletonText

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-skeleton-skeletontext--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/skeleton-states/usage) | [Accessibility](https://www.carbondesignsystem.com/components/skeleton-states/accessibility)

## Overview

SkeletonText provides a placeholder loading state that mimics text content. It displays animated horizontal lines that represent text blocks, giving users visual feedback that content is being loaded.

## When to Use

- When loading text content that takes time to fetch
- To maintain layout stability during data loading
- In lists or tables where text content needs to be displayed
- When you want to show users the general structure of upcoming content
- To reduce perceived loading time by showing immediate visual feedback
- For progressive content loading in dashboards and reports

## When Not to Use

- For loading states of images or media (use SkeletonPlaceholder instead)
- When content loads instantaneously (less than 300ms)
- For entire page loading states (consider using Loading component)
- When the loading state is very brief and would create visual noise

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Single line of skeleton text |
| **Multiple Lines** | Multiple lines using `lineCount` prop |
| **Heading** | Larger skeleton text for headings using `heading` prop |
| **Paragraph** | Wider skeleton text for paragraph content |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Additional CSS classes |
| `heading` | `boolean` | `false` | Renders larger skeleton for heading text |
| `lineCount` | `number` | `3` | Number of skeleton text lines to render |
| `paragraph` | `boolean` | `false` | Renders wider skeleton for paragraph content |
| `width` | `string` | `'100%'` | Width of skeleton text (e.g., '200px', '50%') |

---

## Code Examples

### Basic Usage

```jsx
import { SkeletonText } from '@carbon/react';

<SkeletonText />
```

### Multiple Lines

```jsx
import { SkeletonText } from '@carbon/react';

<SkeletonText lineCount={5} />
```

### Heading Skeleton

```jsx
import { SkeletonText } from '@carbon/react';

<SkeletonText heading lineCount={1} />
```

### Paragraph Skeleton

```jsx
import { SkeletonText } from '@carbon/react';

<SkeletonText paragraph lineCount={4} />
```

### Custom Width

```jsx
import { SkeletonText } from '@carbon/react';

<SkeletonText width="250px" lineCount={3} />
```

### In a Card Layout

```jsx
import { SkeletonText, SkeletonPlaceholder } from '@carbon/react';

function LoadingCard() {
  return (
    <div className="card">
      <SkeletonPlaceholder style={{ width: '100%', height: '200px' }} />
      <div className="card-content">
        <SkeletonText heading lineCount={1} />
        <SkeletonText paragraph lineCount={3} />
      </div>
    </div>
  );
}
```

### Conditional Loading State

```jsx
import { SkeletonText } from '@carbon/react';
import { useState, useEffect } from 'react';

function Article() {
  const [loading, setLoading] = useState(true);
  const [content, setContent] = useState(null);

  useEffect(() => {
    fetchArticle().then(data => {
      setContent(data);
      setLoading(false);
    });
  }, []);

  return (
    <article>
      {loading ? (
        <>
          <SkeletonText heading lineCount={1} />
          <SkeletonText paragraph lineCount={6} />
        </>
      ) : (
        <>
          <h1>{content.title}</h1>
          <p>{content.body}</p>
        </>
      )}
    </article>
  );
}
```

### List Loading State

```jsx
import { SkeletonText } from '@carbon/react';

function LoadingList({ itemCount = 5 }) {
  return (
    <ul>
      {Array.from({ length: itemCount }).map((_, index) => (
        <li key={index} style={{ marginBottom: '1rem' }}>
          <SkeletonText lineCount={2} />
        </li>
      ))}
    </ul>
  );
}
```

---

## Accessibility

### Screen Reader Support

- Skeleton states include `aria-live="polite"` to announce loading states
- The component uses `aria-busy="true"` to indicate loading content
- When content loads, ensure focus management is handled appropriately

### Best Practices

- Always replace skeleton states with actual content
- Avoid using skeleton states for very short loading times (< 300ms)
- Ensure skeleton text structure matches the actual content structure
- Use semantic HTML elements for the content that replaces skeleton states
- Consider announcing "Loading complete" for screen reader users when content loads

### Keyboard Support

- No keyboard interaction required for skeleton states
- Ensure focusable elements appear only after content loads
- Maintain focus on the triggering element during loading

---

## Patterns

### Dashboard Loading

```jsx
import { SkeletonText, SkeletonPlaceholder, Grid, Column } from '@carbon/react';

function DashboardSkeleton() {
  return (
    <Grid>
      <Column lg={8}>
        <SkeletonText heading lineCount={1} />
        <SkeletonPlaceholder style={{ height: '300px', marginTop: '1rem' }} />
      </Column>
      <Column lg={8}>
        <SkeletonText heading lineCount={1} />
        <SkeletonText paragraph lineCount={4} />
      </Column>
    </Grid>
  );
}
```

### Comment Thread Loading

```jsx
import { SkeletonText, SkeletonPlaceholder } from '@carbon/react';

function CommentSkeleton() {
  return (
    <div className="comment">
      <SkeletonPlaceholder
        style={{ width: '40px', height: '40px', borderRadius: '50%' }}
      />
      <div className="comment-content">
        <SkeletonText width="120px" lineCount={1} />
        <SkeletonText lineCount={2} />
      </div>
    </div>
  );
}

function CommentThreadSkeleton() {
  return (
    <div className="comment-thread">
      {[1, 2, 3].map(i => (
        <CommentSkeleton key={i} />
      ))}
    </div>
  );
}
```

### Profile Page Loading

```jsx
import { SkeletonText, SkeletonPlaceholder } from '@carbon/react';

function ProfileSkeleton() {
  return (
    <div className="profile">
      <div className="profile-header">
        <SkeletonPlaceholder
          style={{ width: '100px', height: '100px', borderRadius: '50%' }}
        />
        <div className="profile-info">
          <SkeletonText heading lineCount={1} width="200px" />
          <SkeletonText width="150px" lineCount={1} />
        </div>
      </div>
      <div className="profile-bio">
        <SkeletonText paragraph lineCount={3} />
      </div>
    </div>
  );
}
```

### Data Table Loading

```jsx
import { SkeletonText } from '@carbon/react';

function TableRowSkeleton({ columns = 4 }) {
  return (
    <tr>
      {Array.from({ length: columns }).map((_, index) => (
        <td key={index}>
          <SkeletonText lineCount={1} />
        </td>
      ))}
    </tr>
  );
}

function TableSkeleton({ rows = 5, columns = 4 }) {
  return (
    <table>
      <tbody>
        {Array.from({ length: rows }).map((_, index) => (
          <TableRowSkeleton key={index} columns={columns} />
        ))}
      </tbody>
    </table>
  );
}
```

### Form Loading State

```jsx
import { SkeletonText } from '@carbon/react';

function FormSkeleton() {
  return (
    <form>
      <div className="form-field">
        <SkeletonText width="100px" lineCount={1} />
        <SkeletonText width="100%" lineCount={1} />
      </div>
      <div className="form-field">
        <SkeletonText width="80px" lineCount={1} />
        <SkeletonText width="100%" lineCount={1} />
      </div>
      <div className="form-field">
        <SkeletonText width="120px" lineCount={1} />
        <SkeletonText width="100%" lineCount={3} />
      </div>
    </form>
  );
}
```

---

## Related Components

- [SkeletonPlaceholder](SkeletonPlaceholder.md) - For loading states of images and custom content
- [Loading](Loading.md) - For full-page or section loading indicators
- [InlineLoading](InlineLoading.md) - For inline loading states with status
- [ProgressBar](../ProgressIndicator/ProgressBar.md) - For determinate loading progress
- [DataTable](../DataTable/DataTable.md) - Has built-in skeleton state support

---

## References

- [Carbon Design System - Skeleton States](https://www.carbondesignsystem.com/components/skeleton-states/usage)
- [ARIA Live Regions](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Live_Regions)
- [Progressive Loading Patterns](https://www.nngroup.com/articles/progress-indicators/)

# Breadcrumb

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-breadcrumb--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/breadcrumb/usage) | [Accessibility](https://www.carbondesignsystem.com/components/breadcrumb/accessibility)

## Overview

Breadcrumb provides secondary navigation showing users their current location within a hierarchical structure and enabling them to navigate back to parent pages. It displays a path of links separated by dividers, helping users understand and navigate site hierarchy.

## When to Use

- To show the current page's location in a hierarchical site structure
- When users need to navigate back to parent levels
- In multi-level navigation systems (3 or more levels)
- For e-commerce category navigation
- In documentation or help systems
- When users might enter from different entry points

## When Not to Use

- On single-level or flat site structures
- When navigation history (browser back) is sufficient
- For step-by-step processes (use ProgressIndicator instead)
- On small screens where space is limited (consider hiding or truncating)
- For lateral navigation between sibling pages

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard breadcrumb trail |
| **With Overflow** | Collapses middle items with overflow menu |
| **Current Page** | Last item represents current page (not clickable) |
| **Skeleton** | Loading state placeholder |

---

## Props

### Breadcrumb Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `noTrailingSlash` | `boolean` | `false` | Hide trailing slash after last item |
| `className` | `string` | - | Additional CSS classes |
| `children` | `node` | - | BreadcrumbItem components |

### BreadcrumbItem Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `href` | `string` | - | URL for the breadcrumb link |
| `isCurrentPage` | `boolean` | `false` | Marks item as current page (not clickable) |
| `children` | `node` | required | Link text content |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Usage

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

<Breadcrumb>
  <BreadcrumbItem href="/">Home</BreadcrumbItem>
  <BreadcrumbItem href="/products">Products</BreadcrumbItem>
  <BreadcrumbItem isCurrentPage>Details</BreadcrumbItem>
</Breadcrumb>
```

### With React Router

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';
import { Link } from 'react-router-dom';

<Breadcrumb>
  <BreadcrumbItem>
    <Link to="/">Home</Link>
  </BreadcrumbItem>
  <BreadcrumbItem>
    <Link to="/catalog">Catalog</Link>
  </BreadcrumbItem>
  <BreadcrumbItem>
    <Link to="/catalog/electronics">Electronics</Link>
  </BreadcrumbItem>
  <BreadcrumbItem isCurrentPage>
    Laptops
  </BreadcrumbItem>
</Breadcrumb>
```

### Without Trailing Slash

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

<Breadcrumb noTrailingSlash>
  <BreadcrumbItem href="/">Home</BreadcrumbItem>
  <BreadcrumbItem href="/docs">Documentation</BreadcrumbItem>
  <BreadcrumbItem isCurrentPage>Getting Started</BreadcrumbItem>
</Breadcrumb>
```

### With Overflow Menu

```jsx
import { Breadcrumb, BreadcrumbItem, OverflowMenu, OverflowMenuItem } from '@carbon/react';

<Breadcrumb>
  <BreadcrumbItem href="/">Home</BreadcrumbItem>
  <BreadcrumbItem>
    <OverflowMenu flipped>
      <OverflowMenuItem itemText="Category A" href="/a" />
      <OverflowMenuItem itemText="Category B" href="/b" />
      <OverflowMenuItem itemText="Category C" href="/c" />
    </OverflowMenu>
  </BreadcrumbItem>
  <BreadcrumbItem href="/products">Products</BreadcrumbItem>
  <BreadcrumbItem isCurrentPage>Item Details</BreadcrumbItem>
</Breadcrumb>
```

### Dynamic Breadcrumbs from URL

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';
import { useLocation, Link } from 'react-router-dom';

function DynamicBreadcrumb() {
  const location = useLocation();
  const pathnames = location.pathname.split('/').filter(x => x);

  return (
    <Breadcrumb>
      <BreadcrumbItem>
        <Link to="/">Home</Link>
      </BreadcrumbItem>
      {pathnames.map((name, index) => {
        const routeTo = `/${pathnames.slice(0, index + 1).join('/')}`;
        const isLast = index === pathnames.length - 1;

        return isLast ? (
          <BreadcrumbItem key={name} isCurrentPage>
            {name}
          </BreadcrumbItem>
        ) : (
          <BreadcrumbItem key={name}>
            <Link to={routeTo}>{name}</Link>
          </BreadcrumbItem>
        );
      })}
    </Breadcrumb>
  );
}
```

### E-commerce Category Navigation

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

function ProductBreadcrumb({ product }) {
  return (
    <Breadcrumb>
      <BreadcrumbItem href="/">Home</BreadcrumbItem>
      <BreadcrumbItem href="/shop">Shop</BreadcrumbItem>
      <BreadcrumbItem href={`/shop/${product.category}`}>
        {product.categoryName}
      </BreadcrumbItem>
      <BreadcrumbItem href={`/shop/${product.category}/${product.subcategory}`}>
        {product.subcategoryName}
      </BreadcrumbItem>
      <BreadcrumbItem isCurrentPage>
        {product.name}
      </BreadcrumbItem>
    </Breadcrumb>
  );
}
```

### Documentation Navigation

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

function DocsBreadcrumb({ section, topic, page }) {
  return (
    <Breadcrumb>
      <BreadcrumbItem href="/docs">Documentation</BreadcrumbItem>
      <BreadcrumbItem href={`/docs/${section.slug}`}>
        {section.title}
      </BreadcrumbItem>
      {topic && (
        <BreadcrumbItem href={`/docs/${section.slug}/${topic.slug}`}>
          {topic.title}
        </BreadcrumbItem>
      )}
      <BreadcrumbItem isCurrentPage>
        {page.title}
      </BreadcrumbItem>
    </Breadcrumb>
  );
}
```

### Skeleton Loading State

```jsx
import { BreadcrumbSkeleton } from '@carbon/react';

function LoadingBreadcrumb({ isLoading, children }) {
  if (isLoading) {
    return <BreadcrumbSkeleton />;
  }

  return children;
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus through breadcrumb links
- **Enter**: Activate the focused link
- **Shift + Tab**: Navigate backwards through links

### Screen Reader Support

- Breadcrumb navigation is wrapped in a `<nav>` element with `aria-label="Breadcrumb"`
- Current page is indicated with `aria-current="page"`
- Dividers are decorative and hidden from screen readers
- Each link has a clear, descriptive label

### Best Practices

- Keep breadcrumb labels concise and clear
- Ensure sufficient color contrast for links
- Provide visible focus indicators
- Don't link the current page (use `isCurrentPage`)
- Consider truncating very long breadcrumb trails
- Place breadcrumbs near the top of the page
- Make sure touch targets are at least 44x44 pixels

---

## Patterns

### File System Navigation

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

function FileBreadcrumb({ path }) {
  const segments = path.split('/').filter(Boolean);

  return (
    <Breadcrumb>
      <BreadcrumbItem href="/files">Root</BreadcrumbItem>
      {segments.map((segment, index) => {
        const isLast = index === segments.length - 1;
        const href = '/files/' + segments.slice(0, index + 1).join('/');

        return (
          <BreadcrumbItem
            key={segment}
            href={isLast ? undefined : href}
            isCurrentPage={isLast}
          >
            {segment}
          </BreadcrumbItem>
        );
      })}
    </Breadcrumb>
  );
}
```

### Multi-Step Form with Context

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

function FormBreadcrumb({ steps, currentStep }) {
  return (
    <Breadcrumb>
      {steps.map((step, index) => {
        const isCurrent = index === currentStep;
        const isCompleted = index < currentStep;

        return (
          <BreadcrumbItem
            key={step.id}
            href={isCompleted ? `/form/${step.id}` : undefined}
            isCurrentPage={isCurrent}
          >
            {step.label}
          </BreadcrumbItem>
        );
      })}
    </Breadcrumb>
  );
}
```

### Admin Dashboard Navigation

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

function AdminBreadcrumb({ resource, action }) {
  return (
    <Breadcrumb>
      <BreadcrumbItem href="/admin">Dashboard</BreadcrumbItem>
      <BreadcrumbItem href={`/admin/${resource.type}`}>
        {resource.typeName}
      </BreadcrumbItem>
      {resource.id && (
        <BreadcrumbItem href={`/admin/${resource.type}/${resource.id}`}>
          {resource.name}
        </BreadcrumbItem>
      )}
      {action && (
        <BreadcrumbItem isCurrentPage>
          {action}
        </BreadcrumbItem>
      )}
    </Breadcrumb>
  );
}
```

---

## Related Components

- [Link](../AdditionalComponents/Link.md) - For standalone navigation links
- [Tabs](../Tabs/Tabs.md) - For organizing content into sections
- [ProgressIndicator](../ProgressIndicator/ProgressIndicator.md) - For linear step-by-step flows
- [UIShell](../UIShell/UIShell.md) - For primary navigation structure

---

## References

- [Carbon Design System - Breadcrumb](https://www.carbondesignsystem.com/components/breadcrumb/usage)
- [WCAG 2.1 - Breadcrumb Trail](https://www.w3.org/WAI/ARIA/apg/patterns/breadcrumb/)
- [Nielsen Norman Group - Breadcrumb Navigation](https://www.nngroup.com/articles/breadcrumb-navigation-useful/)

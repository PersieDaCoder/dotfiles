# Link

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-link--overview)

## Overview

The Link component is used to navigate users to different pages or sections within an application or to external resources. It provides a styled anchor element that follows Carbon Design System guidelines and can be integrated with React Router or other routing solutions.

## When to use

- To navigate users to another page within your application
- To link to external websites or resources
- For navigation within long-form content
- When you need an accessible, keyboard-navigable link
- For download links or email/phone links

## When not to use

- For actions that don't navigate (use Button instead)
- For primary actions in forms (use Button)
- When a button would be more semantically correct
- Don't use links that look like buttons (maintain consistency)

## Usage

### Basic Example

```jsx
import { Link } from '@carbon/react';

function MyComponent() {
  return (
    <Link href="https://www.carbondesignsystem.com">
      Visit Carbon Design System
    </Link>
  );
}
```

### Inline Link

```jsx
<p>
  Learn more about our{' '}
  <Link href="/privacy" inline>
    privacy policy
  </Link>
  {' '}and{' '}
  <Link href="/terms" inline>
    terms of service
  </Link>.
</p>
```

### Disabled Link

```jsx
<Link href="#" disabled>
  This link is disabled
</Link>
```

### Link Sizes

```jsx
{/* Small */}
<Link href="#" size="sm">
  Small link
</Link>

{/* Medium (default) */}
<Link href="#" size="md">
  Medium link
</Link>

{/* Large */}
<Link href="#" size="lg">
  Large link
</Link>
```

### Visited State

```jsx
<Link href="#visited" visited>
  Visited link
</Link>
```

### With Icons

```jsx
import { Link } from '@carbon/react';
import { Launch, Download } from '@carbon/icons-react';

{/* External link with icon */}
<Link href="https://example.com" renderIcon={Launch}>
  External link
</Link>

{/* Download link with icon */}
<Link href="/document.pdf" renderIcon={Download}>
  Download PDF
</Link>
```

### Opening in New Tab

```jsx
<Link
  href="https://www.carbondesignsystem.com"
  target="_blank"
  rel="noopener noreferrer"
>
  Open in new tab
</Link>
```

### With React Router

```jsx
import { Link } from '@carbon/react';
import { Link as RouterLink } from 'react-router-dom';

{/* Using as prop */}
<Link as={RouterLink} to="/dashboard">
  Go to Dashboard
</Link>

{/* Alternative with custom component */}
function CustomLink(props) {
  return <Link as={RouterLink} {...props} />;
}

<CustomLink to="/profile">View Profile</CustomLink>
```

### Email and Phone Links

```jsx
{/* Email link */}
<Link href="mailto:support@example.com">
  Contact Support
</Link>

{/* Phone link */}
<Link href="tel:+1234567890">
  Call us: +1 (234) 567-890
</Link>
```

### Download Link

```jsx
<Link href="/files/report.pdf" download>
  Download Report
</Link>
```

### Link in Lists

```jsx
import { UnorderedList, ListItem, Link } from '@carbon/react';

<UnorderedList>
  <ListItem>
    <Link href="/getting-started">Getting Started</Link>
  </ListItem>
  <ListItem>
    <Link href="/documentation">Documentation</Link>
  </ListItem>
  <ListItem>
    <Link href="/api-reference">API Reference</Link>
  </ListItem>
</UnorderedList>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** The content of the link |
| `className` | `string` | - | Custom CSS class name |
| `disabled` | `bool` | `false` | Specify whether the link should be disabled |
| `download` | `bool \| string` | - | Specify that the target will be downloaded when clicked. Can optionally provide a filename string |
| `href` | `string` | - | **Required (unless using as prop).** The URL the link points to |
| `inline` | `bool` | `false` | Specify whether the link should be inline (for use within text) |
| `onClick` | `func` | - | Click handler for the link |
| `rel` | `string` | - | Relationship between current document and linked document (e.g., "noopener noreferrer" for external links) |
| `renderIcon` | `func \| object` | - | Icon to render alongside the link text |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the link |
| `target` | `string` | - | Where to open the linked document (_blank, _self, _parent, _top) |
| `visited` | `bool` | `false` | Apply visited state styling |
| `as` | `elementType` | `'a'` | Provide a custom component or element to render as the base element |

## Accessibility

- Links use semantic `<a>` elements by default
- Keyboard accessible (Tab to focus, Enter to activate)
- Provide descriptive link text (avoid "click here" or "read more")
- Use `rel="noopener noreferrer"` with `target="_blank"` for security
- External links should be clearly indicated
- Disabled links are announced as disabled to screen readers
- Sufficient color contrast for link text
- Visible focus indicators for keyboard navigation

## Best Practices

### Do

- Write descriptive link text that makes sense out of context
- Use inline links within paragraphs of text
- Indicate external links with icons or visual cues
- Use appropriate `rel` attributes for external links
- Provide context for links that open in new tabs
- Use consistent link styling throughout your application

### Don't

- Don't use vague link text like "click here" or "read more"
- Don't use links for actions (use buttons)
- Don't open links in new tabs without informing users
- Don't style buttons to look like links or vice versa
- Don't use color alone to distinguish links
- Don't create links that navigate nowhere (use disabled state)

## Link Text Guidelines

### Good Examples
```jsx
// Specific and descriptive
<Link href="/privacy-policy">Read our privacy policy</Link>

// Action-oriented
<Link href="/signup">Create your account</Link>

// Clear destination
<Link href="/documentation">View documentation</Link>
```

### Poor Examples
```jsx
// Too vague
<Link href="/privacy-policy">Click here</Link>

// Lacks context
<Link href="/signup">Here</Link>

// Not descriptive
<Link href="/documentation">Read more</Link>
```

## Security Considerations

### External Links

```jsx
// Always use rel="noopener noreferrer" with target="_blank"
<Link
  href="https://external-site.com"
  target="_blank"
  rel="noopener noreferrer"
>
  External Site
</Link>
```

- `noopener`: Prevents the new page from accessing window.opener
- `noreferrer`: Prevents the browser from sending the referrer header

## Integration Examples

### With Next.js

```jsx
import { Link } from '@carbon/react';
import NextLink from 'next/link';

function MyComponent() {
  return (
    <Link as={NextLink} href="/about">
      About Us
    </Link>
  );
}
```

### With Gatsby

```jsx
import { Link } from '@carbon/react';
import { Link as GatsbyLink } from 'gatsby';

function MyComponent() {
  return (
    <Link as={GatsbyLink} to="/blog">
      Visit our blog
    </Link>
  );
}
```

### Conditional Rendering

```jsx
function ConditionalLink({ href, external, children }) {
  const linkProps = external
    ? { target: '_blank', rel: 'noopener noreferrer', renderIcon: Launch }
    : {};

  return (
    <Link href={href} {...linkProps}>
      {children}
    </Link>
  );
}

// Usage
<ConditionalLink href="/internal">Internal page</ConditionalLink>
<ConditionalLink href="https://example.com" external>External site</ConditionalLink>
```

## Common Patterns

### Breadcrumb Links

```jsx
import { Breadcrumb, BreadcrumbItem } from '@carbon/react';

<Breadcrumb>
  <BreadcrumbItem>
    <Link href="/">Home</Link>
  </BreadcrumbItem>
  <BreadcrumbItem>
    <Link href="/products">Products</Link>
  </BreadcrumbItem>
  <BreadcrumbItem isCurrentPage>
    Current Page
  </BreadcrumbItem>
</Breadcrumb>
```

### Footer Links

```jsx
function Footer() {
  return (
    <footer>
      <nav>
        <Link href="/about" size="sm">About</Link>
        <Link href="/contact" size="sm">Contact</Link>
        <Link href="/privacy" size="sm">Privacy</Link>
        <Link href="/terms" size="sm">Terms</Link>
      </nav>
    </footer>
  );
}
```

### Card with Link

```jsx
import { Tile, Link } from '@carbon/react';

<Tile>
  <h3>Article Title</h3>
  <p>Brief description of the article content...</p>
  <Link href="/article/123">Read full article</Link>
</Tile>
```

## Styling

- Links use Carbon Design System color tokens
- Default state: Primary link color
- Hover state: Darker shade
- Visited state: Purple tint (when visited prop is true)
- Focus state: Visible focus outline
- Disabled state: Lower opacity and no pointer interaction
- Inline links inherit font size from parent
- Standalone links can use size prop

## Related Components

- **Button**: Use for actions rather than navigation
- **Breadcrumb**: Contains link components for navigation hierarchy
- **Tabs**: Alternative navigation pattern for switching views
- **Navigation**: UI Shell component for app-level navigation

## Available Variants

- Default (standalone)
- Inline
- With icons
- Disabled
- Visited
- Different sizes (sm, md, lg)
- External (with target="_blank")
- Download links

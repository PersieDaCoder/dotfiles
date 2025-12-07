# Heading

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-heading--overview)

## Overview

The Heading component provides a semantic and styled heading element that follows Carbon Design System typography guidelines. It allows you to create properly structured headings with consistent styling while maintaining flexibility in the visual hierarchy.

## When to use

- To create semantic document structure with proper heading levels
- When you need to separate the semantic level from the visual appearance
- For maintaining consistent typography across your application
- When building accessible content hierarchies
- To implement Carbon Design System type styles

## When not to use

- For body text or paragraphs (use standard text elements)
- When a simple HTML heading element is sufficient
- For emphasized text that isn't actually a heading (use appropriate text styling)

## Usage

### Basic Example

```jsx
import { Heading } from '@carbon/react';

function MyComponent() {
  return (
    <Heading>Default Heading</Heading>
  );
}
```

### Different Heading Levels

```jsx
{/* h1 through h6 */}
<Heading as="h1">Heading Level 1</Heading>
<Heading as="h2">Heading Level 2</Heading>
<Heading as="h3">Heading Level 3</Heading>
<Heading as="h4">Heading Level 4</Heading>
<Heading as="h5">Heading Level 5</Heading>
<Heading as="h6">Heading Level 6</Heading>
```

### Separating Semantic and Visual Hierarchy

```jsx
{/* Semantically h1, but styled as h3 */}
<Heading as="h1" className="cds--type-heading-03">
  Main Page Title
</Heading>

{/* Semantically h3, but styled as h1 */}
<Heading as="h3" className="cds--type-heading-01">
  Visually Prominent Subsection
</Heading>
```

### Page Structure Example

```jsx
function ArticlePage() {
  return (
    <article>
      <Heading as="h1">Article Title</Heading>

      <section>
        <Heading as="h2">Introduction</Heading>
        <p>Introduction content...</p>
      </section>

      <section>
        <Heading as="h2">Main Content</Heading>
        <p>Main content...</p>

        <Heading as="h3">Subsection</Heading>
        <p>Subsection content...</p>

        <Heading as="h4">Sub-subsection</Heading>
        <p>Detailed content...</p>
      </section>

      <section>
        <Heading as="h2">Conclusion</Heading>
        <p>Conclusion content...</p>
      </section>
    </article>
  );
}
```

### With Custom Styling

```jsx
<Heading
  as="h2"
  className="custom-heading"
  style={{ marginBottom: '2rem' }}
>
  Custom Styled Heading
</Heading>
```

### Section Headers

```jsx
function Dashboard() {
  return (
    <div>
      <Heading as="h1">Dashboard</Heading>

      <section>
        <Heading as="h2">Recent Activity</Heading>
        {/* Activity content */}
      </section>

      <section>
        <Heading as="h2">Statistics</Heading>
        {/* Statistics content */}
      </section>

      <section>
        <Heading as="h2">Quick Actions</Heading>
        {/* Actions content */}
      </section>
    </div>
  );
}
```

### With Carbon Type Tokens

```jsx
import { Heading } from '@carbon/react';

{/* Using Carbon type scale classes */}
<Heading as="h1" className="cds--type-productive-heading-07">
  Display Heading
</Heading>

<Heading as="h2" className="cds--type-productive-heading-05">
  Section Heading
</Heading>

<Heading as="h3" className="cds--type-productive-heading-03">
  Subsection Heading
</Heading>

{/* Expressive type scale */}
<Heading as="h1" className="cds--type-expressive-heading-06">
  Expressive Display
</Heading>
```

### In Card Components

```jsx
import { Tile, Heading } from '@carbon/react';

<Tile>
  <Heading as="h3">Card Title</Heading>
  <p>Card content goes here...</p>
</Tile>
```

### In Modal Headers

```jsx
import { Modal, Heading } from '@carbon/react';

<Modal open={isOpen} onRequestClose={handleClose}>
  <Heading as="h2">Modal Title</Heading>
  <p>Modal content...</p>
</Modal>
```

### Accessible Heading Structure

```jsx
function AccessiblePage() {
  return (
    <main>
      {/* Only one h1 per page */}
      <Heading as="h1">Page Title</Heading>

      <nav aria-label="Table of contents">
        {/* Navigation doesn't interrupt heading hierarchy */}
      </nav>

      <section>
        <Heading as="h2">First Section</Heading>

        <section>
          <Heading as="h3">Subsection A</Heading>
          <p>Content...</p>
        </section>

        <section>
          <Heading as="h3">Subsection B</Heading>
          <p>Content...</p>
        </section>
      </section>

      <section>
        <Heading as="h2">Second Section</Heading>
        <p>Content...</p>
      </section>
    </main>
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `as` | `'h1' \| 'h2' \| 'h3' \| 'h4' \| 'h5' \| 'h6'` | `'h2'` | Specify the semantic heading level to render |
| `children` | `node` | - | **Required.** The content of the heading |
| `className` | `string` | - | Custom CSS class name for styling the heading |

## Carbon Type Scale

Carbon Design System provides two type scales that can be used with headings:

### Productive Type Scale

Optimized for dense, information-rich interfaces:

| Class | Font Size | Line Height | Use Case |
|-------|-----------|-------------|----------|
| `cds--type-productive-heading-07` | 54px | 64px | Hero text, marketing |
| `cds--type-productive-heading-06` | 42px | 50px | Page titles |
| `cds--type-productive-heading-05` | 32px | 40px | Section titles |
| `cds--type-productive-heading-04` | 28px | 36px | Group titles |
| `cds--type-productive-heading-03` | 20px | 28px | Subsection titles |
| `cds--type-productive-heading-02` | 16px | 24px | Headings in tight spaces |
| `cds--type-productive-heading-01` | 14px | 20px | Small headings |

### Expressive Type Scale

Optimized for editorial and marketing content:

| Class | Font Size | Line Height | Use Case |
|-------|-----------|-------------|----------|
| `cds--type-expressive-heading-06` | 60px | 70px | Display headlines |
| `cds--type-expressive-heading-05` | 42px | 50px | Large titles |
| `cds--type-expressive-heading-04` | 32px | 40px | Section headings |
| `cds--type-expressive-heading-03` | 20px | 28px | Subsection headings |

## Accessibility

- Use semantic heading elements (h1-h6) for proper document structure
- Maintain a logical heading hierarchy (don't skip levels)
- Use only one h1 per page
- Headings should describe the content that follows
- Screen readers use headings to navigate content
- Don't choose heading levels based on visual appearance alone
- Use ARIA landmarks in conjunction with headings

## Best Practices

### Do

- Start with h1 for the page title
- Follow a logical heading hierarchy (h1 → h2 → h3, etc.)
- Use headings to structure content, not for styling
- Keep heading text concise and descriptive
- Use one h1 per page
- Make headings informative and unique
- Use CSS classes to control visual appearance independently of semantic level

### Don't

- Don't skip heading levels (e.g., h1 → h3)
- Don't use multiple h1 elements on a page
- Don't choose heading levels based solely on visual appearance
- Don't use headings for text that isn't actually a heading
- Don't use empty headings
- Don't make headings too long or vague

## Heading Hierarchy Example

### Good Hierarchy

```jsx
<Heading as="h1">Website Name</Heading>
  <Heading as="h2">Main Section</Heading>
    <Heading as="h3">Subsection</Heading>
      <Heading as="h4">Detail</Heading>
    <Heading as="h3">Another Subsection</Heading>
  <Heading as="h2">Another Main Section</Heading>
```

### Poor Hierarchy (Avoid)

```jsx
{/* ❌ Multiple h1s */}
<Heading as="h1">Page Title</Heading>
<Heading as="h1">Section Title</Heading>

{/* ❌ Skipping levels */}
<Heading as="h1">Page Title</Heading>
<Heading as="h4">Subsection</Heading>

{/* ❌ Using headings for styling */}
<Heading as="h1">Small text</Heading>
```

## Common Patterns

### Blog Post Structure

```jsx
<article>
  <Heading as="h1">Blog Post Title</Heading>
  <p className="byline">By Author Name</p>

  <Heading as="h2">Introduction</Heading>
  <p>Introduction text...</p>

  <Heading as="h2">Main Topic</Heading>
  <p>Main content...</p>

  <Heading as="h3">Subtopic</Heading>
  <p>Detailed information...</p>

  <Heading as="h2">Conclusion</Heading>
  <p>Concluding thoughts...</p>
</article>
```

### Settings Page

```jsx
<main>
  <Heading as="h1">Settings</Heading>

  <section>
    <Heading as="h2">Profile Settings</Heading>
    <Heading as="h3">Personal Information</Heading>
    {/* Form fields */}
    <Heading as="h3">Contact Details</Heading>
    {/* Form fields */}
  </section>

  <section>
    <Heading as="h2">Privacy Settings</Heading>
    <Heading as="h3">Data Sharing</Heading>
    {/* Privacy controls */}
  </section>

  <section>
    <Heading as="h2">Notification Settings</Heading>
    {/* Notification preferences */}
  </section>
</main>
```

### Dashboard Cards

```jsx
import { Tile, Heading } from '@carbon/react';

<div className="dashboard-grid">
  <Tile>
    <Heading as="h3" className="cds--type-productive-heading-03">
      Total Users
    </Heading>
    <p className="metric">1,234</p>
  </Tile>

  <Tile>
    <Heading as="h3" className="cds--type-productive-heading-03">
      Revenue
    </Heading>
    <p className="metric">$45,678</p>
  </Tile>

  <Tile>
    <Heading as="h3" className="cds--type-productive-heading-03">
      Active Sessions
    </Heading>
    <p className="metric">89</p>
  </Tile>
</div>
```

## Visual vs Semantic Hierarchy

Sometimes you need to separate the semantic structure from the visual appearance:

```jsx
{/*
  Semantically an h3 (third level in hierarchy)
  But visually styled like a larger heading
*/}
<Heading as="h3" className="cds--type-productive-heading-05">
  Important Subsection
</Heading>

{/*
  Semantically an h1 (page title)
  But visually styled more modestly
*/}
<Heading as="h1" className="cds--type-productive-heading-03">
  Understated Page Title
</Heading>
```

## Integration with Carbon Components

### With Accordion

```jsx
import { Accordion, AccordionItem, Heading } from '@carbon/react';

<div>
  <Heading as="h2">Frequently Asked Questions</Heading>
  <Accordion>
    <AccordionItem title="Question 1">
      Answer content...
    </AccordionItem>
    <AccordionItem title="Question 2">
      Answer content...
    </AccordionItem>
  </Accordion>
</div>
```

### With Tabs

```jsx
import { Tabs, TabList, Tab, TabPanels, TabPanel, Heading } from '@carbon/react';

<div>
  <Heading as="h2">Product Information</Heading>
  <Tabs>
    <TabList>
      <Tab>Overview</Tab>
      <Tab>Specifications</Tab>
      <Tab>Reviews</Tab>
    </TabList>
    <TabPanels>
      <TabPanel>
        <Heading as="h3">Overview</Heading>
        {/* Content */}
      </TabPanel>
      <TabPanel>
        <Heading as="h3">Technical Specifications</Heading>
        {/* Content */}
      </TabPanel>
      <TabPanel>
        <Heading as="h3">Customer Reviews</Heading>
        {/* Content */}
      </TabPanel>
    </TabPanels>
  </Tabs>
</div>
```

## Related Components

- **Typography tokens**: Use Carbon type tokens for consistent styling
- **Text components**: For body text and other non-heading text
- **Section**: Semantic HTML5 section element for grouping content

## SEO Considerations

- Use h1 for the main page title (important for SEO)
- Include relevant keywords in headings naturally
- Keep headings descriptive and meaningful
- Maintain proper hierarchy for search engine crawlers
- Don't over-optimize or keyword stuff headings

## Testing Heading Structure

You can test your heading structure accessibility:

1. Use browser extensions like WAVE or axe DevTools
2. Navigate using only keyboard (headings are navigation landmarks)
3. Use screen readers to verify logical flow
4. Check that outline/hierarchy makes sense without CSS
5. Ensure no heading levels are skipped

## Available Variants

- Heading levels (h1 through h6)
- Productive type scale (01-07)
- Expressive type scale (01-06)
- Custom styled headings

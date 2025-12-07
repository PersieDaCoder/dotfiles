# OrderedList & UnorderedList

> 📖 [Storybook - OrderedList](https://react.carbondesignsystem.com/?path=/docs/components-orderedlist--overview)
> 📖 [Storybook - UnorderedList](https://react.carbondesignsystem.com/?path=/docs/components-unorderedlist--overview)

## Overview

OrderedList and UnorderedList components provide styled list containers that follow the Carbon Design System specifications. OrderedList creates numbered lists, while UnorderedList creates bulleted lists. Both components use the ListItem component for individual items.

## When to use

### OrderedList
- When the sequence or priority of items matters
- For step-by-step instructions or procedures
- When items need to be referenced by number
- For ranked lists or hierarchies

### UnorderedList
- When the order of items doesn't matter
- For simple collections of related items
- When presenting features or benefits
- For general-purpose lists

## When not to use

- For complex data structures (use DataTable)
- For navigation menus (use NavigationList or UI Shell)
- When items need interactive controls (consider custom components)
- For very long lists with hundreds of items (consider virtualization)

## Usage

### UnorderedList - Basic Example

```jsx
import { UnorderedList, ListItem } from '@carbon/react';

function MyComponent() {
  return (
    <UnorderedList>
      <ListItem>List item 1</ListItem>
      <ListItem>List item 2</ListItem>
      <ListItem>List item 3</ListItem>
    </UnorderedList>
  );
}
```

### OrderedList - Basic Example

```jsx
import { OrderedList, ListItem } from '@carbon/react';

function MyComponent() {
  return (
    <OrderedList>
      <ListItem>First step</ListItem>
      <ListItem>Second step</ListItem>
      <ListItem>Third step</ListItem>
    </OrderedList>
  );
}
```

### Nested Lists

```jsx
<UnorderedList>
  <ListItem>
    Parent item 1
    <UnorderedList nested>
      <ListItem>Nested item 1.1</ListItem>
      <ListItem>Nested item 1.2</ListItem>
    </UnorderedList>
  </ListItem>
  <ListItem>
    Parent item 2
    <UnorderedList nested>
      <ListItem>Nested item 2.1</ListItem>
      <ListItem>Nested item 2.2</ListItem>
    </UnorderedList>
  </ListItem>
</UnorderedList>
```

### Nested OrderedList

```jsx
<OrderedList>
  <ListItem>
    Main step 1
    <OrderedList nested>
      <ListItem>Sub-step 1.1</ListItem>
      <ListItem>Sub-step 1.2</ListItem>
    </OrderedList>
  </ListItem>
  <ListItem>
    Main step 2
    <OrderedList nested>
      <ListItem>Sub-step 2.1</ListItem>
      <ListItem>Sub-step 2.2</ListItem>
    </OrderedList>
  </ListItem>
</OrderedList>
```

### Mixed Nested Lists

```jsx
<OrderedList>
  <ListItem>
    First numbered item
    <UnorderedList nested>
      <ListItem>Bulleted sub-item</ListItem>
      <ListItem>Another bulleted sub-item</ListItem>
    </UnorderedList>
  </ListItem>
  <ListItem>Second numbered item</ListItem>
</OrderedList>
```

### Expressive Lists

```jsx
{/* Expressive UnorderedList */}
<UnorderedList isExpressive>
  <ListItem>Expressive list item 1</ListItem>
  <ListItem>Expressive list item 2</ListItem>
  <ListItem>Expressive list item 3</ListItem>
</UnorderedList>

{/* Expressive OrderedList */}
<OrderedList isExpressive>
  <ListItem>Expressive step 1</ListItem>
  <ListItem>Expressive step 2</ListItem>
  <ListItem>Expressive step 3</ListItem>
</OrderedList>
```

### With Rich Content

```jsx
<UnorderedList>
  <ListItem>
    <strong>Bold item:</strong> This item has bold text at the start
  </ListItem>
  <ListItem>
    <a href="#link">Link item</a> with additional text
  </ListItem>
  <ListItem>
    Item with <code>inline code</code> element
  </ListItem>
</UnorderedList>
```

### Custom List Types

```jsx
{/* Lowercase alphabetical */}
<OrderedList type="a">
  <ListItem>Item a</ListItem>
  <ListItem>Item b</ListItem>
  <ListItem>Item c</ListItem>
</OrderedList>

{/* Uppercase alphabetical */}
<OrderedList type="A">
  <ListItem>Item A</ListItem>
  <ListItem>Item B</ListItem>
  <ListItem>Item C</ListItem>
</OrderedList>

{/* Roman numerals */}
<OrderedList type="i">
  <ListItem>Item i</ListItem>
  <ListItem>Item ii</ListItem>
  <ListItem>Item iii</ListItem>
</OrderedList>
```

## Props

### UnorderedList

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** ListItem components to be rendered in the list |
| `className` | `string` | - | Custom CSS class name |
| `isExpressive` | `bool` | `false` | Specify whether the list should use expressive styles (larger spacing) |
| `nested` | `bool` | `false` | Specify whether this is a nested list (affects indentation and styling) |

### OrderedList

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** ListItem components to be rendered in the list |
| `className` | `string` | - | Custom CSS class name |
| `isExpressive` | `bool` | `false` | Specify whether the list should use expressive styles (larger spacing) |
| `native` | `bool` | `false` | Use native browser list numbering instead of CSS counters |
| `nested` | `bool` | `false` | Specify whether this is a nested list (affects indentation and styling) |
| `type` | `'1' \| 'a' \| 'A' \| 'i' \| 'I'` | `'1'` | Specify the numbering type for the ordered list |

### ListItem

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** Content of the list item |
| `className` | `string` | - | Custom CSS class name |

## List Types Reference

### OrderedList Types

| Type Value | Description | Example |
|------------|-------------|---------|
| `'1'` | Decimal numbers (default) | 1, 2, 3, 4... |
| `'a'` | Lowercase letters | a, b, c, d... |
| `'A'` | Uppercase letters | A, B, C, D... |
| `'i'` | Lowercase Roman numerals | i, ii, iii, iv... |
| `'I'` | Uppercase Roman numerals | I, II, III, IV... |

## Accessibility

- Lists use semantic HTML elements (`<ul>`, `<ol>`, `<li>`)
- Screen readers properly announce list structure and item count
- Nested lists are correctly conveyed to assistive technologies
- Use meaningful content for list items
- Links and interactive elements within list items are keyboard accessible

## Best Practices

### Do

- Use OrderedList when sequence matters
- Use UnorderedList for non-sequential items
- Keep list items concise and scannable
- Use nested lists to show hierarchy
- Use `isExpressive` for lists in expressive layouts
- Ensure list items have parallel structure (grammatically consistent)

### Don't

- Don't use lists purely for layout purposes
- Don't nest lists more than 3 levels deep
- Don't mix ordered and unordered lists arbitrarily
- Don't use lists for interactive navigation (use proper nav components)
- Don't create extremely long lists without consideration for readability

## Common Use Cases

### Step-by-Step Instructions

```jsx
<OrderedList>
  <ListItem>Open the application settings</ListItem>
  <ListItem>Navigate to the security tab</ListItem>
  <ListItem>Enable two-factor authentication</ListItem>
  <ListItem>Save your changes</ListItem>
</OrderedList>
```

### Feature List

```jsx
<UnorderedList>
  <ListItem>Real-time collaboration</ListItem>
  <ListItem>Cloud-based storage</ListItem>
  <ListItem>Advanced security features</ListItem>
  <ListItem>24/7 customer support</ListItem>
</UnorderedList>
```

### Nested Task List

```jsx
<OrderedList>
  <ListItem>
    Planning Phase
    <UnorderedList nested>
      <ListItem>Define project scope</ListItem>
      <ListItem>Identify stakeholders</ListItem>
      <ListItem>Set timeline</ListItem>
    </UnorderedList>
  </ListItem>
  <ListItem>
    Execution Phase
    <UnorderedList nested>
      <ListItem>Develop features</ListItem>
      <ListItem>Conduct testing</ListItem>
      <ListItem>Deploy to production</ListItem>
    </UnorderedList>
  </ListItem>
</OrderedList>
```

### Requirements List

```jsx
<div>
  <h4>System Requirements</h4>
  <UnorderedList>
    <ListItem>Node.js version 18 or higher</ListItem>
    <ListItem>npm version 9 or higher</ListItem>
    <ListItem>Modern web browser (Chrome, Firefox, Safari, Edge)</ListItem>
    <ListItem>Minimum 4GB RAM</ListItem>
  </UnorderedList>
</div>
```

## Styling Considerations

- Lists inherit text styles from their container
- Expressive lists have increased spacing for better readability
- Nested lists are automatically indented
- Custom CSS can be applied via className prop
- List markers align with Carbon Design System specifications

## Related Components

- **StructuredList**: Use for more complex, multi-column list layouts
- **ContainedList**: Use for lists with more visual structure and containment
- **DataTable**: Use for tabular data with many columns
- **Accordion**: Use for collapsible list-like content

## Available Variants

### UnorderedList
- Default
- Nested
- Expressive

### OrderedList
- Default (decimal)
- Nested
- Expressive
- Alphabetical (a, A)
- Roman numerals (i, I)
- Native numbering

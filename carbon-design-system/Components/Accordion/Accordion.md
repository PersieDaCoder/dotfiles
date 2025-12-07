# Accordion

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-accordion--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/accordion/usage) | [Accessibility](https://www.carbondesignsystem.com/components/accordion/accessibility)

## Overview

The Accordion component combines `Accordion` and `AccordionItem` components to create expandable content sections. Each item displays a heading (via `title` prop) and panel content (passed as children).

## When to Use

- To organize large amounts of content into collapsible sections
- When users need to see an overview before diving into details
- For FAQs or documentation with multiple topics
- To reduce scrolling and visual complexity

## When Not to Use

- For navigation between views (use Tabs)
- When all content should be visible (use regular sections)
- For single expandable areas (consider using a disclosure)
- For sequential steps (use ProgressIndicator)

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard accordion with expand/collapse |
| **Controlled** | Programmatically control open states |
| **With Layer** | For use on different background layers |
| **Skeleton** | Loading state placeholder |

---

## Props

### Accordion

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `align` | `'start' \| 'end'` | `'end'` | Icon alignment (start or end) |
| `className` | `string` | - | Additional CSS classes |
| `disabled` | `boolean` | `false` | Disable all accordion items |
| `isFlush` | `boolean` | `false` | Remove left padding |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Accordion size |

### AccordionItem

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | `node` | required | Heading text or element |
| `open` | `boolean` | `false` | Whether item is expanded |
| `disabled` | `boolean` | `false` | Disable this item |
| `onHeadingClick` | `function` | - | Called with `{ isOpen }` on click |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Usage

```jsx
import { Accordion, AccordionItem } from '@carbon/react';

<Accordion>
  <AccordionItem title="Section 1">
    <p>Content for section 1</p>
  </AccordionItem>
  <AccordionItem title="Section 2">
    <p>Content for section 2</p>
  </AccordionItem>
  <AccordionItem title="Section 3">
    <p>Content for section 3</p>
  </AccordionItem>
</Accordion>
```

### Controlled Accordion

```jsx
import { Accordion, AccordionItem } from '@carbon/react';
import { useState } from 'react';

function ControlledAccordion() {
  const [openItems, setOpenItems] = useState({ 0: true });

  const handleClick = (index) => {
    setOpenItems(prev => ({
      ...prev,
      [index]: !prev[index]
    }));
  };

  return (
    <Accordion>
      {['First', 'Second', 'Third'].map((item, index) => (
        <AccordionItem
          key={index}
          title={`${item} section`}
          open={openItems[index] || false}
          onHeadingClick={() => handleClick(index)}
        >
          <p>Content for {item.toLowerCase()} section</p>
        </AccordionItem>
      ))}
    </Accordion>
  );
}
```

### With Icon Alignment

```jsx
<Accordion align="start">
  <AccordionItem title="Start-aligned icon">
    <p>Icon appears on the left</p>
  </AccordionItem>
</Accordion>
```

### Different Sizes

```jsx
<Accordion size="sm">
  <AccordionItem title="Small accordion">Content</AccordionItem>
</Accordion>

<Accordion size="lg">
  <AccordionItem title="Large accordion">Content</AccordionItem>
</Accordion>
```

### Skeleton State

```jsx
import { AccordionSkeleton } from '@carbon/react';

<AccordionSkeleton count={3} open={false} />
```

---

## Accessibility

- Accordion items are keyboard navigable
- Enter/Space toggles the focused item
- Arrow keys navigate between headers
- Screen readers announce expand/collapse state
- Don't nest interactive elements in titles (accessibility violation)

---

## Related Components

- [Tabs](Tabs.md) - For switching between views
- [StructuredList](StructuredList.md) - For static expandable lists

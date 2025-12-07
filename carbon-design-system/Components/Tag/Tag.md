# Tag

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-tag--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tag/usage) | [Accessibility](https://www.carbondesignsystem.com/components/tag/accessibility)

## Overview

Tags categorize items using short labels for easy scanning. They support multiple variants for different interaction patterns: read-only, dismissible, selectable, and operational.

## When to Use

- To categorize or label items
- For filtering with visual feedback
- To show status or attributes
- For displaying metadata or keywords

## When Not to Use

- For navigation (use Links or Buttons)
- For actions (use Buttons)
- For long text content
- When more than 2 words are needed

---

## Variants

| Variant | Description |
|---------|-------------|
| **Read Only** | Static labels for categorization |
| **Dismissible** | Users can remove/clear tags |
| **Selectable** | Toggle selection state |
| **Operational** | View associated items (popover/breadcrumb) |
| **Filter** | Combine with filtering functionality |
| **AI Label** | Read-only tags with AI explainability |

---

## Types (Colors)

`red`, `magenta`, `purple`, `blue`, `cyan`, `teal`, `green`, `gray`, `cool-gray`, `warm-gray`, `high-contrast`, `outline`

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | `string` | `'gray'` | Color type |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Tag size |
| `disabled` | `boolean` | `false` | Disabled state |
| `filter` | `boolean` | `false` | Show as filter tag |
| `onClose` | `function` | - | Called when dismissible tag closed |
| `renderIcon` | `ComponentType` | - | Optional decorative icon |
| `title` | `string` | - | Custom tooltip text |
| `className` | `string` | - | Additional CSS classes |

### DismissibleTag Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `text` | `string` | required | Tag text content |
| `onClose` | `function` | required | Called when tag dismissed |

### SelectableTag Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `text` | `string` | required | Tag text content |
| `selected` | `boolean` | `false` | Selection state |
| `onChange` | `function` | - | Called on selection change |

### OperationalTag Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `text` | `string` | required | Tag text content |
| `onClick` | `function` | - | Called when tag clicked |

---

## Code Examples

### Basic Read-Only Tags

```jsx
import { Tag } from '@carbon/react';

<Tag type="blue">Category</Tag>
<Tag type="green">Active</Tag>
<Tag type="red">Urgent</Tag>
<Tag type="purple">Featured</Tag>
```

### With Icon

```jsx
import { Tag } from '@carbon/react';
import { User } from '@carbon/icons-react';

<Tag type="blue" renderIcon={User}>
  Team member
</Tag>
```

### Dismissible Tags

```jsx
import { DismissibleTag } from '@carbon/react';

function DismissibleExample() {
  const [tags, setTags] = useState(['React', 'TypeScript', 'Node.js']);

  return (
    <div>
      {tags.map((tag) => (
        <DismissibleTag
          key={tag}
          type="blue"
          text={tag}
          onClose={() => setTags(tags.filter(t => t !== tag))}
        />
      ))}
    </div>
  );
}
```

### Selectable Tags

```jsx
import { SelectableTag } from '@carbon/react';

function SelectableExample() {
  const [selected, setSelected] = useState({});

  const categories = ['Design', 'Development', 'Marketing'];

  return (
    <div>
      {categories.map((cat) => (
        <SelectableTag
          key={cat}
          text={cat}
          selected={selected[cat] || false}
          onChange={() => setSelected(prev => ({
            ...prev,
            [cat]: !prev[cat]
          }))}
        />
      ))}
    </div>
  );
}
```

### Operational Tags

```jsx
import { OperationalTag } from '@carbon/react';

<OperationalTag
  text="View details"
  onClick={() => openPopover()}
/>
```

### Filter Tags

```jsx
<Tag type="cyan" filter onClose={() => removeFilter('status')}>
  Status: Active
</Tag>
```

### Different Sizes

```jsx
<Tag type="blue" size="sm">Small</Tag>
<Tag type="blue" size="md">Medium</Tag>
<Tag type="blue" size="lg">Large</Tag>
```

---

## Accessibility

- Use two words maximum for tag labels
- Ensure sufficient color contrast
- Dismissible tags announce removal to screen readers
- Keyboard: Enter/Space to interact
- Avoid using color alone to convey meaning

---

## Related Components

- [Badge](https://www.carbondesignsystem.com/patterns/status-indicator-pattern) - For numeric indicators
- [Button](Button.md) - For actions

# Tile

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-tile--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tile/usage) | [Accessibility](https://www.carbondesignsystem.com/components/tile/accessibility)

## Overview

Tile is a flexible container component that groups related content. It provides multiple variants including clickable, selectable, and expandable tiles, making it suitable for dashboards, cards, feature displays, and interactive content blocks.

## When to Use

- To group related information in a contained space
- For dashboard widgets and summary cards
- When content needs to be selectable or clickable
- To create card-based layouts
- For feature highlights or product cards
- When you need expandable content sections

## When Not to Use

- For simple content grouping without interaction (use a div instead)
- When a list format would be more appropriate
- For navigation items (use proper navigation components)
- When content doesn't need visual separation

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Basic container tile |
| **Clickable** | Navigates on click, renders as anchor |
| **Selectable** | Radio button or checkbox style selection |
| **Expandable** | Reveals additional content below fold |
| **Multi-Select** | Multiple selectable tiles in a group |

---

## Props

### Tile Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | Content to display in the tile |
| `className` | `string` | - | Additional CSS classes |

### ClickableTile Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | Tile content |
| `href` | `string` | - | URL to navigate to |
| `rel` | `string` | - | Link relationship attribute |
| `disabled` | `boolean` | `false` | Disable interaction |
| `className` | `string` | - | Additional CSS classes |

### SelectableTile Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier |
| `name` | `string` | - | Radio group name |
| `value` | `any` | - | Tile value |
| `selected` | `boolean` | `false` | Whether tile is selected (controlled) |
| `onChange` | `function` | - | Callback when selection changes |
| `disabled` | `boolean` | `false` | Disable selection |
| `title` | `string` | - | Accessible title |
| `children` | `node` | - | Tile content |
| `className` | `string` | - | Additional CSS classes |

### ExpandableTile Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `expanded` | `boolean` | `false` | Expansion state (controlled) |
| `onBeforeClick` | `function` | - | Called before click handler |
| `onClick` | `function` | - | Click handler |
| `tabIndex` | `number` | `0` | Tab order |
| `tileCollapsedIconText` | `string` | `'Interact to expand'` | Collapsed state label |
| `tileExpandedIconText` | `string` | `'Interact to collapse'` | Expanded state label |
| `children` | `node` | - | Tile content (TileAboveTheFoldContent and TileBelowTheFoldContent) |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Default Tile

```jsx
import { Tile } from '@carbon/react';

<Tile>
  <h4>Basic Tile</h4>
  <p>This is a simple container for content.</p>
</Tile>
```

### Clickable Tile

```jsx
import { ClickableTile } from '@carbon/react';

<ClickableTile href="/details">
  <h4>Product Name</h4>
  <p>Click to view details</p>
</ClickableTile>
```

### Selectable Tile (Radio)

```jsx
import { SelectableTile, TileGroup } from '@carbon/react';
import { useState } from 'react';

function PlanSelector() {
  const [selected, setSelected] = useState('basic');

  return (
    <TileGroup
      legend="Select a plan"
      name="plans"
      valueSelected={selected}
      onChange={setSelected}
    >
      <SelectableTile id="basic" value="basic">
        <h4>Basic</h4>
        <p>$10/month</p>
      </SelectableTile>
      <SelectableTile id="pro" value="pro">
        <h4>Pro</h4>
        <p>$25/month</p>
      </SelectableTile>
      <SelectableTile id="enterprise" value="enterprise">
        <h4>Enterprise</h4>
        <p>Contact us</p>
      </SelectableTile>
    </TileGroup>
  );
}
```

### Expandable Tile

```jsx
import { ExpandableTile, TileAboveTheFoldContent, TileBelowTheFoldContent } from '@carbon/react';

<ExpandableTile>
  <TileAboveTheFoldContent>
    <h4>System Status</h4>
    <p>All systems operational</p>
  </TileAboveTheFoldContent>
  <TileBelowTheFoldContent>
    <p>Last checked: 2 minutes ago</p>
    <ul>
      <li>API Server: Online</li>
      <li>Database: Online</li>
      <li>Cache: Online</li>
    </ul>
  </TileBelowTheFoldContent>
</ExpandableTile>
```

### Multi-Select Tiles

```jsx
import { SelectableTile } from '@carbon/react';
import { useState } from 'react';

function FeatureSelector() {
  const [features, setFeatures] = useState({
    notifications: false,
    analytics: false,
    api: false
  });

  const toggleFeature = (feature) => {
    setFeatures(prev => ({
      ...prev,
      [feature]: !prev[feature]
    }));
  };

  return (
    <div>
      <h3>Select features</h3>
      <SelectableTile
        id="notifications"
        selected={features.notifications}
        onChange={() => toggleFeature('notifications')}
      >
        <h4>Notifications</h4>
        <p>Push and email notifications</p>
      </SelectableTile>
      <SelectableTile
        id="analytics"
        selected={features.analytics}
        onChange={() => toggleFeature('analytics')}
      >
        <h4>Analytics</h4>
        <p>Advanced reporting tools</p>
      </SelectableTile>
      <SelectableTile
        id="api"
        selected={features.api}
        onChange={() => toggleFeature('api')}
      >
        <h4>API Access</h4>
        <p>Full REST API access</p>
      </SelectableTile>
    </div>
  );
}
```

### Dashboard Widget

```jsx
import { Tile } from '@carbon/react';

function DashboardWidget({ title, value, change, icon: Icon }) {
  return (
    <Tile className="dashboard-widget">
      <div className="widget-header">
        <h4>{title}</h4>
        {Icon && <Icon />}
      </div>
      <div className="widget-value">{value}</div>
      <div className="widget-change" style={{ color: change > 0 ? 'green' : 'red' }}>
        {change > 0 ? '+' : ''}{change}%
      </div>
    </Tile>
  );
}
```

### Product Card Grid

```jsx
import { ClickableTile, Grid, Column } from '@carbon/react';

function ProductGrid({ products }) {
  return (
    <Grid>
      {products.map(product => (
        <Column key={product.id} lg={4} md={4} sm={4}>
          <ClickableTile href={`/products/${product.id}`}>
            <img src={product.image} alt={product.name} />
            <h4>{product.name}</h4>
            <p>{product.description}</p>
            <span className="price">${product.price}</span>
          </ClickableTile>
        </Column>
      ))}
    </Grid>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus to interactive tiles
- **Enter/Space**: Activate clickable or selectable tiles
- **Arrow Keys**: Navigate between selectable tiles in a group

### Screen Reader Support

- Clickable tiles are announced as links or buttons
- Selectable tiles include proper radio/checkbox semantics
- Expandable tiles announce expansion state
- Disabled states are properly communicated

### Best Practices

- Use semantic headings within tiles for structure
- Ensure sufficient color contrast for all content
- Provide clear visual focus indicators
- Don't nest interactive elements within clickable tiles
- Use descriptive labels for icon-only content
- Ensure touch targets are at least 44x44 pixels

---

## Patterns

### Feature Comparison

```jsx
import { SelectableTile, TileGroup } from '@carbon/react';

function FeatureComparison() {
  const [plan, setPlan] = useState('pro');

  return (
    <TileGroup legend="Compare Plans" onChange={setPlan} valueSelected={plan}>
      <SelectableTile id="basic" value="basic">
        <h3>Basic</h3>
        <div className="price">$10/mo</div>
        <ul>
          <li>5 Projects</li>
          <li>10 GB Storage</li>
          <li>Email Support</li>
        </ul>
      </SelectableTile>
      <SelectableTile id="pro" value="pro">
        <h3>Pro</h3>
        <div className="price">$25/mo</div>
        <ul>
          <li>Unlimited Projects</li>
          <li>100 GB Storage</li>
          <li>Priority Support</li>
          <li>Advanced Analytics</li>
        </ul>
      </SelectableTile>
    </TileGroup>
  );
}
```

### Resource Library

```jsx
import { ExpandableTile, TileAboveTheFoldContent, TileBelowTheFoldContent } from '@carbon/react';

function ResourceLibrary({ resources }) {
  return (
    <div className="resource-library">
      {resources.map(resource => (
        <ExpandableTile key={resource.id}>
          <TileAboveTheFoldContent>
            <h4>{resource.title}</h4>
            <p className="meta">{resource.type} • {resource.duration}</p>
          </TileAboveTheFoldContent>
          <TileBelowTheFoldContent>
            <p>{resource.description}</p>
            <a href={resource.link}>View Resource →</a>
          </TileBelowTheFoldContent>
        </ExpandableTile>
      ))}
    </div>
  );
}
```

### Settings Panel

```jsx
import { SelectableTile } from '@carbon/react';

function PrivacySettings() {
  const [privacy, setPrivacy] = useState('friends');

  return (
    <div>
      <h3>Who can see your profile?</h3>
      <SelectableTile
        id="public"
        value="public"
        selected={privacy === 'public'}
        onChange={() => setPrivacy('public')}
      >
        <strong>Public</strong>
        <p>Anyone can view your profile</p>
      </SelectableTile>
      <SelectableTile
        id="friends"
        value="friends"
        selected={privacy === 'friends'}
        onChange={() => setPrivacy('friends')}
      >
        <strong>Friends Only</strong>
        <p>Only people you follow can see your profile</p>
      </SelectableTile>
      <SelectableTile
        id="private"
        value="private"
        selected={privacy === 'private'}
        onChange={() => setPrivacy('private')}
      >
        <strong>Private</strong>
        <p>Nobody can view your profile</p>
      </SelectableTile>
    </div>
  );
}
```

---

## Related Components

- [Accordion](../Accordion/Accordion.md) - For stacked expandable sections
- [Modal](../Modals/Modal.md) - For focused content overlay
- [Card patterns with Grid](../GridLayout/GridAndLayout.md) - Layout system for tiles
- [RadioButton](../FormInputs/RadioButton.md) - Traditional radio inputs

---

## References

- [Carbon Design System - Tile](https://www.carbondesignsystem.com/components/tile/usage)
- [WCAG 2.1 - Interactive Controls](https://www.w3.org/WAI/WCAG21/Understanding/keyboard)
- [Card Design Best Practices](https://www.nngroup.com/articles/cards-component/)

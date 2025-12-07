# Grid and Layout

> 📖 [Storybook - Grid](https://react.carbondesignsystem.com/?path=/docs/elements-grid--overview) | [Storybook - FlexGrid](https://react.carbondesignsystem.com/?path=/docs/elements-flexgrid--overview) | [Storybook - Stack](https://react.carbondesignsystem.com/?path=/docs/layout-stack--overview)

## Overview

Grid and Layout components provide flexible systems for arranging content in Carbon applications. Grid uses CSS Grid, FlexGrid uses Flexbox, Stack manages spacing in flex layouts, and Layer manages elevation and theming depth.

## When to Use

- For creating responsive page layouts
- When arranging content in rows and columns
- To maintain consistent spacing and alignment
- For managing visual hierarchy with layers
- When building dashboard and card layouts
- To create consistent margin and padding patterns

## When Not to Use

- For simple inline elements (use standard CSS)
- When custom layout is more appropriate
- For single-direction flows that don't need grid structure

---

## Variants

| Variant | Description |
|---------|-------------|
| **Grid** | 16-column CSS Grid system |
| **FlexGrid** | Flexbox-based grid system |
| **Stack** | Flex layout with spacing |
| **Layer** | Elevation and theming system |

---

## Code Examples

### Basic Grid

```jsx
import { Grid, Column } from '@carbon/react';

<Grid>
  <Column lg={4} md={4} sm={4}>
    <div>Column 1</div>
  </Column>
  <Column lg={8} md={4} sm={4}>
    <div>Column 2</div>
  </Column>
  <Column lg={4} md={4} sm={4}>
    <div>Column 3</div>
  </Column>
</Grid>
```

### Responsive Columns

```jsx
import { Grid, Column } from '@carbon/react';

<Grid>
  <Column xlg={3} lg={4} md={4} sm={4}>
    <div>Sidebar</div>
  </Column>
  <Column xlg={13} lg={12} md={4} sm={4}>
    <div>Main content</div>
  </Column>
</Grid>
```

### Narrow Grid

```jsx
import { Grid, Column } from '@carbon/react';

<Grid narrow>
  <Column lg={8}>
    <div>Narrow gutters</div>
  </Column>
  <Column lg={8}>
    <div>Between columns</div>
  </Column>
</Grid>
```

### Condensed Grid

```jsx
import { Grid, Column } from '@carbon/react';

<Grid condensed>
  <Column lg={4}>Content</Column>
  <Column lg={4}>Content</Column>
  <Column lg={4}>Content</Column>
  <Column lg={4}>Content</Column>
</Grid>
```

### Stack Layout

```jsx
import { Stack } from '@carbon/react';

<Stack gap={5} orientation="vertical">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</Stack>

<Stack gap={3} orientation="horizontal">
  <button>Button 1</button>
  <button>Button 2</button>
</Stack>
```

### Layer System

```jsx
import { Layer, TextInput } from '@carbon/react';

<Layer level={0}>
  <TextInput labelText="Base layer" id="input-1" />
  
  <Layer>
    <TextInput labelText="Layer 1" id="input-2" />
    
    <Layer>
      <TextInput labelText="Layer 2" id="input-3" />
    </Layer>
  </Layer>
</Layer>
```

### Dashboard Layout

```jsx
import { Grid, Column, Tile } from '@carbon/react';

function Dashboard() {
  return (
    <Grid>
      <Column lg={4} md={4} sm={4}>
        <Tile>Widget 1</Tile>
      </Column>
      <Column lg={4} md={4} sm={4}>
        <Tile>Widget 2</Tile>
      </Column>
      <Column lg={4} md={4} sm={4}>
        <Tile>Widget 3</Tile>
      </Column>
      <Column lg={4} md={4} sm={4}>
        <Tile>Widget 4</Tile>
      </Column>
      <Column lg={8} md={4} sm={4}>
        <Tile>Large Widget</Tile>
      </Column>
      <Column lg={4} md={4} sm={4}>
        <Tile>Widget 5</Tile>
      </Column>
    </Grid>
  );
}
```

### Form Layout

```jsx
import { Grid, Column, Stack, TextInput, Button } from '@carbon/react';

function FormLayout() {
  return (
    <Grid>
      <Column lg={8} md={4} sm={4}>
        <Stack gap={5}>
          <TextInput labelText="First name" id="first-name" />
          <TextInput labelText="Last name" id="last-name" />
          <TextInput labelText="Email" id="email" type="email" />
          <Button>Submit</Button>
        </Stack>
      </Column>
    </Grid>
  );
}
```

---

## Accessibility

### Best Practices

- Use semantic HTML elements within grid layouts
- Ensure responsive breakpoints maintain logical reading order
- Test layouts with screen magnification
- Verify keyboard navigation flows naturally
- Maintain sufficient touch targets on mobile (44x44px minimum)
- Test with different viewport sizes

---

## Patterns

### Product Catalog

```jsx
import { Grid, Column, ClickableTile } from '@carbon/react';

function ProductGrid({ products }) {
  return (
    <Grid>
      {products.map(product => (
        <Column key={product.id} xlg={4} lg={4} md={4} sm={4}>
          <ClickableTile href={`/products/${product.id}`}>
            <h3>{product.name}</h3>
            <p>${product.price}</p>
          </ClickableTile>
        </Column>
      ))}
    </Grid>
  );
}
```

### Article Layout

```jsx
import { Grid, Column } from '@carbon/react';

function ArticleLayout() {
  return (
    <Grid>
      <Column lg={2} md={0} sm={0} />
      <Column lg={12} md={8} sm={4}>
        <article>
          <h1>Article Title</h1>
          <p>Article content...</p>
        </article>
      </Column>
      <Column lg={2} md={0} sm={0} />
    </Grid>
  );
}
```

### Settings Page

```jsx
import { Grid, Column, Stack, Toggle, TextInput } from '@carbon/react';

function SettingsPage() {
  return (
    <Grid>
      <Column lg={4} md={2} sm={4}>
        <h3>Settings</h3>
      </Column>
      <Column lg={8} md={6} sm={4}>
        <Stack gap={6}>
          <Toggle labelText="Email notifications" id="email-toggle" />
          <Toggle labelText="Push notifications" id="push-toggle" />
          <TextInput labelText="Display name" id="display-name" />
        </Stack>
      </Column>
    </Grid>
  );
}
```

---

## Related Components

- [Tile](../Tile/Tile.md) - Often used within grid layouts
- [Stack](https://react.carbondesignsystem.com/?path=/docs/layout-stack--overview) - For spacing in flex layouts
- [Content](https://www.carbondesignsystem.com/elements/2x-grid/usage) - Main content container

---

## References

- [Carbon Design System - 2x Grid](https://www.carbondesignsystem.com/elements/2x-grid/usage)
- [CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
- [Flexbox Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout)

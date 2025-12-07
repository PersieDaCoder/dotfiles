# SkeletonPlaceholder

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-skeleton-skeletonplaceholder--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/skeleton-states/usage) | [Accessibility](https://www.carbondesignsystem.com/components/skeleton-states/accessibility)

## Overview

SkeletonPlaceholder provides a customizable loading state placeholder for non-text content. It displays an animated rectangular block that can be styled to match the dimensions of images, cards, or custom content areas.

## When to Use

- When loading images, icons, or media content
- For placeholder states of custom-sized components
- In card layouts where content dimensions are known
- To create skeleton states for charts, graphs, or visualizations
- When building custom loading states with specific dimensions
- For avatar or profile picture loading states

## When Not to Use

- For text content (use SkeletonText instead)
- When content loads very quickly (less than 300ms)
- For standard form inputs (they have their own skeleton states)
- When the exact dimensions are unknown or highly variable

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Basic rectangular placeholder |
| **Custom Dimensions** | Using inline styles or className for specific sizes |
| **Circular** | Rounded placeholder for avatars (using CSS) |
| **Custom Shapes** | Any shape using CSS border-radius |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Additional CSS classes for styling |
| `style` | `object` | - | Inline styles for custom dimensions |

---

## Code Examples

### Basic Usage

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

<SkeletonPlaceholder />
```

### Custom Dimensions

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

<SkeletonPlaceholder
  style={{ width: '300px', height: '200px' }}
/>
```

### Circular Avatar

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

<SkeletonPlaceholder
  style={{
    width: '64px',
    height: '64px',
    borderRadius: '50%'
  }}
/>
```

### Image Card Placeholder

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function ImageCardSkeleton() {
  return (
    <div className="image-card">
      <SkeletonPlaceholder
        style={{ width: '100%', height: '250px' }}
      />
      <div className="card-body">
        <SkeletonText heading lineCount={1} />
        <SkeletonText paragraph lineCount={2} />
      </div>
    </div>
  );
}
```

### Multiple Placeholders

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

function GallerySkeleton() {
  return (
    <div className="gallery-grid">
      {Array.from({ length: 6 }).map((_, index) => (
        <SkeletonPlaceholder
          key={index}
          style={{ width: '100%', height: '200px' }}
        />
      ))}
    </div>
  );
}
```

### Video Player Placeholder

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

function VideoPlayerSkeleton() {
  return (
    <div className="video-container">
      <SkeletonPlaceholder
        style={{
          width: '100%',
          aspectRatio: '16/9',
          borderRadius: '8px'
        }}
      />
    </div>
  );
}
```

### Chart Placeholder

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function ChartSkeleton() {
  return (
    <div className="chart-widget">
      <SkeletonText heading lineCount={1} width="200px" />
      <SkeletonPlaceholder
        style={{
          width: '100%',
          height: '400px',
          marginTop: '1rem'
        }}
      />
    </div>
  );
}
```

### Product Grid Loading

```jsx
import { SkeletonPlaceholder, SkeletonText, Grid, Column } from '@carbon/react';

function ProductGridSkeleton({ count = 8 }) {
  return (
    <Grid>
      {Array.from({ length: count }).map((_, index) => (
        <Column key={index} lg={4} md={4} sm={4}>
          <div className="product-card">
            <SkeletonPlaceholder
              style={{ width: '100%', height: '300px' }}
            />
            <SkeletonText heading lineCount={1} />
            <SkeletonText lineCount={1} width="100px" />
          </div>
        </Column>
      ))}
    </Grid>
  );
}
```

### Banner Placeholder

```jsx
import { SkeletonPlaceholder } from '@carbon/react';

function BannerSkeleton() {
  return (
    <SkeletonPlaceholder
      style={{
        width: '100%',
        height: '200px',
        borderRadius: '4px'
      }}
    />
  );
}
```

---

## Accessibility

### Screen Reader Support

- SkeletonPlaceholder includes appropriate ARIA attributes for loading states
- The component is marked with `aria-busy="true"` during loading
- Decorative loading states are hidden from screen readers when appropriate

### Best Practices

- Ensure the placeholder dimensions closely match the actual content
- Replace skeleton states with actual content as soon as it's available
- Provide text alternatives for important visual content when it loads
- Maintain consistent aspect ratios between skeleton and actual content
- Consider providing a "Skip to loaded content" option for long loading times

### Keyboard Support

- No direct keyboard interaction required
- Ensure loaded content is keyboard accessible
- Focus management should be handled when content appears

---

## Patterns

### User Profile Header

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function ProfileHeaderSkeleton() {
  return (
    <div className="profile-header">
      <SkeletonPlaceholder
        style={{
          width: '120px',
          height: '120px',
          borderRadius: '50%'
        }}
      />
      <div className="profile-details">
        <SkeletonText heading lineCount={1} width="250px" />
        <SkeletonText lineCount={1} width="180px" />
        <SkeletonText paragraph lineCount={2} />
      </div>
    </div>
  );
}
```

### Media List Item

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function MediaListItemSkeleton() {
  return (
    <div className="media-list-item">
      <SkeletonPlaceholder
        style={{
          width: '120px',
          height: '80px',
          borderRadius: '4px'
        }}
      />
      <div className="media-content">
        <SkeletonText heading lineCount={1} />
        <SkeletonText lineCount={2} />
        <SkeletonText width="100px" lineCount={1} />
      </div>
    </div>
  );
}
```

### Dashboard Widget

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function DashboardWidgetSkeleton() {
  return (
    <div className="dashboard-widget">
      <div className="widget-header">
        <SkeletonText heading lineCount={1} width="180px" />
        <SkeletonPlaceholder
          style={{ width: '24px', height: '24px', borderRadius: '4px' }}
        />
      </div>
      <SkeletonPlaceholder
        style={{ width: '100%', height: '300px', marginTop: '1rem' }}
      />
      <div className="widget-footer">
        <SkeletonText lineCount={1} width="150px" />
      </div>
    </div>
  );
}
```

### File Upload Preview

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function FilePreviewSkeleton() {
  return (
    <div className="file-preview">
      <SkeletonPlaceholder
        style={{
          width: '100%',
          height: '400px',
          borderRadius: '8px'
        }}
      />
      <div className="file-meta">
        <SkeletonText lineCount={1} width="200px" />
        <SkeletonText lineCount={1} width="120px" />
      </div>
    </div>
  );
}
```

### Social Media Post

```jsx
import { SkeletonPlaceholder, SkeletonText } from '@carbon/react';

function SocialPostSkeleton() {
  return (
    <div className="social-post">
      <div className="post-header">
        <SkeletonPlaceholder
          style={{ width: '40px', height: '40px', borderRadius: '50%' }}
        />
        <div className="post-author">
          <SkeletonText width="150px" lineCount={1} />
          <SkeletonText width="100px" lineCount={1} />
        </div>
      </div>
      <div className="post-content">
        <SkeletonText paragraph lineCount={3} />
        <SkeletonPlaceholder
          style={{
            width: '100%',
            height: '350px',
            marginTop: '1rem',
            borderRadius: '8px'
          }}
        />
      </div>
      <div className="post-actions">
        <SkeletonText width="200px" lineCount={1} />
      </div>
    </div>
  );
}
```

---

## Related Components

- [SkeletonText](SkeletonText.md) - For text content loading states
- [Loading](Loading.md) - For full-page loading indicators
- [InlineLoading](InlineLoading.md) - For inline action loading states
- [ProgressBar](../ProgressIndicator/ProgressBar.md) - For determinate progress
- [Tile](../Tile/Tile.md) - Often uses skeleton states for loading content

---

## References

- [Carbon Design System - Skeleton States](https://www.carbondesignsystem.com/components/skeleton-states/usage)
- [Skeleton Screens Best Practices](https://www.lukew.com/ff/entry.asp?1797)
- [ARIA Live Regions](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/ARIA_Live_Regions)
- [CSS aspect-ratio Property](https://developer.mozilla.org/en-US/docs/Web/CSS/aspect-ratio)

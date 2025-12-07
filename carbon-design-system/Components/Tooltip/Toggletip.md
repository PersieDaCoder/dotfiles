# Toggletip

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-toggletip--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tooltip/usage)

## Overview

Toggletip displays additional information or interactive content that requires user interaction to open and close. Unlike tooltips that appear on hover, toggletips are explicitly triggered by clicking an icon and can contain links, buttons, or formatted content.

## When to Use

- For interactive help content with links or actions
- When displaying formatted text or structured information
- For important information that users should actively engage with
- When content includes actionable items or forms
- For help text that needs to remain visible while users act on it
- When tooltip content is too complex for hover interaction

## When Not to Use

- For simple text definitions (use DefinitionTooltip instead)
- For non-critical supplementary information (use Tooltip)
- When the information should be permanently visible
- For large amounts of content (use Modal or dedicated page)
- When hover interaction is more appropriate

---

## Props

### Toggletip Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `align` | `'top' \| 'bottom' \| 'left' \| 'right'` | `'bottom'` | Placement relative to trigger |
| `className` | `string` | - | Additional CSS classes |
| `children` | `node` | required | ToggletipButton and ToggletipContent |
| `defaultOpen` | `boolean` | `false` | Initial open state (uncontrolled) |
| `onToggle` | `function` | - | Callback when toggletip opens/closes |

### ToggletipButton Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `label` | `string` | required | Accessible label for the button |
| `className` | `string` | - | Additional CSS classes |

### ToggletipContent Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | required | Content to display |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Usage

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

<Toggletip>
  <ToggletipButton label="Show information" />
  <ToggletipContent>
    <p>This is additional information about the feature.</p>
  </ToggletipContent>
</Toggletip>
```

### With Links

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

<Toggletip>
  <ToggletipButton label="Learn more" />
  <ToggletipContent>
    <h6>Need help?</h6>
    <p>
      <a href="/docs">View documentation</a> or{' '}
      <a href="/support">contact support</a>
    </p>
  </ToggletipContent>
</Toggletip>
```

### Different Alignments

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

<Toggletip align="top">
  <ToggletipButton label="Show info" />
  <ToggletipContent>
    <p>Appears above the button</p>
  </ToggletipContent>
</Toggletip>

<Toggletip align="right">
  <ToggletipButton label="Show info" />
  <ToggletipContent>
    <p>Appears to the right</p>
  </ToggletipContent>
</Toggletip>
```

### Form Field Help

```jsx
import { Toggletip, ToggletipButton, ToggletipContent, TextInput } from '@carbon/react';

<TextInput
  id="password"
  type="password"
  labelText={
    <span>
      Password{' '}
      <Toggletip>
        <ToggletipButton label="Password requirements" />
        <ToggletipContent>
          <p><strong>Password must contain:</strong></p>
          <ul>
            <li>At least 8 characters</li>
            <li>One uppercase letter</li>
            <li>One number</li>
            <li>One special character</li>
          </ul>
        </ToggletipContent>
      </Toggletip>
    </span>
  }
/>
```

### With Action Buttons

```jsx
import { Toggletip, ToggletipButton, ToggletipContent, Button } from '@carbon/react';

<Toggletip>
  <ToggletipButton label="Quick actions" />
  <ToggletipContent>
    <p>Manage this item:</p>
    <div style={{ display: 'flex', gap: '8px', marginTop: '8px' }}>
      <Button size="sm" kind="primary">Edit</Button>
      <Button size="sm" kind="secondary">Share</Button>
      <Button size="sm" kind="danger--ghost">Delete</Button>
    </div>
  </ToggletipContent>
</Toggletip>
```

### Feature Explanation

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

<div className="feature-card">
  <h4>
    Auto-save{' '}
    <Toggletip>
      <ToggletipButton label="Learn about auto-save" />
      <ToggletipContent>
        <p><strong>Auto-save</strong></p>
        <p>Your work is automatically saved every 30 seconds. You can also manually save using Cmd+S.</p>
        <a href="/docs/auto-save">Learn more →</a>
      </ToggletipContent>
    </Toggletip>
  </h4>
</div>
```

### Data Explanation

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

function MetricCard({ title, value, explanation }) {
  return (
    <div className="metric">
      <div className="metric-header">
        <span>{title}</span>
        <Toggletip>
          <ToggletipButton label={`About ${title}`} />
          <ToggletipContent>
            <p>{explanation}</p>
          </ToggletipContent>
        </Toggletip>
      </div>
      <div className="metric-value">{value}</div>
    </div>
  );
}

<MetricCard
  title="Conversion Rate"
  value="4.2%"
  explanation="Percentage of visitors who completed a desired action"
/>
```

### Settings Help

```jsx
import { Toggletip, ToggletipButton, ToggletipContent, Toggle } from '@carbon/react';

<div className="setting-item">
  <div className="setting-label">
    <span>Enable notifications</span>
    <Toggletip>
      <ToggletipButton label="About notifications" />
      <ToggletipContent>
        <p>When enabled, you'll receive:</p>
        <ul>
          <li>Email alerts for important updates</li>
          <li>Browser push notifications</li>
          <li>Weekly summary reports</li>
        </ul>
        <a href="/settings/notifications">Customize →</a>
      </ToggletipContent>
    </Toggletip>
  </div>
  <Toggle id="notifications" />
</div>
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus to toggletip button
- **Enter/Space**: Toggle the toggletip open/closed
- **Esc**: Close the toggletip
- **Tab** (when open): Navigate through interactive elements in content

### Screen Reader Support

- Button has descriptive `aria-label`
- Toggletip content is announced when opened
- ARIA attributes indicate expanded/collapsed state
- Focus management when toggletip opens

### Best Practices

- Use clear, descriptive labels for the button
- Keep content concise and focused
- Ensure all interactive elements are keyboard accessible
- Provide sufficient color contrast
- Don't nest toggletips within toggletips
- Test with keyboard-only navigation
- Close toggletip when clicking outside

---

## Patterns

### Inline Help System

```jsx
import { Toggletip, ToggletipButton, ToggletipContent } from '@carbon/react';

function InlineHelp({ children, helpContent, learnMoreUrl }) {
  return (
    <span>
      {children}{' '}
      <Toggletip>
        <ToggletipButton label="Get help" />
        <ToggletipContent>
          <p>{helpContent}</p>
          {learnMoreUrl && (
            <a href={learnMoreUrl}>Learn more →</a>
          )}
        </ToggletipContent>
      </Toggletip>
    </span>
  );
}

// Usage
<InlineHelp
  helpContent="This feature allows you to schedule posts in advance"
  learnMoreUrl="/docs/scheduling"
>
  Schedule Post
</InlineHelp>
```

### Dashboard Tooltips

```jsx
import { Toggletip, ToggletipButton, ToggletipContent, Tile } from '@carbon/react';

function DashboardCard({ title, value, trend, description }) {
  return (
    <Tile>
      <div className="card-header">
        <h4>{title}</h4>
        <Toggletip>
          <ToggletipButton label={`About ${title}`} />
          <ToggletipContent>
            <p>{description}</p>
            <p className="trend">Trend: {trend}</p>
          </ToggletipContent>
        </Toggletip>
      </div>
      <div className="card-value">{value}</div>
    </Tile>
  );
}
```

### Table Column Headers

```jsx
import { Toggletip, ToggletipButton, ToggletipContent, DataTable, TableHead, TableHeader } from '@carbon/react';

function TableWithHelp() {
  return (
    <DataTable>
      <TableHead>
        <TableRow>
          <TableHeader>
            Name
          </TableHeader>
          <TableHeader>
            <span>
              Status{' '}
              <Toggletip>
                <ToggletipButton label="Status information" />
                <ToggletipContent>
                  <p><strong>Status values:</strong></p>
                  <ul>
                    <li>Active: Currently running</li>
                    <li>Paused: Temporarily stopped</li>
                    <li>Error: Requires attention</li>
                  </ul>
                </ToggletipContent>
              </Toggletip>
            </span>
          </TableHeader>
        </TableRow>
      </TableHead>
    </DataTable>
  );
}
```

---

## Related Components

- [Tooltip](../Tooltip/Tooltip.md) - For simple hover information
- [DefinitionTooltip](DefinitionTooltip.md) - For term definitions
- [Popover](../AdditionalComponents/Popover.md) - For more complex positioned content
- [Modal](../Modals/Modal.md) - For larger interactive content

---

## References

- [Carbon Design System - Toggletip](https://www.carbondesignsystem.com/components/tooltip/usage#toggletip)
- [WCAG 2.1 - Interactive Controls](https://www.w3.org/WAI/WCAG21/Understanding/keyboard)
- [Inclusive Components - Tooltips & Toggletips](https://inclusive-components.design/tooltips-toggletips/)

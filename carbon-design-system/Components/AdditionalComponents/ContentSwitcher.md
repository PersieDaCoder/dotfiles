# ContentSwitcher

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-contentswitcher--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/content-switcher/usage)

## Overview

ContentSwitcher allows users to toggle between two or more content sections within the same space. It provides a compact way to show different views or filter content without leaving the current page context.

## When to Use

- For switching between 2-5 related content views
- When views are of equal importance
- For filtering or changing data visualization
- In dashboards to switch between chart types
- When space is limited for multiple tabs
- For binary toggles like list/grid view

## When Not to Use

- For more than 5 options (use Tabs or Dropdown)
- For form inputs (use RadioButton or Toggle)
- For navigation between pages (use Tabs)
- When options aren't mutually exclusive

---

## Code Examples

### Basic Usage

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';
import { useState } from 'react';

function ViewSwitcher() {
  const [selected, setSelected] = useState(0);

  return (
    <ContentSwitcher onChange={({ index }) => setSelected(index)}>
      <Switch text="List" />
      <Switch text="Grid" />
    </ContentSwitcher>
  );
}
```

### With Icons

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';
import { List, Grid } from '@carbon/icons-react';

<ContentSwitcher>
  <Switch text="List View" renderIcon={List} />
  <Switch text="Grid View" renderIcon={Grid} />
</ContentSwitcher>
```

### Controlled Component

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';
import { useState } from 'react';

function DashboardView() {
  const [viewType, setViewType] = useState('chart');

  return (
    <>
      <ContentSwitcher
        selectedIndex={viewType === 'chart' ? 0 : 1}
        onChange={({ index }) => setViewType(index === 0 ? 'chart' : 'table')}
      >
        <Switch text="Chart" />
        <Switch text="Table" />
      </ContentSwitcher>

      <div className="content">
        {viewType === 'chart' ? <ChartView /> : <TableView />}
      </div>
    </>
  );
}
```

### Data Visualization Toggle

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';
import { useState } from 'react';

function Analytics() {
  const [chartType, setChartType] = useState('line');

  return (
    <div>
      <ContentSwitcher
        onChange={({ name }) => setChartType(name)}
        selectedIndex={['line', 'bar', 'pie'].indexOf(chartType)}
      >
        <Switch name="line" text="Line" />
        <Switch name="bar" text="Bar" />
        <Switch name="pie" text="Pie" />
      </ContentSwitcher>

      <div className="chart-container">
        {chartType === 'line' && <LineChart />}
        {chartType === 'bar' && <BarChart />}
        {chartType === 'pie' && <PieChart />}
      </div>
    </div>
  );
}
```

### Different Sizes

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';

<ContentSwitcher size="sm">
  <Switch text="Option 1" />
  <Switch text="Option 2" />
</ContentSwitcher>

<ContentSwitcher size="md">
  <Switch text="Option 1" />
  <Switch text="Option 2" />
</ContentSwitcher>

<ContentSwitcher size="lg">
  <Switch text="Option 1" />
  <Switch text="Option 2" />
</ContentSwitcher>
```

### Time Range Selector

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';
import { useState } from 'react';

function TimeRangeSelector({ onChange }) {
  return (
    <ContentSwitcher onChange={({ name }) => onChange(name)}>
      <Switch name="24h" text="24h" />
      <Switch name="7d" text="7d" />
      <Switch name="30d" text="30d" />
      <Switch name="1y" text="1y" />
    </ContentSwitcher>
  );
}
```

### Status Filter

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';

function StatusFilter({ onFilterChange }) {
  return (
    <ContentSwitcher onChange={({ name }) => onFilterChange(name)}>
      <Switch name="all" text="All" />
      <Switch name="active" text="Active" />
      <Switch name="pending" text="Pending" />
      <Switch name="completed" text="Completed" />
    </ContentSwitcher>
  );
}
```

### Product View Toggle

```jsx
import { ContentSwitcher, Switch, Grid, Column } from '@carbon/react';
import { List, Grid as GridIcon } from '@carbon/icons-react';
import { useState } from 'react';

function ProductGallery({ products }) {
  const [view, setView] = useState('grid');

  return (
    <div>
      <ContentSwitcher
        onChange={({ name }) => setView(name)}
        selectedIndex={view === 'grid' ? 0 : 1}
      >
        <Switch name="grid" text="Grid" renderIcon={GridIcon} />
        <Switch name="list" text="List" renderIcon={List} />
      </ContentSwitcher>

      {view === 'grid' ? (
        <Grid>
          {products.map(product => (
            <Column key={product.id} lg={4}>
              <ProductCard product={product} />
            </Column>
          ))}
        </Grid>
      ) : (
        <div className="list-view">
          {products.map(product => (
            <ProductRow key={product.id} product={product} />
          ))}
        </div>
      )}
    </div>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Focus the content switcher
- **Arrow Left/Right**: Navigate between switches
- **Enter/Space**: Activate selected switch
- **Home**: Focus first switch
- **End**: Focus last switch

### Screen Reader Support

- Content switcher uses radio button semantics
- Selected state is announced
- Label text is clearly communicated
- Focus management is handled automatically

### Best Practices

- Keep switch labels short and clear (1-2 words)
- Use 2-5 switches maximum
- Provide icon labels when using icon-only switches
- Ensure selected state is visually distinct
- Test with keyboard-only navigation
- Don't use for navigation between pages

---

## Patterns

### Report View Switcher

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';

function ReportViewer() {
  const [view, setView] = useState('summary');

  return (
    <div>
      <ContentSwitcher onChange={({ name }) => setView(name)}>
        <Switch name="summary" text="Summary" />
        <Switch name="detailed" text="Detailed" />
        <Switch name="raw" text="Raw Data" />
      </ContentSwitcher>

      {view === 'summary' && <SummaryView />}
      {view === 'detailed' && <DetailedView />}
      {view === 'raw' && <RawDataView />}
    </div>
  );
}
```

### Dashboard Metric Toggle

```jsx
import { ContentSwitcher, Switch } from '@carbon/react';

function MetricsDashboard() {
  const [metric, setMetric] = useState('revenue');

  return (
    <div>
      <ContentSwitcher onChange={({ name }) => setMetric(name)}>
        <Switch name="revenue" text="Revenue" />
        <Switch name="users" text="Users" />
        <Switch name="conversion" text="Conversion" />
      </ContentSwitcher>

      <MetricChart type={metric} />
    </div>
  );
}
```

---

## Related Components

- [Tabs](../Tabs/Tabs.md) - For page-level navigation
- [RadioButton](../FormInputs/RadioButton.md) - For form selections
- [Toggle](../FormInputs/Toggle.md) - For binary on/off states
- [Dropdown](../FormInputs/Dropdown.md) - For many options

---

## References

- [Carbon Design System - Content Switcher](https://www.carbondesignsystem.com/components/content-switcher/usage)
- [WCAG 2.1 - Radio Group](https://www.w3.org/WAI/ARIA/apg/patterns/radio/)

# Tabs

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-tabs--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tabs/usage) | [Accessibility](https://www.carbondesignsystem.com/components/tabs/accessibility)

## Overview

Tabs enable users to navigate between different views within the same context. The component uses a composable structure with TabList, Tab, TabPanels, and TabPanel for flexible content organization.

## When to Use

- To organize related content into sections
- When users need to switch between views without leaving the page
- For settings or configuration with multiple categories
- To reduce page complexity by hiding non-active content

## When Not to Use

- For primary navigation (use UIShell navigation)
- For sequential content (use ProgressIndicator)
- When all content should be visible (use Accordion)
- For fewer than 2 sections

---

## Variants

| Variant | Description |
|---------|-------------|
| **Line (Default)** | Underline indicator style |
| **Contained** | Tabs with background containers |
| **Full Width** | Tabs expand to fill available space |
| **With Icons** | Tabs featuring icon elements |
| **Icon Only** | Tabs displaying only icons |
| **Dismissable** | Tabs with close functionality |
| **Vertical** | Tabs arranged vertically |
| **Skeleton** | Loading state placeholder |

---

## Component Structure

```jsx
<Tabs>
  <TabList>
    <Tab>Label 1</Tab>
    <Tab>Label 2</Tab>
  </TabList>
  <TabPanels>
    <TabPanel>Content 1</TabPanel>
    <TabPanel>Content 2</TabPanel>
  </TabPanels>
</Tabs>
```

---

## Props

### Tabs

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `selectedIndex` | `number` | `0` | Controlled selected tab index |
| `defaultSelectedIndex` | `number` | `0` | Default selected index |
| `onChange` | `function` | - | Called with `{ selectedIndex }` |
| `dismissable` | `boolean` | `false` | Enable tab dismissal |
| `onTabCloseRequest` | `function` | - | Called when tab close is requested |

### TabList

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `contained` | `boolean` | `false` | Use contained style |
| `fullWidth` | `boolean` | `false` | Tabs fill available width |
| `activation` | `'automatic' \| 'manual'` | `'automatic'` | Tab activation mode |
| `iconSize` | `'default' \| 'lg'` | `'default'` | Icon size for icon-only tabs |
| `aria-label` | `string` | - | Accessible label for tab list |

### Tab

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `disabled` | `boolean` | `false` | Disable the tab |
| `renderIcon` | `ComponentType` | - | Icon to display |
| `secondaryLabel` | `string` | - | Secondary label text |

---

## Code Examples

### Basic Line Tabs

```jsx
import { Tabs, TabList, Tab, TabPanels, TabPanel } from '@carbon/react';

<Tabs>
  <TabList aria-label="List of tabs">
    <Tab>Dashboard</Tab>
    <Tab>Settings</Tab>
    <Tab>Profile</Tab>
  </TabList>
  <TabPanels>
    <TabPanel>Dashboard content</TabPanel>
    <TabPanel>Settings content</TabPanel>
    <TabPanel>Profile content</TabPanel>
  </TabPanels>
</Tabs>
```

### Contained Tabs

```jsx
<Tabs>
  <TabList contained aria-label="Contained tabs">
    <Tab>Tab 1</Tab>
    <Tab>Tab 2</Tab>
    <Tab>Tab 3</Tab>
  </TabList>
  <TabPanels>
    <TabPanel>Panel 1</TabPanel>
    <TabPanel>Panel 2</TabPanel>
    <TabPanel>Panel 3</TabPanel>
  </TabPanels>
</Tabs>
```

### Tabs with Icons

```jsx
import { Tabs, TabList, Tab, TabPanels, TabPanel } from '@carbon/react';
import { Dashboard, Settings, User } from '@carbon/icons-react';

<Tabs>
  <TabList aria-label="Tabs with icons">
    <Tab renderIcon={Dashboard}>Dashboard</Tab>
    <Tab renderIcon={Settings}>Settings</Tab>
    <Tab renderIcon={User}>Profile</Tab>
  </TabList>
  <TabPanels>
    <TabPanel>Dashboard content</TabPanel>
    <TabPanel>Settings content</TabPanel>
    <TabPanel>Profile content</TabPanel>
  </TabPanels>
</Tabs>
```

### Icon-Only Tabs

```jsx
<Tabs>
  <TabList aria-label="Icon only tabs" iconSize="lg">
    <Tab renderIcon={Dashboard} aria-label="Dashboard" />
    <Tab renderIcon={Settings} aria-label="Settings" />
    <Tab renderIcon={User} aria-label="Profile" />
  </TabList>
  <TabPanels>
    <TabPanel>Dashboard</TabPanel>
    <TabPanel>Settings</TabPanel>
    <TabPanel>Profile</TabPanel>
  </TabPanels>
</Tabs>
```

### Controlled Tabs

```jsx
import { useState } from 'react';

function ControlledTabs() {
  const [selectedIndex, setSelectedIndex] = useState(0);

  return (
    <Tabs
      selectedIndex={selectedIndex}
      onChange={({ selectedIndex }) => setSelectedIndex(selectedIndex)}
    >
      <TabList aria-label="Controlled tabs">
        <Tab>Tab 1</Tab>
        <Tab>Tab 2</Tab>
      </TabList>
      <TabPanels>
        <TabPanel>Content 1</TabPanel>
        <TabPanel>Content 2</TabPanel>
      </TabPanels>
    </Tabs>
  );
}
```

### Dismissable Tabs

```jsx
import { useState } from 'react';

function DismissableTabs() {
  const [tabs, setTabs] = useState(['Tab 1', 'Tab 2', 'Tab 3']);
  const [selectedIndex, setSelectedIndex] = useState(0);

  const handleTabClose = (tabIndex) => {
    setTabs(tabs.filter((_, i) => i !== tabIndex));
    if (selectedIndex >= tabIndex && selectedIndex > 0) {
      setSelectedIndex(selectedIndex - 1);
    }
  };

  return (
    <Tabs
      selectedIndex={selectedIndex}
      onChange={({ selectedIndex }) => setSelectedIndex(selectedIndex)}
      dismissable
      onTabCloseRequest={(tabIndex) => handleTabClose(tabIndex)}
    >
      <TabList aria-label="Dismissable tabs">
        {tabs.map((tab) => (
          <Tab key={tab}>{tab}</Tab>
        ))}
      </TabList>
      <TabPanels>
        {tabs.map((tab) => (
          <TabPanel key={tab}>Content for {tab}</TabPanel>
        ))}
      </TabPanels>
    </Tabs>
  );
}
```

### Vertical Tabs

```jsx
<Tabs>
  <TabList aria-label="Vertical tabs" vertical>
    <Tab>Tab 1</Tab>
    <Tab>Tab 2</Tab>
    <Tab>Tab 3</Tab>
  </TabList>
  <TabPanels>
    <TabPanel>Content 1</TabPanel>
    <TabPanel>Content 2</TabPanel>
    <TabPanel>Content 3</TabPanel>
  </TabPanels>
</Tabs>
```

---

## Accessibility

- TabList requires `aria-label` for screen readers
- Keyboard: Arrow keys to navigate, Enter/Space for manual activation
- Automatic activation changes panel on focus
- Manual activation requires explicit key press
- Icon-only tabs need `aria-label` on each Tab

---

## Related Components

- [ContentSwitcher](ContentSwitcher.md) - For toggling between views
- [Accordion](Accordion.md) - For expandable content sections

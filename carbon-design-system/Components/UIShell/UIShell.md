# UIShell

> 📖 [Storybook - Header](https://react.carbondesignsystem.com/?path=/docs/components-ui-shell-header--overview) | [Storybook - SideNav](https://react.carbondesignsystem.com/?path=/docs/components-ui-shell-sidenav--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/UI-shell/usage)

## Overview

UIShell provides the primary navigation framework for Carbon applications. It includes Header for top-level navigation, SideNav for detailed navigation options, and HeaderGlobalBar for utility actions, creating a consistent and accessible navigation structure.

## When to Use

- As the main navigation framework for your application
- When you need consistent header and side navigation
- For multi-section applications with complex navigation
- When global actions need to be accessible from anywhere
- For applications requiring both desktop and mobile navigation patterns

## When Not to Use

- For simple single-page applications without sections
- When custom navigation is required that doesn't fit the pattern
- For marketing websites (use custom navigation)
- In embedded components or widgets

---

## Variants

| Variant | Description |
|---------|-------------|
| **Header** | Top navigation bar with logo and menus |
| **SideNav** | Collapsible side navigation panel |
| **SideNav Rail** | Condensed navigation with icons |
| **Fixed SideNav** | Always visible side navigation |
| **HeaderGlobalBar** | Utility actions in header |

---

## Code Examples

### Basic Header

```jsx
import { Header, HeaderName } from '@carbon/react';

<Header aria-label="Application">
  <HeaderName href="/" prefix="IBM">
    Product Name
  </HeaderName>
</Header>
```

### Header with Navigation

```jsx
import {
  Header,
  HeaderName,
  HeaderNavigation,
  HeaderMenuItem,
  HeaderMenu
} from '@carbon/react';

<Header aria-label="Application">
  <HeaderName href="/" prefix="IBM">
    Product
  </HeaderName>
  <HeaderNavigation aria-label="Main navigation">
    <HeaderMenuItem href="/catalog">Catalog</HeaderMenuItem>
    <HeaderMenuItem href="/docs">Documentation</HeaderMenuItem>
    <HeaderMenu aria-label="Products" menuLinkName="Products">
      <HeaderMenuItem href="/products/cloud">Cloud</HeaderMenuItem>
      <HeaderMenuItem href="/products/ai">AI & Data</HeaderMenuItem>
      <HeaderMenuItem href="/products/security">Security</HeaderMenuItem>
    </HeaderMenu>
  </HeaderNavigation>
</Header>
```

### Header with Global Actions

```jsx
import {
  Header,
  HeaderName,
  HeaderGlobalBar,
  HeaderGlobalAction
} from '@carbon/react';
import { Search, Notification, UserAvatar } from '@carbon/icons-react';

<Header aria-label="Application">
  <HeaderName href="/" prefix="IBM">
    Product
  </HeaderName>
  <HeaderGlobalBar>
    <HeaderGlobalAction aria-label="Search" tooltipAlignment="end">
      <Search size={20} />
    </HeaderGlobalAction>
    <HeaderGlobalAction aria-label="Notifications" tooltipAlignment="end">
      <Notification size={20} />
    </HeaderGlobalAction>
    <HeaderGlobalAction aria-label="User profile" tooltipAlignment="end">
      <UserAvatar size={20} />
    </HeaderGlobalAction>
  </HeaderGlobalBar>
</Header>
```

### SideNav

```jsx
import {
  SideNav,
  SideNavItems,
  SideNavLink,
  SideNavMenu,
  SideNavMenuItem
} from '@carbon/react';
import { Dashboard, Report, Settings } from '@carbon/icons-react';

<SideNav aria-label="Side navigation" isPersistent>
  <SideNavItems>
    <SideNavLink renderIcon={Dashboard} href="/dashboard">
      Dashboard
    </SideNavLink>
    <SideNavMenu renderIcon={Report} title="Reports">
      <SideNavMenuItem href="/reports/sales">
        Sales
      </SideNavMenuItem>
      <SideNavMenuItem href="/reports/analytics">
        Analytics
      </SideNavMenuItem>
    </SideNavMenu>
    <SideNavLink renderIcon={Settings} href="/settings">
      Settings
    </SideNavLink>
  </SideNavItems>
</SideNav>
```

### Complete Application Shell

```jsx
import {
  Header,
  HeaderName,
  HeaderNavigation,
  HeaderMenuItem,
  HeaderGlobalBar,
  HeaderGlobalAction,
  SideNav,
  SideNavItems,
  SideNavLink,
  SideNavMenu,
  SideNavMenuItem,
  Content
} from '@carbon/react';
import { Search, Notification } from '@carbon/icons-react';
import { useState } from 'react';

function AppShell() {
  const [isSideNavExpanded, setIsSideNavExpanded] = useState(false);

  return (
    <>
      <Header aria-label="My Application">
        <HeaderName href="/" prefix="IBM">
          My App
        </HeaderName>
        <HeaderNavigation aria-label="Main navigation">
          <HeaderMenuItem href="/dashboard">Dashboard</HeaderMenuItem>
          <HeaderMenuItem href="/analytics">Analytics</HeaderMenuItem>
        </HeaderNavigation>
        <HeaderGlobalBar>
          <HeaderGlobalAction aria-label="Search">
            <Search size={20} />
          </HeaderGlobalAction>
          <HeaderGlobalAction aria-label="Notifications">
            <Notification size={20} />
          </HeaderGlobalAction>
        </HeaderGlobalBar>
      </Header>

      <SideNav
        aria-label="Side navigation"
        expanded={isSideNavExpanded}
        onOverlayClick={() => setIsSideNavExpanded(false)}
      >
        <SideNavItems>
          <SideNavLink href="/overview">Overview</SideNavLink>
          <SideNavMenu title="Analytics">
            <SideNavMenuItem href="/analytics/reports">Reports</SideNavMenuItem>
            <SideNavMenuItem href="/analytics/metrics">Metrics</SideNavMenuItem>
          </SideNavMenu>
        </SideNavItems>
      </SideNav>

      <Content>
        {/* Your page content */}
      </Content>
    </>
  );
}
```

### SideNav Rail

```jsx
import { SideNav, SideNavItems, SideNavLink } from '@carbon/react';
import { Dashboard, Report, Settings } from '@carbon/icons-react';

<SideNav
  aria-label="Side navigation"
  isRail
  expanded={false}
>
  <SideNavItems>
    <SideNavLink renderIcon={Dashboard} href="/dashboard">
      Dashboard
    </SideNavLink>
    <SideNavLink renderIcon={Report} href="/reports">
      Reports
    </SideNavLink>
    <SideNavLink renderIcon={Settings} href="/settings">
      Settings
    </SideNavLink>
  </SideNavItems>
</SideNav>
```

### With React Router

```jsx
import { Header, HeaderName, HeaderNavigation, HeaderMenuItem } from '@carbon/react';
import { Link, NavLink } from 'react-router-dom';

<Header aria-label="Application">
  <HeaderName element={Link} to="/" prefix="IBM">
    Product
  </HeaderName>
  <HeaderNavigation aria-label="Main navigation">
    <HeaderMenuItem element={NavLink} to="/catalog">
      Catalog
    </HeaderMenuItem>
    <HeaderMenuItem element={NavLink} to="/docs">
      Documentation
    </HeaderMenuItem>
  </HeaderNavigation>
</Header>
```

### Responsive Header

```jsx
import { Header, HeaderName, HeaderMenuButton, SkipToContent } from '@carbon/react';
import { useState } from 'react';

function ResponsiveHeader() {
  const [isSideNavExpanded, setIsSideNavExpanded] = useState(false);

  return (
    <>
      <Header aria-label="Application">
        <SkipToContent />
        <HeaderMenuButton
          aria-label={isSideNavExpanded ? 'Close menu' : 'Open menu'}
          onClick={() => setIsSideNavExpanded(!isSideNavExpanded)}
          isActive={isSideNavExpanded}
        />
        <HeaderName href="/" prefix="IBM">
          Product
        </HeaderName>
      </Header>
    </>
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Navigate through header items and nav links
- **Enter/Space**: Activate links and toggle menus
- **Escape**: Close open menus
- **Arrow Keys**: Navigate within menus

### Screen Reader Support

- Header includes `aria-label` for navigation landmarks
- SideNav is properly labeled with `aria-label`
- MenuButton states are announced
- Skip to content link allows bypassing navigation
- Active states are communicated via ARIA

### Best Practices

- Always provide aria-labels for navigation regions
- Use Skip to Content for keyboard users
- Ensure all interactive elements are keyboard accessible
- Maintain logical tab order
- Provide clear visual focus indicators
- Test with screen readers
- Consider mobile navigation patterns

---

## Patterns

### Dashboard Application

```jsx
import {
  Header,
  HeaderName,
  SideNav,
  SideNavItems,
  SideNavLink,
  Content
} from '@carbon/react';

function DashboardApp() {
  return (
    <>
      <Header aria-label="Dashboard">
        <HeaderName href="/" prefix="Admin">
          Dashboard
        </HeaderName>
      </Header>

      <SideNav aria-label="Side navigation" isPersistent>
        <SideNavItems>
          <SideNavLink href="/overview">Overview</SideNavLink>
          <SideNavLink href="/users">Users</SideNavLink>
          <SideNavLink href="/reports">Reports</SideNavLink>
          <SideNavLink href="/settings">Settings</SideNavLink>
        </SideNavItems>
      </SideNav>

      <Content>
        {/* Dashboard content */}
      </Content>
    </>
  );
}
```

### Multi-Product Platform

```jsx
import { Header, HeaderName, HeaderNavigation, HeaderMenu, HeaderMenuItem } from '@carbon/react';

<Header aria-label="IBM Platform">
  <HeaderName href="/" prefix="IBM">
    Platform
  </HeaderName>
  <HeaderNavigation aria-label="Product navigation">
    <HeaderMenu aria-label="Cloud products" menuLinkName="Cloud">
      <HeaderMenuItem href="/cloud/compute">Compute</HeaderMenuItem>
      <HeaderMenuItem href="/cloud/storage">Storage</HeaderMenuItem>
      <HeaderMenuItem href="/cloud/network">Network</HeaderMenuItem>
    </HeaderMenu>
    <HeaderMenu aria-label="Data products" menuLinkName="Data & AI">
      <HeaderMenuItem href="/data/analytics">Analytics</HeaderMenuItem>
      <HeaderMenuItem href="/data/ml">Machine Learning</HeaderMenuItem>
    </HeaderMenu>
    <HeaderMenuItem href="/docs">Documentation</HeaderMenuItem>
  </HeaderNavigation>
</Header>
```

### Admin Portal

```jsx
import {
  Header,
  HeaderName,
  HeaderGlobalBar,
  HeaderGlobalAction,
  SideNav,
  SideNavItems,
  SideNavMenu,
  SideNavMenuItem
} from '@carbon/react';
import { UserAvatar } from '@carbon/icons-react';

function AdminPortal() {
  return (
    <>
      <Header aria-label="Admin Portal">
        <HeaderName href="/admin" prefix="Admin">
          Portal
        </HeaderName>
        <HeaderGlobalBar>
          <HeaderGlobalAction aria-label="Account">
            <UserAvatar size={20} />
          </HeaderGlobalAction>
        </HeaderGlobalBar>
      </Header>

      <SideNav aria-label="Admin navigation" isPersistent>
        <SideNavItems>
          <SideNavMenu title="User Management">
            <SideNavMenuItem href="/admin/users">Users</SideNavMenuItem>
            <SideNavMenuItem href="/admin/roles">Roles</SideNavMenuItem>
            <SideNavMenuItem href="/admin/permissions">Permissions</SideNavMenuItem>
          </SideNavMenu>
          <SideNavMenu title="System">
            <SideNavMenuItem href="/admin/settings">Settings</SideNavMenuItem>
            <SideNavMenuItem href="/admin/logs">Logs</SideNavMenuItem>
          </SideNavMenu>
        </SideNavItems>
      </SideNav>
    </>
  );
}
```

---

## Related Components

- [Breadcrumb](../Breadcrumb/Breadcrumb.md) - For secondary navigation
- [Tabs](../Tabs/Tabs.md) - For section navigation
- [Button](../Buttons/Button.md) - For action buttons in header
- [OverflowMenu](../AdditionalComponents/OverflowMenu.md) - For additional menu options

---

## References

- [Carbon Design System - UI Shell](https://www.carbondesignsystem.com/components/UI-shell/usage)
- [WCAG 2.1 - Navigation](https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways)
- [ARIA Practices - Navigation](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure/examples/disclosure-navigation/)

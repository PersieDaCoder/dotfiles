# Carbon Design System - Comprehensive Skill


> Complete reference for building React applications with IBM Carbon Design System v11.

---

## 1. Installation

```bash
npm install @carbon/react @carbon/icons-react @carbon/pictograms-react
```

> Usage: 

```tsx
import { Button, TextInput } from '@carbon/react';
import { Add, Edit, Delete } from '@carbon/icons-react';
import { Airplane } from '@carbon/pictograms-react';
import '@carbon/styles/css/styles.css';
```

---

## 2. Design Tokens - Complete Reference

> Description: This section shows you all tokens that Carbon Design System (React) includes. You will learn about what tokens Carbon has, when and how to use it.

### Details: [Section - 2: Tokens](Tokens.md)

---

## 3. Components Reference (Complete)

> Description: This section shows you all components that Carbon Design System (React) includes. You will learn about what components Carbon has, when and how to use it.

### Details: [Section - 3: Components](Components.md)

---

## 4. Common Patterns

### 4.1 Form with Validation

```jsx
function ValidatedForm() {
  const [data, setData] = useState({ name: '', email: '' });
  const [errors, setErrors] = useState({});

  const validate = () => {
    const err = {};
    if (!data.name) err.name = 'Required';
    if (!data.email) err.email = 'Required';
    else if (!/\S+@\S+\.\S+/.test(data.email)) err.email = 'Invalid';
    return err;
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const err = validate();
    if (Object.keys(err).length === 0) {
      // Submit
    } else {
      setErrors(err);
    }
  };

  return (
    <Form onSubmit={handleSubmit}>
      <Stack gap={5}>
        <TextInput
          id="name"
          labelText="Name"
          value={data.name}
          onChange={(e) => setData({ ...data, name: e.target.value })}
          invalid={!!errors.name}
          invalidText={errors.name}
        />
        <ButtonSet>
          <Button kind="secondary">Cancel</Button>
          <Button kind="primary" type="submit">Submit</Button>
        </ButtonSet>
      </Stack>
    </Form>
  );
}
```

### 4.2 Dashboard with Table

```jsx
function Dashboard() {
  const [filters, setFilters] = useState({ search: '' });

  const filtered = data.filter(item =>
    item.name.toLowerCase().includes(filters.search.toLowerCase())
  );

  return (
    <Grid>
      <Column lg={16}>
        <Stack gap={6}>
          <h1>Dashboard</h1>
          <Search
            labelText="Search"
            placeholder="Search..."
            onChange={(e) => setFilters({ search: e.target.value })}
          />
          <DataTable rows={filtered} headers={headers}>
            {/* Table implementation */}
          </DataTable>
        </Stack>
      </Column>
    </Grid>
  );
}
```

---

## 5. Storybook Integration

### 5.1 Using Storybook for Reference

The [Carbon React Storybook](https://react.carbondesignsystem.com/) is an interactive playground where you can:

1. **Explore all components** - See live examples of every component
2. **View props documentation** - Check available props and their types
3. **Test variants** - Try different configurations and states
4. **Copy code examples** - Get ready-to-use code snippets
5. **Check accessibility** - View ARIA attributes and keyboard interactions

### 5.2 Accessing Specific Components

Use this URL pattern to jump directly to a component:
```
https://react.carbondesignsystem.com/?path=/docs/components-[component]--overview
```

Examples:
- Button: `https://react.carbondesignsystem.com/?path=/docs/components-button--overview`
- DataTable: `https://react.carbondesignsystem.com/?path=/docs/components-datatable-basic--overview`
- Modal: `https://react.carbondesignsystem.com/?path=/docs/components-modal--overview`

### 5.3 Component Quick Reference

All components are organized in Storybook under these categories:

**Components:**
- Form Controls (TextInput, Dropdown, Checkbox, etc.)
- Buttons (Button, IconButton, MenuButton, etc.)
- Data Display (DataTable, Tag, CodeSnippet, etc.)
- Feedback (Modal, Notification, Loading, etc.)
- Navigation (Tabs, Accordion, Breadcrumb, etc.)
- Layout (Grid, Stack, Layer, etc.)

**Elements:**
- Grid
- FlexGrid
- Icons
- IBM Plex (Typography)

**Helpers:**
- HideAtBreakpoint

**Hooks:**
- useContextMenu
- usePrefix

---

## 6. Best Practices

### DO ✓
- Use spacing tokens (`$spacing-05`, `$spacing-07`)
- Follow 2x grid system
- Use color tokens instead of hex
- Maintain 4.5:1 contrast for text
- Use proper heading hierarchy
- Provide labels for inputs
- Implement loading states
- Support keyboard navigation
- Check component examples in Storybook before implementing
- Use Fluid components for full-width forms
- Leverage AI Label components for AI-powered features

### DON'T ✗
- Don't use arbitrary spacing
- Don't use custom colors
- Don't nest interactive elements
- Don't use color alone for info
- Don't disable focus indicators
- Don't override component styles without understanding the implications
- Don't mix productive/expressive types
- Don't forget to check Storybook for the latest component APIs

---

## 7. Resources

- **Main Docs:** https://carbondesignsystem.com/
- **Storybook:** https://react.carbondesignsystem.com/
- **Storybook Index (JSON):** https://react.carbondesignsystem.com/index.json
- **GitHub:** https://github.com/carbon-design-system/carbon
- **Icons Library:** https://carbondesignsystem.com/elements/icons/library/
- **Pictograms Library:** https://carbondesignsystem.com/elements/pictograms/library/

---

## 8. Quick Tips for Using Storybook

1. **Search for Components** - Use the search bar in Storybook to quickly find what you need
2. **Check "Controls" Tab** - Interactive controls let you test component props
3. **View "Docs" Tab** - Comprehensive documentation for each component
4. **Inspect "Canvas" Tab** - See the component in action
5. **Copy Code** - Use the "Show code" button to get ready-to-use snippets
6. **Check Accessibility** - Look for the "Accessibility" tab for WCAG compliance info
7. **Explore Variants** - Each component has multiple story variants showing different use cases
8. **Feature Flags** - Some components have experimental features documented in Storybook

---

**Version:** Carbon v11 (React)
**Last Updated:** December 2025
**Storybook Version:** 5 (index.json format)

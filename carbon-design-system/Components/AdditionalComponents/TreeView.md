# TreeView

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-treeview--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/tree-view/usage)

## Overview

TreeView displays hierarchical data in an expandable tree structure. It's perfect for file systems, organizational charts, category navigation, and any nested data that users need to explore level by level.

## When to Use

- For displaying hierarchical data structures
- In file/folder navigation systems
- For organizational charts or taxonomies
- When showing nested categories or menus
- For site navigation with sub-sections
- When users need to expand/collapse nested items

## When Not to Use

- For flat lists (use ContainedList or StructuredList)
- When all items should be visible at once
- For simple navigation (use standard menus)
- When the hierarchy is only 1-2 levels deep

---

## Code Examples

### Basic Usage

```jsx
import { TreeView, TreeNode } from '@carbon/react';

<TreeView label="File System">
  <TreeNode label="Documents">
    <TreeNode label="Reports">
      <TreeNode label="Q1-2024.pdf" />
      <TreeNode label="Q2-2024.pdf" />
    </TreeNode>
    <TreeNode label="Images">
      <TreeNode label="logo.png" />
    </TreeNode>
  </TreeNode>
  <TreeNode label="Downloads">
    <TreeNode label="file.zip" />
  </TreeNode>
</TreeView>
```

### With Icons

```jsx
import { TreeView, TreeNode } from '@carbon/react';
import { Folder, Document } from '@carbon/icons-react';

<TreeView label="Project">
  <TreeNode label="src" renderIcon={Folder}>
    <TreeNode label="components" renderIcon={Folder}>
      <TreeNode label="Button.js" renderIcon={Document} />
      <TreeNode label="Input.js" renderIcon={Document} />
    </TreeNode>
    <TreeNode label="utils" renderIcon={Folder}>
      <TreeNode label="helpers.js" renderIcon={Document} />
    </TreeNode>
  </TreeNode>
</TreeView>
```

### Controlled Expansion

```jsx
import { TreeView, TreeNode } from '@carbon/react';
import { useState } from 'react';

function ControlledTree() {
  const [expanded, setExpanded] = useState(['node-1']);

  return (
    <TreeView
      label="Controlled Tree"
      selected={expanded}
      onSelect={({ ids }) => setExpanded(ids)}
    >
      <TreeNode id="node-1" label="Parent 1">
        <TreeNode id="node-1-1" label="Child 1-1" />
        <TreeNode id="node-1-2" label="Child 1-2" />
      </TreeNode>
      <TreeNode id="node-2" label="Parent 2">
        <TreeNode id="node-2-1" label="Child 2-1" />
      </TreeNode>
    </TreeView>
  );
}
```

### Navigation Tree

```jsx
import { TreeView, TreeNode } from '@carbon/react';

<TreeView label="Documentation">
  <TreeNode label="Getting Started">
    <TreeNode label="Installation" onClick={() => navigate('/docs/install')} />
    <TreeNode label="Quick Start" onClick={() => navigate('/docs/quickstart')} />
  </TreeNode>
  <TreeNode label="Components">
    <TreeNode label="Buttons" onClick={() => navigate('/docs/buttons')} />
    <TreeNode label="Forms" onClick={() => navigate('/docs/forms')} />
  </TreeNode>
  <TreeNode label="API Reference">
    <TreeNode label="Methods" onClick={() => navigate('/docs/api/methods')} />
    <TreeNode label="Props" onClick={() => navigate('/docs/api/props')} />
  </TreeNode>
</TreeView>
```

### Organization Chart

```jsx
import { TreeView, TreeNode } from '@carbon/react';

<TreeView label="Organization">
  <TreeNode label="CEO">
    <TreeNode label="VP Engineering">
      <TreeNode label="Engineering Manager">
        <TreeNode label="Senior Developer" />
        <TreeNode label="Developer" />
      </TreeNode>
    </TreeNode>
    <TreeNode label="VP Sales">
      <TreeNode label="Sales Manager">
        <TreeNode label="Sales Rep 1" />
        <TreeNode label="Sales Rep 2" />
      </TreeNode>
    </TreeNode>
  </TreeNode>
</TreeView>
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus to tree
- **Arrow Down**: Move to next node
- **Arrow Up**: Move to previous node
- **Arrow Right**: Expand collapsed node or move to first child
- **Arrow Left**: Collapse expanded node or move to parent
- **Enter/Space**: Activate node

### Screen Reader Support

- Tree structure is announced with proper ARIA roles
- Expanded/collapsed states are communicated
- Level and position in tree are announced
- Item counts for branches are provided

### Best Practices

- Provide clear labels for all nodes
- Use icons consistently
- Ensure keyboard navigation works smoothly
- Test with screen readers
- Limit initial depth to 2-3 levels
- Provide search for large trees

---

## Patterns

### File Browser

```jsx
import { TreeView, TreeNode } from '@carbon/react';
import { Folder, Document } from '@carbon/icons-react';

function FileBrowser({ structure }) {
  const renderNode = (node) => (
    <TreeNode
      key={node.id}
      label={node.name}
      renderIcon={node.type === 'folder' ? Folder : Document}
      onClick={() => node.type === 'file' && openFile(node.id)}
    >
      {node.children?.map(renderNode)}
    </TreeNode>
  );

  return (
    <TreeView label="Files">
      {structure.map(renderNode)}
    </TreeView>
  );
}
```

### Category Navigation

```jsx
import { TreeView, TreeNode } from '@carbon/react';

<TreeView label="Categories">
  <TreeNode label="Electronics">
    <TreeNode label="Computers">
      <TreeNode label="Laptops" />
      <TreeNode label="Desktops" />
    </TreeNode>
    <TreeNode label="Phones">
      <TreeNode label="Smartphones" />
      <TreeNode label="Feature Phones" />
    </TreeNode>
  </TreeNode>
  <TreeNode label="Clothing">
    <TreeNode label="Men" />
    <TreeNode label="Women" />
  </TreeNode>
</TreeView>
```

---

## Related Components

- [ContainedList](ContainedList.md) - For flat lists
- [StructuredList](StructuredList.md) - For simple tabular data
- [Accordion](../Accordion/Accordion.md) - For expandable sections
- [Breadcrumb](../Breadcrumb/Breadcrumb.md) - For showing hierarchy path

---

## References

- [Carbon Design System - Tree View](https://www.carbondesignsystem.com/components/tree-view/usage)
- [WCAG 2.1 - Tree View](https://www.w3.org/WAI/ARIA/apg/patterns/treeview/)

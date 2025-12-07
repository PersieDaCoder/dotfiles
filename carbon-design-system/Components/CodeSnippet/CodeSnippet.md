# CodeSnippet

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-codesnippet--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/code-snippet/usage) | [Accessibility](https://www.carbondesignsystem.com/components/code-snippet/accessibility)

## Overview

CodeSnippet presents code examples or terminal commands in a formatted, copyable container. It supports inline, single-line, and multi-line code display with built-in copy functionality and syntax preservation.

## When to Use

- To display code examples in documentation
- For terminal commands or CLI instructions
- When showing configuration files or code samples
- To provide copyable API endpoints or tokens
- In tutorials and technical guides
- For error messages or log outputs

## When Not to Use

- For editable code (use TextArea or code editor instead)
- When syntax highlighting is critical (use a dedicated syntax highlighter)
- For very large code blocks (consider providing a download link)
- When the code needs to be modified by users

---

## Variants

| Variant | Description |
|---------|-------------|
| **Inline** | Small code snippets within text (`type="inline"`) |
| **Single** | One-line code with copy button (`type="single"`) |
| **Multi** | Multiple lines of code with expansion (`type="multi"`) |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `type` | `'inline' \| 'single' \| 'multi'` | `'single'` | Code snippet variant |
| `children` | `string \| node` | required | Code content to display |
| `feedback` | `string` | `'Copied!'` | Feedback text after copying |
| `feedbackTimeout` | `number` | `2000` | Duration to show feedback (ms) |
| `showMoreText` | `string` | `'Show more'` | Text for expand button (multi only) |
| `showLessText` | `string` | `'Show less'` | Text for collapse button (multi only) |
| `hideCopyButton` | `boolean` | `false` | Hide the copy button |
| `light` | `boolean` | `false` | Light variant (deprecated, use Layer) |
| `disabled` | `boolean` | `false` | Disable copy functionality |
| `wrapText` | `boolean` | `false` | Enable text wrapping (multi only) |
| `maxCollapsedNumberOfRows` | `number` | `15` | Rows before "Show more" appears |
| `minCollapsedNumberOfRows` | `number` | `3` | Minimum rows in collapsed state |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Inline Code

```jsx
import { CodeSnippet } from '@carbon/react';

<p>
  Install the package using{' '}
  <CodeSnippet type="inline">npm install @carbon/react</CodeSnippet>
</p>
```

### Single Line

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet type="single">
  yarn add @carbon/react
</CodeSnippet>
```

### Multi-Line

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet type="multi">
  {`import { Button } from '@carbon/react';

function App() {
  return (
    <Button kind="primary">
      Click me
    </Button>
  );
}

export default App;`}
</CodeSnippet>
```

### Without Copy Button

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet type="single" hideCopyButton>
  This code cannot be copied
</CodeSnippet>
```

### Custom Feedback

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet
  type="single"
  feedback="Code copied to clipboard!"
  feedbackTimeout={3000}
>
  git clone https://github.com/carbon-design-system/carbon.git
</CodeSnippet>
```

### With Text Wrapping

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet type="multi" wrapText>
  {`This is a very long line of code that would normally overflow the container but with wrapText enabled it will wrap to the next line instead of requiring horizontal scrolling`}
</CodeSnippet>
```

### Custom Expansion Limits

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet
  type="multi"
  maxCollapsedNumberOfRows={5}
  minCollapsedNumberOfRows={2}
  showMoreText="Expand code"
  showLessText="Collapse code"
>
  {`Line 1
Line 2
Line 3
Line 4
Line 5
Line 6
Line 7
Line 8`}
</CodeSnippet>
```

### Installation Instructions

```jsx
import { CodeSnippet } from '@carbon/react';

function InstallGuide() {
  return (
    <div>
      <h3>NPM</h3>
      <CodeSnippet type="single">
        npm install @carbon/react
      </CodeSnippet>

      <h3>Yarn</h3>
      <CodeSnippet type="single">
        yarn add @carbon/react
      </CodeSnippet>

      <h3>PNPM</h3>
      <CodeSnippet type="single">
        pnpm add @carbon/react
      </CodeSnippet>
    </div>
  );
}
```

### API Response Example

```jsx
import { CodeSnippet } from '@carbon/react';

<CodeSnippet type="multi">
  {`{
  "status": "success",
  "data": {
    "id": "123",
    "name": "John Doe",
    "email": "john@example.com"
  },
  "timestamp": "2024-01-15T10:30:00Z"
}`}
</CodeSnippet>
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus to copy button
- **Enter/Space**: Activate copy button when focused
- **Tab** (in multi-line): Focus show more/less button

### Screen Reader Support

- Copy button includes descriptive `aria-label`
- Feedback is announced to screen readers via `aria-live`
- Code content is properly marked as `<code>` element
- Show more/less button states are announced

### Best Practices

- Provide context for what the code does before showing the snippet
- Use appropriate type (inline, single, multi) based on content
- Keep inline snippets short and within text flow
- Ensure sufficient color contrast for code text
- Test with keyboard-only navigation
- Consider providing additional explanation for complex code

---

## Patterns

### Documentation Code Blocks

```jsx
import { CodeSnippet } from '@carbon/react';

function DocsExample({ title, description, code }) {
  return (
    <div className="code-example">
      <h4>{title}</h4>
      <p>{description}</p>
      <CodeSnippet type="multi">{code}</CodeSnippet>
    </div>
  );
}

// Usage
<DocsExample
  title="Basic Button"
  description="Create a simple button component"
  code={`import { Button } from '@carbon/react';

<Button>Click me</Button>`}
/>
```

### API Endpoint Display

```jsx
import { CodeSnippet, StructuredListWrapper, StructuredListHead, StructuredListRow, StructuredListCell, StructuredListBody } from '@carbon/react';

function APIEndpoint({ method, endpoint, description }) {
  return (
    <div className="api-endpoint">
      <h4>{method} {endpoint}</h4>
      <p>{description}</p>
      <CodeSnippet type="single">
        curl -X {method} https://api.example.com{endpoint}
      </CodeSnippet>
    </div>
  );
}
```

### Environment Variables Guide

```jsx
import { CodeSnippet } from '@carbon/react';

function EnvSetup() {
  return (
    <div>
      <h3>Environment Configuration</h3>
      <p>Create a <CodeSnippet type="inline">.env</CodeSnippet> file:</p>

      <CodeSnippet type="multi">
        {`# API Configuration
API_KEY=your_api_key_here
API_URL=https://api.example.com

# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=myapp`}
      </CodeSnippet>
    </div>
  );
}
```

### Git Commands Tutorial

```jsx
import { CodeSnippet } from '@carbon/react';

function GitTutorial() {
  return (
    <div className="tutorial">
      <h3>Clone the repository</h3>
      <CodeSnippet type="single">
        git clone https://github.com/username/repo.git
      </CodeSnippet>

      <h3>Navigate to directory</h3>
      <CodeSnippet type="single">
        cd repo
      </CodeSnippet>

      <h3>Install dependencies</h3>
      <CodeSnippet type="single">
        npm install
      </CodeSnippet>

      <h3>Start development server</h3>
      <CodeSnippet type="single">
        npm run dev
      </CodeSnippet>
    </div>
  );
}
```

### Configuration File Example

```jsx
import { CodeSnippet, Tabs, Tab, TabList, TabPanels, TabPanel } from '@carbon/react';

function ConfigExamples() {
  return (
    <Tabs>
      <TabList aria-label="Configuration examples">
        <Tab>JSON</Tab>
        <Tab>YAML</Tab>
        <Tab>TOML</Tab>
      </TabList>
      <TabPanels>
        <TabPanel>
          <CodeSnippet type="multi">
            {`{
  "name": "my-app",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build": "vite build"
  }
}`}
          </CodeSnippet>
        </TabPanel>
        <TabPanel>
          <CodeSnippet type="multi">
            {`name: my-app
version: 1.0.0
scripts:
  dev: vite
  build: vite build`}
          </CodeSnippet>
        </TabPanel>
        <TabPanel>
          <CodeSnippet type="multi">
            {`name = "my-app"
version = "1.0.0"

[scripts]
dev = "vite"
build = "vite build"`}
          </CodeSnippet>
        </TabPanel>
      </TabPanels>
    </Tabs>
  );
}
```

---

## Related Components

- [CopyButton](../Buttons/CopyButton.md) - Standalone copy-to-clipboard button
- [TextArea](../FormInputs/TextArea.md) - For editable multi-line text
- [Tile](../Tile/Tile.md) - For general content containers
- [Modal](../Modals/Modal.md) - Can contain code snippets in dialogs

---

## References

- [Carbon Design System - Code Snippet](https://www.carbondesignsystem.com/components/code-snippet/usage)
- [MDN - The Code Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/code)
- [W3C - Clipboard API](https://www.w3.org/TR/clipboard-apis/)

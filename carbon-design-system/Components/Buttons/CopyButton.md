# CopyButton

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-copybutton--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/button/usage) | [Accessibility](https://www.carbondesignsystem.com/components/button/accessibility)

## Overview

Copy button is a specialized button component that copies text to the user's clipboard and provides immediate visual feedback. It's commonly used with code snippets, URLs, IDs, or any text that users frequently need to copy. The button automatically shows a success state after copying.

## When to Use

- **Code snippets**: Copying code examples or commands
- **URLs and links**: Sharing links or deep links
- **IDs and tokens**: Copying API keys, transaction IDs, or unique identifiers
- **Formatted text**: Copying addresses, phone numbers, or structured data
- **Quick copying**: Any scenario where users frequently copy the same content

## When Not to Use

- **Editable text**: If users can already select and copy the text easily
- **Long content**: For multi-paragraph content, provide a "Copy all" option instead
- **Download content**: Use a Download button for files
- **Share functionality**: Use a Share button for social sharing

## Component API

### Basic Usage

```jsx
import { CopyButton } from '@carbon/react';

<CopyButton
  feedback="Copied!"
  feedbackTimeout={2000}
  onClick={() => navigator.clipboard.writeText('Content to copy')}
/>
```

### With Code Snippet

```jsx
const code = 'npm install @carbon/react';

<div className="code-container">
  <code>{code}</code>
  <CopyButton
    feedback="Copied to clipboard"
    onClick={() => navigator.clipboard.writeText(code)}
  />
</div>
```

### Inline with Text

```jsx
function APIKeyDisplay({ apiKey }) {
  return (
    <div className="api-key">
      <code>{apiKey}</code>
      <CopyButton
        feedback="API key copied!"
        iconDescription="Copy API key"
        onClick={() => navigator.clipboard.writeText(apiKey)}
      />
    </div>
  );
}
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `feedback` | `string` | `"Copied!"` | Success message shown after copying |
| `feedbackTimeout` | `number` | `2000` | Duration in ms to show feedback (default 2 seconds) |
| `iconDescription` | `string` | `"Copy to clipboard"` | Accessible label for the button |
| `onClick` | `func` | - | Click handler where you implement copy logic |
| `align` | `string` | `"bottom"` | Feedback tooltip alignment: `"top"`, `"right"`, `"bottom"`, `"left"` |
| `className` | `string` | - | Additional CSS classes |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from the button |
| `Enter/Space` | Copies content and shows feedback |

### Screen Reader Support

- Button has accessible label via `iconDescription`
- Success feedback is announced to screen readers
- Visual and programmatic focus indicators
- Disabled state properly communicated

### Best Practices

- Provide clear `iconDescription` indicating what will be copied
- Use concise `feedback` messages that confirm the action
- Set appropriate `feedbackTimeout` (2-3 seconds is typical)
- Position button near the content being copied
- Ensure adequate color contrast for the icon
- Don't rely solely on the feedback tooltip - some users might miss it

## Patterns

### With CodeSnippet Component

```jsx
import { CodeSnippet, CopyButton } from '@carbon/react';

function InstallCommand() {
  const command = 'npm install @carbon/react';

  return (
    <CodeSnippet type="single" feedback="Copied!">
      {command}
    </CodeSnippet>
  );
}
// Note: CodeSnippet has built-in CopyButton functionality
```

### Custom Copy Implementation

```jsx
function CopyToClipboard({ text, label, successMessage }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    try {
      await navigator.clipboard.writeText(text);
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error('Failed to copy:', err);
    }
  };

  return (
    <CopyButton
      feedback={successMessage || "Copied!"}
      iconDescription={label || "Copy to clipboard"}
      onClick={handleCopy}
    />
  );
}
```

### Copy URL with Validation

```jsx
function ShareURL({ url }) {
  const [error, setError] = useState(null);

  const handleCopy = async () => {
    if (!url) {
      setError('No URL to copy');
      return;
    }

    try {
      await navigator.clipboard.writeText(url);
      setError(null);
    } catch (err) {
      setError('Failed to copy URL');
    }
  };

  return (
    <div>
      <TextInput
        id="share-url"
        labelText="Share URL"
        value={url}
        readOnly
        invalid={!!error}
        invalidText={error}
      />
      <CopyButton
        feedback="URL copied!"
        iconDescription="Copy URL to clipboard"
        onClick={handleCopy}
      />
    </div>
  );
}
```

### Copy Table Cell Content

```jsx
function CopyableTableCell({ value, label }) {
  return (
    <TableCell>
      <div className="copyable-cell">
        <span>{value}</span>
        <CopyButton
          feedback="Copied!"
          iconDescription={`Copy ${label}`}
          onClick={() => navigator.clipboard.writeText(value)}
        />
      </div>
    </TableCell>
  );
}
```

### Multi-format Copy

```jsx
function MultiFormatCopy({ data }) {
  const copyAsJSON = async () => {
    const json = JSON.stringify(data, null, 2);
    await navigator.clipboard.writeText(json);
  };

  const copyAsCSV = async () => {
    const csv = Object.entries(data)
      .map(([key, value]) => `${key},${value}`)
      .join('\n');
    await navigator.clipboard.writeText(csv);
  };

  return (
    <div className="copy-options">
      <CopyButton
        feedback="JSON copied!"
        iconDescription="Copy as JSON"
        onClick={copyAsJSON}
      />
      <CopyButton
        feedback="CSV copied!"
        iconDescription="Copy as CSV"
        onClick={copyAsCSV}
      />
    </div>
  );
}
```

## Browser Compatibility

The Clipboard API (`navigator.clipboard.writeText()`) requires:
- **HTTPS**: Works only on secure contexts (HTTPS or localhost)
- **User interaction**: Must be triggered by user action (click)
- **Modern browsers**: Supported in all modern browsers
- **Permissions**: May require clipboard permission in some browsers

### Fallback for Older Browsers

```jsx
function copyToClipboard(text) {
  // Modern approach
  if (navigator.clipboard && window.isSecureContext) {
    return navigator.clipboard.writeText(text);
  }

  // Fallback for older browsers
  const textArea = document.createElement('textarea');
  textArea.value = text;
  textArea.style.position = 'fixed';
  textArea.style.left = '-999999px';
  document.body.appendChild(textArea);
  textArea.select();

  try {
    document.execCommand('copy');
  } catch (err) {
    console.error('Copy failed:', err);
  } finally {
    document.body.removeChild(textArea);
  }
}
```

## Related Components

- **CodeSnippet**: Displays code with built-in copy functionality
- **IconButton**: For custom icon-only buttons
- **Button**: For standard buttons with text labels
- **TextInput**: Often paired with CopyButton for copyable text fields

## References

- [Carbon Design System - Button](https://www.carbondesignsystem.com/components/button/usage)
- [React Storybook - CopyButton](https://react.carbondesignsystem.com/?path=/docs/components-copybutton--overview)
- [MDN - Clipboard API](https://developer.mozilla.org/en-US/docs/Web/API/Clipboard_API)
- [WCAG 2.1 - Status Messages](https://www.w3.org/WAI/WCAG21/Understanding/status-messages.html)

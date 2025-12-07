# TextArea

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-textarea--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/text-input/usage) | [Accessibility](https://www.carbondesignsystem.com/components/text-input/accessibility)

## Overview

Text areas are multi-line text input fields designed for longer-form content entry such as descriptions, comments, messages, or any text that requires multiple lines or paragraphs. They provide a resizable input area that expands to accommodate content.

## When to Use

- **Long-form text**: Comments, descriptions, messages, or feedback that spans multiple lines
- **Paragraph content**: Any text that requires paragraph breaks or formatting awareness
- **Character limits**: When you need to enforce maximum character counts with a counter
- **Variable length content**: User input where length is unpredictable but likely multi-line
- **Detailed explanations**: Forms requesting explanations, rationales, or detailed responses

## When Not to Use

- **Single-line text**: Use TextInput for names, emails, or short data (< 50 characters)
- **Formatted text**: Use a rich text editor for content needing formatting (bold, lists, etc.)
- **Structured data**: Use specific inputs (Dropdown, NumberInput) for predictable formats
- **Search queries**: Use Search component for search functionality
- **Code input**: Use CodeSnippet or a specialized code editor for code entry

## Component API

### Basic Usage

```jsx
import { TextArea } from '@carbon/react';

<TextArea
  id="description"
  labelText="Description"
  placeholder="Enter a description..."
  rows={4}
/>
```

### With Character Counter

```jsx
<TextArea
  id="comment"
  labelText="Comment"
  enableCounter={true}
  maxCount={500}
  helperText="Share your thoughts (max 500 characters)"
  rows={4}
/>
```

### With Validation

```jsx
<TextArea
  id="feedback"
  labelText="Feedback"
  value={feedback}
  onChange={(e) => setFeedback(e.target.value)}
  invalid={feedback.length < 10}
  invalidText="Feedback must be at least 10 characters"
  rows={6}
/>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `id` | `string` | required | Unique identifier for the textarea |
| `labelText` | `node` | required | Label text displayed above the textarea |
| `value` | `string` | - | Controlled textarea value |
| `defaultValue` | `string` | - | Uncontrolled default value |
| `placeholder` | `string` | - | Placeholder text when empty |
| `rows` | `number` | `4` | Initial number of visible rows |
| `cols` | `number` | `50` | Number of visible columns |
| `enableCounter` | `bool` | `false` | Show character counter |
| `maxCount` | `number` | - | Maximum character count (requires `enableCounter`) |
| `counterMode` | `string` | `"character"` | Counter type: `"character"` or `"word"` |
| `helperText` | `node` | - | Helper text below the textarea |
| `invalid` | `bool` | `false` | Show error state |
| `invalidText` | `node` | - | Error message text |
| `warn` | `bool` | `false` | Show warning state |
| `warnText` | `node` | - | Warning message text |
| `disabled` | `bool` | `false` | Disable the textarea |
| `readOnly` | `bool` | `false` | Make textarea read-only |
| `light` | `bool` | `false` | Use light variant |
| `hideLabel` | `bool` | `false` | Visually hide label (still accessible) |
| `onChange` | `func` | - | Change event handler |
| `onBlur` | `func` | - | Blur event handler |
| `onFocus` | `func` | - | Focus event handler |
| `className` | `string` | - | Additional CSS classes |

## Accessibility

### Keyboard Support

| Key | Action |
|-----|--------|
| `Tab` | Moves focus to/from the textarea |
| `Enter` | Inserts a new line |
| `Shift + Tab` | Moves focus to previous element |

### Screen Reader Support

- Proper label association using `for`/`id` attributes
- Helper text linked via `aria-describedby`
- Invalid and warning states communicated through ARIA
- Character counter updates announced dynamically
- Remaining character count announced at thresholds

### Best Practices

- Always provide visible `labelText`
- Use `helperText` to explain purpose or format requirements
- Provide clear error messages with guidance for correction
- Don't rely on placeholder text alone for instructions
- Ensure adequate color contrast (4.5:1 minimum)
- Set appropriate `rows` value (typically 3-6) based on expected content

## Patterns

### Auto-growing TextArea

```jsx
function AutoGrowTextArea() {
  const [value, setValue] = useState('');
  const textareaRef = useRef(null);

  const handleChange = (e) => {
    setValue(e.target.value);
    // Auto-resize logic
    if (textareaRef.current) {
      textareaRef.current.style.height = 'auto';
      textareaRef.current.style.height = textareaRef.current.scrollHeight + 'px';
    }
  };

  return (
    <TextArea
      id="auto-grow"
      labelText="Message"
      value={value}
      onChange={handleChange}
      ref={textareaRef}
      rows={3}
    />
  );
}
```

### With Word Counter

```jsx
function WordCountTextArea() {
  const [content, setContent] = useState('');
  const wordCount = content.trim().split(/\s+/).filter(Boolean).length;
  const maxWords = 200;

  return (
    <TextArea
      id="essay"
      labelText="Essay"
      value={content}
      onChange={(e) => setContent(e.target.value)}
      enableCounter={true}
      maxCount={maxWords}
      counterMode="word"
      invalid={wordCount > maxWords}
      invalidText={`Exceeds maximum word count by ${wordCount - maxWords} words`}
      rows={8}
    />
  );
}
```

### Rich Validation

```jsx
function ValidatedTextArea() {
  const [text, setText] = useState('');
  const minLength = 20;
  const maxLength = 500;

  const getValidationState = () => {
    if (text.length === 0) return {};
    if (text.length < minLength) {
      return {
        invalid: true,
        invalidText: `At least ${minLength} characters required`
      };
    }
    if (text.length > maxLength * 0.9) {
      return {
        warn: true,
        warnText: `Approaching character limit (${text.length}/${maxLength})`
      };
    }
    return {};
  };

  return (
    <TextArea
      id="description"
      labelText="Description"
      value={text}
      onChange={(e) => setText(e.target.value)}
      enableCounter={true}
      maxCount={maxLength}
      rows={6}
      {...getValidationState()}
    />
  );
}
```

## Related Components

- [TextInput](./TextInput.md) - For single-line text entry
- **Form**: For wrapping textarea in forms
- **FormGroup**: For grouping related textareas
- **CodeSnippet**: For displaying multi-line code (read-only)
- [Search](./Search.md) - For search-specific text input

## References

- [Carbon Design System - Text Input](https://www.carbondesignsystem.com/components/text-input/usage)
- [React Storybook - TextArea](https://react.carbondesignsystem.com/?path=/docs/components-textarea--overview)
- [WCAG 2.1 - Labels or Instructions](https://www.w3.org/WAI/WCAG21/Understanding/labels-or-instructions.html)

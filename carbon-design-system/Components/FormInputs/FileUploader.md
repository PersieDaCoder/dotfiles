# File Uploader

[Storybook](https://react.carbondesignsystem.com/?path=/docs/components-fileuploader--overview) | [Source code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/FileUploader) | [Usage guidelines](https://www.carbondesignsystem.com/components/file-uploader/usage) | [Accessibility](https://www.carbondesignsystem.com/components/file-uploader/accessibility)

## Overview

File uploader allows users to select one or more files to upload to a specific location. It supports both button-triggered file selection and drag-and-drop functionality.

## When to use

- **Document uploads**: When users need to upload documents, images, or other files
- **Profile pictures**: For uploading avatars or profile images
- **Attachments**: When users need to attach files to forms or messages
- **Import data**: When users need to import data from files
- **Bulk uploads**: When multiple files need to be uploaded at once

## When not to use

- **Webcam capture**: Use a specialized camera component instead
- **Large file transfers**: Consider specialized file transfer solutions
- **Real-time streaming**: File uploader is for discrete file uploads only
- **External links**: Use a text input for URL submission

## Live Demo

```jsx
import { FileUploader } from '@carbon/react';

function Example() {
  return (
    <FileUploader
      accept={['.jpg', '.png', '.pdf']}
      buttonLabel="Add files"
      labelTitle="Upload files"
      labelDescription="Max file size is 500mb"
      filenameStatus="edit"
    />
  );
}
```

## Variants

### Default (Button)
```jsx
<FileUploader
  accept={['.jpg', '.png']}
  buttonLabel="Add files"
  labelTitle="Upload"
  labelDescription="Only .jpg and .png files. 500mb max file size."
  filenameStatus="edit"
/>
```

### Multiple files
```jsx
<FileUploader
  accept={['.jpg', '.png', '.pdf']}
  buttonLabel="Add files"
  labelTitle="Upload"
  multiple={true}
  filenameStatus="edit"
/>
```

### Drag and drop
```jsx
import { FileUploaderDropContainer, FileUploaderItem } from '@carbon/react';

function DragDropExample() {
  const [files, setFiles] = useState([]);

  return (
    <div>
      <FileUploaderDropContainer
        accept={['image/jpeg', 'image/png']}
        labelText="Drag and drop files here or click to upload"
        onAddFiles={(evt, { addedFiles }) => {
          setFiles([...files, ...addedFiles]);
        }}
      />

      {files.map((file, index) => (
        <FileUploaderItem
          key={index}
          name={file.name}
          status="edit"
          onDelete={() => {
            setFiles(files.filter((_, i) => i !== index));
          }}
        />
      ))}
    </div>
  );
}
```

### With file size limit
```jsx
<FileUploader
  accept={['.jpg', '.png']}
  buttonLabel="Add files"
  labelTitle="Upload image"
  labelDescription="Maximum file size is 5MB"
  maxFileSize={5 * 1024 * 1024} // 5MB in bytes
  filenameStatus="edit"
/>
```

### Disabled
```jsx
<FileUploader
  accept={['.jpg', '.png']}
  buttonLabel="Add files"
  labelTitle="Upload"
  disabled
/>
```

### Invalid state
```jsx
<FileUploader
  accept={['.jpg', '.png']}
  buttonLabel="Add files"
  labelTitle="Upload"
  invalid
  invalidText="File type not supported"
/>
```

### File item variants
```jsx
import { FileUploaderItem } from '@carbon/react';

// Edit state (deletable)
<FileUploaderItem
  name="document.pdf"
  status="edit"
  onDelete={() => console.log('Delete')}
/>

// Complete state
<FileUploaderItem
  name="document.pdf"
  status="complete"
/>

// Uploading state
<FileUploaderItem
  name="document.pdf"
  status="uploading"
/>
```

### Skeleton state
```jsx
import { FileUploaderSkeleton } from '@carbon/react';

<FileUploaderSkeleton />
```

## Controlled Component with Validation

```jsx
import { useState } from 'react';
import { FileUploader, FileUploaderItem } from '@carbon/react';

function ControlledFileUploader() {
  const [files, setFiles] = useState([]);
  const [error, setError] = useState('');

  const maxSize = 5 * 1024 * 1024; // 5MB
  const allowedTypes = ['image/jpeg', 'image/png', 'application/pdf'];

  const handleChange = (e) => {
    const newFiles = Array.from(e.target.files);

    // Validate files
    for (const file of newFiles) {
      if (file.size > maxSize) {
        setError(`${file.name} exceeds 5MB limit`);
        return;
      }

      if (!allowedTypes.includes(file.type)) {
        setError(`${file.name} is not a supported file type`);
        return;
      }
    }

    setError('');
    setFiles([...files, ...newFiles]);
  };

  const handleDelete = (index) => {
    setFiles(files.filter((_, i) => i !== index));
  };

  return (
    <div>
      <FileUploader
        accept={['.jpg', '.png', '.pdf']}
        buttonLabel="Add files"
        labelTitle="Upload files"
        labelDescription="Max file size is 5MB"
        onChange={handleChange}
        invalid={!!error}
        invalidText={error}
        multiple
      />

      {files.map((file, index) => (
        <FileUploaderItem
          key={index}
          name={file.name}
          status="edit"
          onDelete={() => handleDelete(index)}
        />
      ))}
    </div>
  );
}
```

## Upload with Progress

```jsx
import { useState } from 'react';
import { FileUploaderDropContainer, FileUploaderItem } from '@carbon/react';

function UploadWithProgress() {
  const [files, setFiles] = useState([]);

  const uploadFile = async (file) => {
    // Simulate upload
    return new Promise((resolve) => {
      setTimeout(() => resolve(), 2000);
    });
  };

  const handleAddFiles = async (evt, { addedFiles }) => {
    const newFiles = addedFiles.map(file => ({
      file,
      status: 'uploading'
    }));

    setFiles([...files, ...newFiles]);

    // Upload each file
    for (let i = 0; i < newFiles.length; i++) {
      await uploadFile(newFiles[i].file);

      setFiles(prevFiles =>
        prevFiles.map((f, idx) =>
          idx === files.length + i
            ? { ...f, status: 'complete' }
            : f
        )
      );
    }
  };

  return (
    <div>
      <FileUploaderDropContainer
        accept={['image/*']}
        labelText="Drag and drop files here or click to upload"
        onAddFiles={handleAddFiles}
      />

      {files.map((item, index) => (
        <FileUploaderItem
          key={index}
          name={item.file.name}
          status={item.status}
          onDelete={() => {
            setFiles(files.filter((_, i) => i !== index));
          }}
        />
      ))}
    </div>
  );
}
```

## Form Integration

```jsx
import { useState } from 'react';
import { FileUploader, Form, Button, TextInput } from '@carbon/react';

function DocumentUploadForm() {
  const [formData, setFormData] = useState({
    title: '',
    files: []
  });

  const handleSubmit = async (e) => {
    e.preventDefault();

    const uploadData = new FormData();
    uploadData.append('title', formData.title);

    formData.files.forEach((file, index) => {
      uploadData.append(`file_${index}`, file);
    });

    // Submit to API
    console.log('Uploading:', formData);
  };

  return (
    <Form onSubmit={handleSubmit}>
      <TextInput
        id="title"
        labelText="Document title"
        value={formData.title}
        onChange={(e) => setFormData({ ...formData, title: e.target.value })}
      />

      <FileUploader
        accept={['.pdf', '.doc', '.docx']}
        buttonLabel="Add documents"
        labelTitle="Upload documents"
        labelDescription="Supported formats: PDF, DOC, DOCX"
        multiple
        onChange={(e) => {
          setFormData({
            ...formData,
            files: Array.from(e.target.files)
          });
        }}
      />

      <Button type="submit" kind="primary">
        Submit
      </Button>
    </Form>
  );
}
```

## Image Preview

```jsx
import { useState } from 'react';
import { FileUploaderDropContainer, FileUploaderItem } from '@carbon/react';

function ImagePreviewUploader() {
  const [images, setImages] = useState([]);

  const handleAddFiles = (evt, { addedFiles }) => {
    const newImages = addedFiles.map(file => ({
      file,
      preview: URL.createObjectURL(file)
    }));

    setImages([...images, ...newImages]);
  };

  return (
    <div>
      <FileUploaderDropContainer
        accept={['image/*']}
        labelText="Drag and drop images here"
        onAddFiles={handleAddFiles}
      />

      <div style={{ display: 'flex', gap: '16px', marginTop: '16px' }}>
        {images.map((img, index) => (
          <div key={index} style={{ position: 'relative' }}>
            <img
              src={img.preview}
              alt={img.file.name}
              style={{ width: '100px', height: '100px', objectFit: 'cover' }}
            />
            <FileUploaderItem
              name={img.file.name}
              status="edit"
              onDelete={() => {
                URL.revokeObjectURL(img.preview);
                setImages(images.filter((_, i) => i !== index));
              }}
            />
          </div>
        ))}
      </div>
    </div>
  );
}
```

## Component API

### FileUploader

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `accept` | `array` | `[]` | Array of accepted file types (e.g., ['.jpg', '.png']) |
| `buttonLabel` | `string` | `'Add file'` | Label for the file upload button |
| `className` | `string` | - | Specify an optional className to be applied to the container |
| `disabled` | `boolean` | `false` | Specify whether the file uploader is disabled |
| `filenameStatus` | `'edit' \| 'complete' \| 'uploading'` | `'edit'` | Status of uploaded files |
| `iconDescription` | `string` | `'Provide icon description'` | Description for the close icon |
| `invalid` | `boolean` | `false` | Specify whether the file uploader is invalid |
| `invalidText` | `node` | - | Provide text for the invalid state |
| `labelDescription` | `node` | - | Provide additional description text |
| `labelTitle` | `node` | - | Provide the label title |
| `maxFileSize` | `number` | - | Maximum file size in bytes |
| `multiple` | `boolean` | `false` | Allow multiple files to be selected |
| `name` | `string` | - | Name attribute for the input |
| `onChange` | `func` | - | Function called when files are selected. Signature: `(event) => void` |
| `onClick` | `func` | - | Function called when button is clicked |
| `onDelete` | `func` | - | Function called when a file is deleted |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the button |

### FileUploaderDropContainer

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `accept` | `array` | `[]` | Array of accepted MIME types |
| `className` | `string` | - | Specify an optional className |
| `disabled` | `boolean` | `false` | Specify whether the drop container is disabled |
| `labelText` | `string` | **Required** | Text shown in the drop container |
| `multiple` | `boolean` | `false` | Allow multiple files to be dropped |
| `name` | `string` | - | Name attribute for the input |
| `onAddFiles` | `func` | - | Function called when files are added. Signature: `(evt, { addedFiles }) => void` |
| `role` | `string` | `'button'` | ARIA role for the container |
| `tabIndex` | `number` | `0` | Tab index for keyboard navigation |

### FileUploaderItem

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className |
| `errorBody` | `string` | - | Error message body |
| `errorSubject` | `string` | - | Error message subject |
| `iconDescription` | `string` | `'Delete file'` | Description for the delete icon |
| `invalid` | `boolean` | `false` | Specify whether the file is invalid |
| `name` | `string` | - | Name of the uploaded file |
| `onDelete` | `func` | - | Function called when delete button is clicked |
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Specify the size of the item |
| `status` | `'edit' \| 'complete' \| 'uploading'` | `'uploading'` | Status of the upload |
| `uuid` | `string` | - | Unique identifier for the file |

### FileUploaderSkeleton

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `className` | `string` | - | Specify an optional className to be applied to the skeleton |

## Accepted File Types

### Common MIME types
```jsx
// Images
accept={['image/jpeg', 'image/png', 'image/gif', 'image/webp']}

// Documents
accept={['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}

// Spreadsheets
accept={['application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']}

// Archives
accept={['application/zip', 'application/x-rar-compressed']}

// Videos
accept={['video/mp4', 'video/webm', 'video/ogg']}

// Audio
accept={['audio/mpeg', 'audio/wav', 'audio/ogg']}
```

### File extensions
```jsx
// Images
accept={['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']}

// Documents
accept={['.pdf', '.doc', '.docx', '.txt', '.rtf']}

// Spreadsheets
accept={['.xls', '.xlsx', '.csv']}

// Archives
accept={['.zip', '.rar', '.7z', '.tar', '.gz']}
```

## Accessibility

### Keyboard navigation
- **Tab**: Move focus to the upload button or drop zone
- **Enter/Space**: Activate the file picker when focused
- **Escape**: Cancel file selection dialog

### Screen readers
- Button label is announced
- File names are announced when added
- Upload status is announced
- Error messages are announced
- Delete buttons are properly labeled

### Best practices
- Provide clear `labelTitle` and `labelDescription`
- Use `iconDescription` for clear icon labels
- Provide meaningful error messages with `invalidText`
- Indicate accepted file types clearly
- Show file size limits in description
- Provide feedback during upload
- Allow keyboard-only interaction
- Ensure sufficient color contrast (4.5:1 for text)
- Don't rely solely on color to indicate state

### ARIA attributes
- `role="button"` for clickable areas
- `aria-label` for file input
- `aria-describedby` for descriptions
- `aria-invalid` when in error state
- `aria-busy` during upload

## Common Patterns

### Profile Picture Upload
```jsx
<FileUploader
  accept={['image/jpeg', 'image/png']}
  buttonLabel="Choose photo"
  labelTitle="Profile picture"
  labelDescription="JPG or PNG. Max size 2MB."
  maxFileSize={2 * 1024 * 1024}
/>
```

### Document Attachment
```jsx
<FileUploader
  accept={['.pdf', '.doc', '.docx']}
  buttonLabel="Attach documents"
  labelTitle="Supporting documents"
  labelDescription="Upload relevant documents (PDF, DOC, DOCX)"
  multiple
/>
```

### Drag and Drop Upload
```jsx
<FileUploaderDropContainer
  accept={['image/*']}
  labelText="Drag and drop images here or click to browse"
  multiple
  onAddFiles={(evt, { addedFiles }) => {
    console.log('Added files:', addedFiles);
  }}
/>
```

## Related components

- **[Button](Button.md)**: For triggering file selection
- **[ProgressBar](ProgressBar.md)**: For showing upload progress
- **[InlineNotification](InlineNotification.md)**: For upload status messages

## References

- [Carbon Design System - File Uploader Usage](https://www.carbondesignsystem.com/components/file-uploader/usage)
- [Carbon Design System - File Uploader Accessibility](https://www.carbondesignsystem.com/components/file-uploader/accessibility)
- [Carbon React Storybook - File Uploader](https://react.carbondesignsystem.com/?path=/docs/components-fileuploader--overview)
- [GitHub Source Code](https://github.com/carbon-design-system/carbon/tree/main/packages/react/src/components/FileUploader)
- [MDN - File API](https://developer.mozilla.org/en-US/docs/Web/API/File)
- [MDN - FormData](https://developer.mozilla.org/en-US/docs/Web/API/FormData)

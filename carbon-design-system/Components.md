# Carbon Design System - React Components (@carbon/react)

> Description: This section shows you all components that Carbon Design System (React) includes. You will learn about what components Carbon has, when and how to use it.

### 3.1 Form Inputs

-  [TextInput](TextInput.md)
   - **Description:** Single-line text input field for short, free-form text entry like names, emails, or search queries.
   - **When to use:** For brief text entry, form fields, or when users need to input short data with optional validation feedback.

-  [PasswordInput](PasswordInput.md)
   - **Description:** Specialized text input that masks characters during entry with a visibility toggle.
   - **When to use:** For collecting sensitive password data with character concealment and format validation.

-  [TextArea](TextArea.md)
   - **Description:** Multi-line text input field for extended text content like comments or descriptions.
   - **When to use:** For long-form text entry that spans multiple lines or requires paragraph formatting.

-  [NumberInput](NumberInput.md)
   - **Description:** Numeric input with stepper controls and optional formatting for precise number entry.
   - **When to use:** For numeric values requiring increment/decrement controls or specific format constraints.

-  [Dropdown](Dropdown.md)
   - **Description:** Single-selection component displaying a list of options from which users choose one.
   - **When to use:** For selecting one option from a predefined list, especially with 5+ options.

-  [ComboBox](ComboBox.md)
   - **Description:** Selection component combining text input with dropdown, allowing filtering and custom values.
   - **When to use:** For long option lists requiring search/filter, or when custom values may be needed.

-  [MultiSelect](MultiSelect.md)
   - **Description:** Dropdown variant enabling selection of multiple items with tag display.
   - **When to use:** When users need to select multiple options from a list or filter by multiple criteria.

-  [Checkbox](Checkbox.md)
   - **Description:** Selection control for multiple independent binary choices within a group.
   - **When to use:** For multiple selections, binary choices (on/off), or enabling/disabling features.

-  [RadioButton](RadioButton.md)
   - **Description:** Selection control for mutually exclusive choices within a group.
   - **When to use:** When only one option can be selected from a visible group of 2-7 choices.

-  [Toggle](Toggle.md)
   - **Description:** Switch control for immediate on/off state changes.
   - **When to use:** For binary settings that take effect immediately without form submission.

-  [DatePicker](DatePicker.md)
   - **Description:** Calendar picker for selecting single dates or date ranges with customizable formats.
   - **When to use:** For selecting dates, especially recent or near-future dates, with optional range selection.

-  [FileUploader](FileUploader.md)
   - **Description:** Component for uploading files with drag-and-drop support and file management.
   - **When to use:** When users need to upload single or multiple files to the application.

-  [Search](Search.md)
   - **Description:** Input field optimized for search queries with optional expandable variant.
   - **When to use:** For search functionality, filtering content, or finding specific items in datasets.

-  [Slider](Slider.md)
   - **Description:** Visual control for selecting numeric values by dragging along a track.
   - **When to use:** For selecting values from a range, adjusting settings, or when visual feedback helps users.

### 3.2 Buttons

- [Button](Button.md)
  - **Description:** Interactive element that triggers actions with multiple emphasis levels (primary, secondary, tertiary, ghost, danger).
  - **When to use:** For triggering actions, form submissions, navigation, or primary/secondary actions in dialogs.

- [IconButton](IconButton.md)
  - **Description:** Button displaying only an icon, optimized for toolbar and compact layouts.
  - **When to use:** For actions in toolbars, space-constrained layouts, or when icons clearly convey actions.

- [CopyButton](CopyButton.md)
  - **Description:** Specialized button for copying text to clipboard with feedback.
  - **When to use:** For copy-to-clipboard functionality with visual confirmation of the action.

- [ComboButton](ComboButton.md)
  - **Description:** Split button combining primary action with dropdown menu of related actions.
  - **When to use:** When a primary action has multiple related variants or secondary options.

- [MenuButton](MenuButton.md)
  - **Description:** Button that opens a dropdown menu of actions.
  - **When to use:** For displaying a list of actions or options in a compact space.

### 3.3 DataTable

- [DataTable](DataTable.md)
  - **Description:** Feature-rich table component with sorting, filtering, selection, expansion, and batch actions.
  - **When to use:** For displaying structured tabular data requiring sorting, filtering, selection, or batch operations.

### 3.4 Pagination

- [Pagination](Pagination.md)
  - **Description:** Navigation control for moving through pages of content with page size selection.
  - **When to use:** For navigating large datasets split across multiple pages with customizable page sizes.

- [PaginationNav](PaginationNav.md)
  - **Description:** Simplified pagination showing page numbers for direct navigation.
  - **When to use:** When users need to jump directly to specific pages in paginated content.

### 3.5 Modals

- [Modal](Modal.md)
  - **Description:** Dialog overlay requiring user interaction before returning to main content.
  - **When to use:** For confirmations, critical information, forms requiring completion, or when user input is needed.

- [ComposedModal](ComposedModal.md)
  - **Description:** Flexible modal with granular control over header, body, and footer composition.
  - **When to use:** For complex modals requiring custom layouts or more than two action buttons.

### 3.6 Notifications

- [ToastNotification](ToastNotification.md)
  - **Description:** Brief, non-blocking messages that appear temporarily for status updates.
  - **When to use:** For success confirmations, system status updates, or non-critical messages with auto-dismiss.

- [InlineNotification](InlineNotification.md)
  - **Description:** Persistent notification displayed inline with content.
  - **When to use:** For contextual alerts, warnings, or information that should persist with content.

- [ActionableNotification](ActionableNotification.md)
  - **Description:** Notification requiring user action with interactive elements and focus trapping.
  - **When to use:** When user action is required to address the notification or make a decision.

### 3.7 Tabs

- [Tabs](Tabs.md)
  - **Description:** Navigation component for switching between views within the same context using composable structure.
  - **When to use:** For organizing related content into sections or switching views without leaving the page.

### 3.8 Accordion

- [Accordion](Accordion.md)
  - **Description:** Expandable sections for organizing large amounts of content into collapsible panels.
  - **When to use:** For FAQs, documentation with multiple topics, or reducing visual complexity with collapsible content.

### 3.9 Loading States

- [Loading](Loading.md)
  - **Description:** Animated spinner indicating loading or processing state.
  - **When to use:** For page-level loading states or when content is being fetched/processed.

- [InlineLoading](InlineLoading.md)
  - **Description:** Inline loading indicator for localized loading states within components.
  - **When to use:** For showing loading state within buttons, forms, or specific UI sections.

- [SkeletonText](SkeletonText.md)
  - **Description:** Placeholder showing text content structure during loading.
  - **When to use:** For showing text content structure while data loads, improving perceived performance.

- [SkeletonPlaceholder](SkeletonPlaceholder.md)
  - **Description:** Generic skeleton placeholder for custom loading states.
  - **When to use:** For creating custom skeleton screens or placeholder layouts during initial load.

### 3.10 ProgressIndicator

- [ProgressIndicator](ProgressIndicator.md)
  - **Description:** Visual indicator showing completed, current, and upcoming steps in a process.
  - **When to use:** For multi-step processes, wizards, or tracking progress through sequential tasks.

- [ProgressBar](ProgressBar.md)
  - **Description:** Visual bar showing completion percentage of a task or process.
  - **When to use:** For showing determinate progress of uploads, downloads, or long-running operations.

### 3.11 Tag

- [Tag](Tag.md)
  - **Description:** Short labels for categorizing items with variants for dismissible, selectable, and operational interactions.
  - **When to use:** For categorizing/labeling items, filtering with visual feedback, or displaying status/metadata.

### 3.12 Breadcrumb

- [Breadcrumb](Breadcrumb.md)
  - **Description:** Navigation hierarchy displaying the current page location and path.
  - **When to use:** For showing navigation hierarchy in deep site structures or multi-level applications.

### 3.13 Tooltip

- [Tooltip](Tooltip.md)
  - **Description:** Brief, supplemental information appearing on hover/focus for UI elements.
  - **When to use:** For additional context on UI elements, icon-only button labels, or brief hover descriptions.

- [DefinitionTooltip](DefinitionTooltip.md)
  - **Description:** Inline tooltip for providing definitions of terms within text.
  - **When to use:** For defining technical terms, abbreviations, or jargon within content.

- [Toggletip](Toggletip.md)
  - **Description:** Click-activated tooltip for interactive content requiring user interaction.
  - **When to use:** When tooltip content needs to be interactive or contain clickable elements.

### 3.14 CodeSnippet

- [CodeSnippet](CodeSnippet.md)
  - **Description:** Display component for code strings with copy functionality in inline, single-line, or multi-line formats.
  - **When to use:** For displaying code examples, terminal commands, or reusable code blocks with copy support.

### 3.15 Tile

- [Tile](Tile.md)
  - **Description:** Versatile container with clickable, expandable, and selectable variants for displaying content.
  - **When to use:** For grouping related content, creating card layouts, or building selectable option grids.

### 3.16 UIShell

- [UIShell](UIShell.md)
  - **Description:** Application shell with header, navigation, and side panels for consistent layout structure.
  - **When to use:** For creating application-wide navigation, headers, and consistent layout framework.

### 3.17 Grid & Layout

- [Grid & Layout](GridAndLayout.md)
  - **Description:** Responsive grid system and layout components following Carbon's 2x grid structure.
  - **When to use:** For creating responsive layouts, organizing content structure, or implementing Carbon's grid system.

### 3.18 Additional Components

- [StructuredList](StructuredList.md)
  - **Description:** Organized list displaying data in rows with consistent structure.
  - **When to use:** For simple key-value pairs, specifications, or structured data without table complexity.

- [ContainedList](ContainedList.md)
  - **Description:** List with contained styling and optional actions or metadata.
  - **When to use:** For displaying lists with actions, icons, or supplementary information in contained format.

- [TreeView](TreeView.md)
  - **Description:** Hierarchical list with expandable/collapsible nodes for nested data.
  - **When to use:** For displaying hierarchical data like file systems, organizational structures, or nested categories.

- [OverflowMenu](OverflowMenu.md)
  - **Description:** Menu for additional actions accessed via three-dot icon.
  - **When to use:** For secondary actions, contextual menus, or when space is limited for action buttons.

- [ContentSwitcher](ContentSwitcher.md)
  - **Description:** Toggle between two or three options with visual feedback.
  - **When to use:** For switching between 2-3 view modes or content types with immediate effect.

- [Popover](Popover.md)
  - **Description:** Floating container for additional content triggered by user action.
  - **When to use:** For supplementary information, help text, or interactive content without leaving context.

- [Select](Select.md)
  - **Description:** Native HTML select wrapper with Carbon styling.
  - **When to use:** For simple single-selection when native select behavior is preferred over Dropdown.

- [TimePicker](TimePicker.md)
  - **Description:** Input for selecting time values with optional dropdowns for hours/minutes.
  - **When to use:** For time selection in forms, scheduling, or time-based inputs.

- [AILabel](AILabel.md)
  - **Description:** Label indicating AI-powered features with explainability support.
  - **When to use:** For marking AI-generated content or AI-enhanced features requiring transparency.

- [ErrorBoundary](ErrorBoundary.md)
  - **Description:** React error boundary for graceful error handling and fallback UI.
  - **When to use:** For catching JavaScript errors in component trees and displaying fallback UI.

- [OrderedList / UnorderedList](OrderedListUnorderedList.md)
  - **Description:** Styled lists with ordered (numbered) or unordered (bulleted) formatting.
  - **When to use:** For displaying sequential steps, bullet points, or structured list content.

- [Link](Link.md)
  - **Description:** Styled hyperlink component for navigation within text or standalone.
  - **When to use:** For navigation within content, external links, or text-based navigation elements.

- [Heading](Heading.md)
  - **Description:** Semantic heading components with proper hierarchy and styling.
  - **When to use:** For page titles, section headings, or maintaining proper document outline hierarchy.

### 3.19 Fluid Components

- [Fluid Components](FluidComponents.md)
  - **Description:** Full-width responsive variants of form components optimized for fluid layouts.
  - **When to use:** For full-width forms, responsive layouts, or when form fields should span container width.

# PaginationNav

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-paginationnav--overview) | [Usage Guidelines](https://www.carbondesignsystem.com/components/pagination/usage)

## Overview

PaginationNav provides a simplified navigation component for moving between pages. Unlike Pagination, it displays individual page numbers as clickable items and doesn't include page size controls, making it ideal for content-focused interfaces.

## When to Use

- For article series or multi-page documents
- In blogs or content management systems
- When users need to see all available pages at a glance
- For smaller page counts (typically 10 or fewer pages)
- When page size selection is not needed
- In gallery or portfolio interfaces

## When Not to Use

- For data tables with many items (use Pagination instead)
- When users need to control page size
- For very large page counts (more than 15 pages)
- When the total number of pages is unknown
- For infinite scroll scenarios

---

## Variants

| Variant | Description |
|---------|-------------|
| **Default** | Standard page number navigation |
| **With Labels** | Includes next/previous text labels |
| **Disabled** | Non-interactive state |

---

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `totalItems` | `number` | required | Total number of items |
| `itemsShown` | `number` | `10` | Maximum number of page items to display |
| `page` | `number` | `0` | Current page index (controlled, zero-indexed) |
| `onChange` | `function` | - | Callback when page changes `(page) => void` |
| `disabled` | `boolean` | `false` | Disable navigation controls |
| `className` | `string` | - | Additional CSS classes |

---

## Code Examples

### Basic Usage

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function ArticleSeries() {
  const [currentPage, setCurrentPage] = useState(0);

  return (
    <PaginationNav
      totalItems={50}
      itemsShown={10}
      page={currentPage}
      onChange={(page) => setCurrentPage(page)}
    />
  );
}
```

### With Content Navigation

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function BlogPagination({ posts, postsPerPage = 5 }) {
  const [currentPage, setCurrentPage] = useState(0);
  const totalPages = Math.ceil(posts.length / postsPerPage);

  const currentPosts = posts.slice(
    currentPage * postsPerPage,
    (currentPage + 1) * postsPerPage
  );

  return (
    <div>
      <div className="posts">
        {currentPosts.map(post => (
          <article key={post.id}>
            <h2>{post.title}</h2>
            <p>{post.excerpt}</p>
          </article>
        ))}
      </div>

      <PaginationNav
        totalItems={totalPages}
        itemsShown={10}
        page={currentPage}
        onChange={(page) => {
          setCurrentPage(page);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        }}
      />
    </div>
  );
}
```

### Uncontrolled

```jsx
import { PaginationNav } from '@carbon/react';

<PaginationNav
  totalItems={100}
  itemsShown={10}
  onChange={(page) => {
    console.log('Page changed to:', page);
  }}
/>
```

### Limited Page Display

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function GalleryNav() {
  const [page, setPage] = useState(0);

  return (
    <PaginationNav
      totalItems={30}
      itemsShown={5}  // Show only 5 page numbers at a time
      page={page}
      onChange={setPage}
    />
  );
}
```

### With URL Synchronization

```jsx
import { PaginationNav } from '@carbon/react';
import { useSearchParams } from 'react-router-dom';

function SearchResults() {
  const [searchParams, setSearchParams] = useSearchParams();
  const currentPage = parseInt(searchParams.get('page') || '0', 10);

  const handlePageChange = (page) => {
    setSearchParams({ page: page.toString() });
  };

  return (
    <div>
      {/* Content based on currentPage */}

      <PaginationNav
        totalItems={20}
        itemsShown={10}
        page={currentPage}
        onChange={handlePageChange}
      />
    </div>
  );
}
```

### Gallery with Thumbnails

```jsx
import { PaginationNav, Grid, Column } from '@carbon/react';
import { useState } from 'react';

function ImageGallery({ images }) {
  const [page, setPage] = useState(0);
  const imagesPerPage = 12;

  const startIndex = page * imagesPerPage;
  const visibleImages = images.slice(startIndex, startIndex + imagesPerPage);
  const totalPages = Math.ceil(images.length / imagesPerPage);

  return (
    <div className="gallery">
      <Grid>
        {visibleImages.map((image, index) => (
          <Column key={index} lg={4} md={4} sm={4}>
            <img src={image.url} alt={image.alt} />
          </Column>
        ))}
      </Grid>

      <PaginationNav
        totalItems={totalPages}
        itemsShown={8}
        page={page}
        onChange={setPage}
      />
    </div>
  );
}
```

### Documentation Navigation

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function DocumentationPages({ pages }) {
  const [currentPage, setCurrentPage] = useState(0);

  return (
    <div className="documentation">
      <article>
        <h1>{pages[currentPage].title}</h1>
        <div dangerouslySetInnerHTML={{ __html: pages[currentPage].content }} />
      </article>

      <nav className="doc-navigation">
        <PaginationNav
          totalItems={pages.length}
          itemsShown={pages.length}
          page={currentPage}
          onChange={setCurrentPage}
        />
      </nav>
    </div>
  );
}
```

### Disabled State

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function LoadingPagination({ isLoading }) {
  const [page, setPage] = useState(0);

  return (
    <PaginationNav
      totalItems={10}
      itemsShown={10}
      page={page}
      onChange={setPage}
      disabled={isLoading}
    />
  );
}
```

---

## Accessibility

### Keyboard Support

- **Tab**: Move focus between page numbers and navigation buttons
- **Enter/Space**: Navigate to the focused page
- **Arrow Keys**: Navigate between page buttons

### Screen Reader Support

- Each page button has a descriptive label
- Current page is marked with `aria-current="page"`
- Previous/Next buttons are properly labeled
- Disabled state is announced to screen readers

### Best Practices

- Ensure all page buttons have sufficient touch targets (44x44px minimum)
- Maintain clear visual distinction for the current page
- Provide visible focus indicators
- Keep disabled states visually distinct
- Announce page changes to assistive technologies
- Consider reducing visible page count on mobile devices

---

## Patterns

### Blog Post Series

```jsx
import { PaginationNav } from '@carbon/react';
import { useState } from 'react';

function BlogSeries({ posts }) {
  const [currentIndex, setCurrentIndex] = useState(0);
  const currentPost = posts[currentIndex];

  return (
    <div className="blog-series">
      <article>
        <h1>{currentPost.title}</h1>
        <div className="meta">
          <span>Part {currentIndex + 1} of {posts.length}</span>
          <span>{currentPost.date}</span>
        </div>
        <div className="content">{currentPost.content}</div>
      </article>

      <PaginationNav
        totalItems={posts.length}
        itemsShown={posts.length}
        page={currentIndex}
        onChange={setCurrentIndex}
      />
    </div>
  );
}
```

### Product Catalog

```jsx
import { PaginationNav, Grid, Column, Tile } from '@carbon/react';
import { useState } from 'react';

function ProductCatalog({ products }) {
  const [page, setPage] = useState(0);
  const productsPerPage = 9;
  const totalPages = Math.ceil(products.length / productsPerPage);

  const displayedProducts = products.slice(
    page * productsPerPage,
    (page + 1) * productsPerPage
  );

  return (
    <div>
      <Grid>
        {displayedProducts.map(product => (
          <Column key={product.id} lg={4} md={4} sm={4}>
            <Tile>
              <h3>{product.name}</h3>
              <p>{product.price}</p>
            </Tile>
          </Column>
        ))}
      </Grid>

      <PaginationNav
        totalItems={totalPages}
        itemsShown={7}
        page={page}
        onChange={(newPage) => {
          setPage(newPage);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        }}
      />
    </div>
  );
}
```

### Tutorial Steps

```jsx
import { PaginationNav, Button, ButtonSet } from '@carbon/react';
import { useState } from 'react';

function TutorialSteps({ steps }) {
  const [currentStep, setCurrentStep] = useState(0);

  const handleNext = () => {
    if (currentStep < steps.length - 1) {
      setCurrentStep(currentStep + 1);
    }
  };

  const handlePrevious = () => {
    if (currentStep > 0) {
      setCurrentStep(currentStep - 1);
    }
  };

  return (
    <div className="tutorial">
      <div className="step-content">
        <h2>Step {currentStep + 1}: {steps[currentStep].title}</h2>
        <p>{steps[currentStep].description}</p>
      </div>

      <PaginationNav
        totalItems={steps.length}
        itemsShown={steps.length}
        page={currentStep}
        onChange={setCurrentStep}
      />

      <ButtonSet>
        <Button
          kind="secondary"
          onClick={handlePrevious}
          disabled={currentStep === 0}
        >
          Previous
        </Button>
        <Button
          onClick={handleNext}
          disabled={currentStep === steps.length - 1}
        >
          Next
        </Button>
      </ButtonSet>
    </div>
  );
}
```

---

## Related Components

- [Pagination](Pagination.md) - Full-featured pagination with page size controls
- [Breadcrumb](../Breadcrumb/Breadcrumb.md) - For hierarchical navigation
- [Tabs](../Tabs/Tabs.md) - For organizing content into named sections
- [ProgressIndicator](../ProgressIndicator/ProgressIndicator.md) - For step-by-step processes

---

## References

- [Carbon Design System - Pagination](https://www.carbondesignsystem.com/components/pagination/usage)
- [WCAG 2.1 - Navigation](https://www.w3.org/WAI/WCAG21/Understanding/multiple-ways)
- [Pagination UX Best Practices](https://www.smashingmagazine.com/2007/11/pagination-gallery-examples-and-good-practices/)

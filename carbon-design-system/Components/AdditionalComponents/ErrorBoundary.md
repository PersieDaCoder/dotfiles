# ErrorBoundary

> 📖 [Storybook](https://react.carbondesignsystem.com/?path=/docs/components-errorboundary--overview)

## Overview

The ErrorBoundary component is a React error boundary that catches JavaScript errors anywhere in the component tree, logs those errors, and displays a fallback UI instead of the component tree that crashed. It helps prevent the entire application from crashing due to errors in specific components.

## When to use

- To prevent entire application crashes from component errors
- When you want to gracefully handle runtime errors in production
- To provide user-friendly error messages instead of blank screens
- For error logging and monitoring in production environments
- To isolate errors to specific parts of your application

## When not to use

- For handling expected errors or validation (use try/catch or validation logic)
- For server-side errors or API failures (use error handling in your API calls)
- For event handlers (error boundaries don't catch errors in event handlers)
- For asynchronous code like setTimeout or requestAnimationFrame
- During server-side rendering

## Usage

### Basic Example

```jsx
import { ErrorBoundary } from '@carbon/react';

function MyApp() {
  return (
    <ErrorBoundary>
      <MyComponent />
    </ErrorBoundary>
  );
}
```

### With Custom Fallback

```jsx
<ErrorBoundary
  fallback={
    <div>
      <h2>Something went wrong</h2>
      <p>We're sorry for the inconvenience. Please try refreshing the page.</p>
    </div>
  }
>
  <MyComponent />
</ErrorBoundary>
```

### With Error Context

```jsx
<ErrorBoundary
  fallback={(error, errorInfo, reset) => (
    <div className="error-container">
      <h2>Oops! Something went wrong</h2>
      <details>
        <summary>Error details</summary>
        <pre>{error.message}</pre>
        <pre>{errorInfo.componentStack}</pre>
      </details>
      <button onClick={reset}>Try again</button>
    </div>
  )}
>
  <MyComponent />
</ErrorBoundary>
```

### With Error Logging

```jsx
<ErrorBoundary
  onError={(error, errorInfo) => {
    // Log to error reporting service
    console.error('Error caught by boundary:', error, errorInfo);
    logErrorToService(error, errorInfo);
  }}
>
  <MyComponent />
</ErrorBoundary>
```

### Multiple Boundaries

```jsx
function App() {
  return (
    <div>
      <ErrorBoundary>
        <Header />
      </ErrorBoundary>

      <ErrorBoundary>
        <Sidebar />
      </ErrorBoundary>

      <ErrorBoundary>
        <MainContent />
      </ErrorBoundary>

      <ErrorBoundary>
        <Footer />
      </ErrorBoundary>
    </div>
  );
}
```

### With Reset Functionality

```jsx
import { ErrorBoundary } from '@carbon/react';
import { Button } from '@carbon/react';

<ErrorBoundary
  fallback={(error, errorInfo, reset) => (
    <div>
      <h3>Something went wrong</h3>
      <p>{error.message}</p>
      <Button onClick={reset}>Reset</Button>
    </div>
  )}
>
  <MyComponent />
</ErrorBoundary>
```

### Production vs Development

```jsx
<ErrorBoundary
  fallback={(error, errorInfo, reset) => {
    // Show detailed error in development
    if (process.env.NODE_ENV === 'development') {
      return (
        <div>
          <h2>Error Details</h2>
          <pre>{error.toString()}</pre>
          <pre>{errorInfo.componentStack}</pre>
          <button onClick={reset}>Reset</button>
        </div>
      );
    }

    // Show user-friendly message in production
    return (
      <div>
        <h2>Something went wrong</h2>
        <p>Please try refreshing the page.</p>
        <button onClick={reset}>Try again</button>
      </div>
    );
  }}
  onError={(error, errorInfo) => {
    if (process.env.NODE_ENV === 'production') {
      logErrorToService(error, errorInfo);
    }
  }}
>
  <MyComponent />
</ErrorBoundary>
```

## Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `children` | `node` | - | **Required.** The component tree to monitor for errors |
| `fallback` | `node \| func` | - | UI to display when an error occurs. Can be a React node or a function that receives (error, errorInfo, reset) and returns a React node |
| `onError` | `func` | - | Callback invoked when an error is caught. Receives (error, errorInfo) as arguments. Useful for error logging |

## Callback Parameters

### fallback function parameters

When `fallback` is a function, it receives these parameters:

| Parameter | Type | Description |
|-----------|------|-------------|
| `error` | `Error` | The error that was thrown |
| `errorInfo` | `object` | An object with a `componentStack` property containing information about the component stack when the error occurred |
| `reset` | `func` | A function to reset the error boundary state and re-render children |

### onError callback parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `error` | `Error` | The error that was thrown |
| `errorInfo` | `object` | An object with a `componentStack` property |

## Error Boundary Limitations

ErrorBoundary **does not** catch errors for:

- Event handlers (use try/catch instead)
- Asynchronous code (e.g., setTimeout, requestAnimationFrame)
- Server-side rendering
- Errors thrown in the error boundary itself

## Accessibility

- Ensure fallback UI is accessible and provides clear information
- Include keyboard-accessible controls (like reset buttons)
- Use appropriate heading hierarchy in error messages
- Consider screen reader announcements for critical errors
- Provide alternative ways to recover or contact support

## Best Practices

### Do

- Place error boundaries at strategic points in your component tree
- Provide helpful error messages appropriate for your users
- Log errors to monitoring services in production
- Test error boundaries with intentional errors during development
- Use multiple error boundaries to isolate failures
- Provide a way to reset/recover from errors

### Don't

- Don't use error boundaries for control flow
- Don't catch errors that should be handled with try/catch
- Don't show technical stack traces to end users in production
- Don't wrap every single component (be strategic)
- Don't ignore errors without logging them

## Error Logging Example

```jsx
import { ErrorBoundary } from '@carbon/react';
import * as Sentry from '@sentry/react';

function logError(error, errorInfo) {
  // Log to Sentry, LogRocket, or other service
  Sentry.captureException(error, {
    contexts: {
      react: {
        componentStack: errorInfo.componentStack,
      },
    },
  });
}

function App() {
  return (
    <ErrorBoundary
      fallback={<ErrorPage />}
      onError={logError}
    >
      <MyApp />
    </ErrorBoundary>
  );
}
```

## Custom Error Page Example

```jsx
import { ErrorBoundary } from '@carbon/react';
import { Button, InlineNotification } from '@carbon/react';

const ErrorFallback = ({ error, reset }) => (
  <div className="error-page">
    <InlineNotification
      kind="error"
      title="Application Error"
      subtitle="We encountered an unexpected error"
      hideCloseButton
    />
    <div className="error-content">
      <h2>Something went wrong</h2>
      <p>We're sorry for the inconvenience.</p>
      <div className="error-actions">
        <Button onClick={reset}>Try Again</Button>
        <Button kind="secondary" onClick={() => window.location.href = '/'}>
          Go to Home
        </Button>
      </div>
    </div>
  </div>
);

function App() {
  return (
    <ErrorBoundary fallback={ErrorFallback}>
      <MyApp />
    </ErrorBoundary>
  );
}
```

## Testing Error Boundaries

```jsx
// Create a component that throws an error for testing
const BuggyComponent = () => {
  throw new Error('Test error');
  return <div>This will never render</div>;
};

// Test the error boundary
function TestErrorBoundary() {
  const [showBuggy, setShowBuggy] = useState(false);

  return (
    <div>
      <button onClick={() => setShowBuggy(true)}>
        Trigger Error
      </button>

      <ErrorBoundary
        fallback={(error) => (
          <div>
            <h3>Caught error: {error.message}</h3>
            <button onClick={() => setShowBuggy(false)}>Reset</button>
          </div>
        )}
      >
        {showBuggy ? <BuggyComponent /> : <div>No errors yet</div>}
      </ErrorBoundary>
    </div>
  );
}
```

## Related Components

- **InlineNotification**: Use for displaying user-facing error messages
- **ToastNotification**: Use for transient error notifications
- **Modal**: Can be used for critical error dialogs

## Integration Patterns

### With React Query

```jsx
<ErrorBoundary
  fallback={(error, errorInfo, reset) => (
    <ErrorPage error={error} onReset={reset} />
  )}
>
  <QueryClientProvider client={queryClient}>
    <App />
  </QueryClientProvider>
</ErrorBoundary>
```

### With React Router

```jsx
import { BrowserRouter, Routes, Route } from 'react-router-dom';

<BrowserRouter>
  <ErrorBoundary>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/dashboard" element={
        <ErrorBoundary fallback={<DashboardError />}>
          <Dashboard />
        </ErrorBoundary>
      } />
    </Routes>
  </ErrorBoundary>
</BrowserRouter>
```

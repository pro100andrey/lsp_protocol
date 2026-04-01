# Changelog

## 1.0.0

- Initial release
- Redux store implementation with async/sync action support
- Action observers for lifecycle monitoring
- State observers for state change tracking  
- Error handling with UserException and StoreException
- Action status tracking (dispatched, completed, failed)
- Conditional waiting for state or actions (waitCondition, waitAllActions)
- Property injection system for dependency management
- WrapReduce interface for middleware-like behavior
- GlobalWrapError for global error handling

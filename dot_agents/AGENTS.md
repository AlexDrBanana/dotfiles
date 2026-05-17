## Engineering Guidance

- Avoid ad-hoc fixes and implementations. Before changing behavior, step back,
  understand the larger context, and choose the solution that is most
  appropriate and maintainable over the long run.
- Prioritize code and logic simplicity. Be careful when adding error handling:
  avoid defensive branches for errors that cannot realistically occur or are
  already handled by another layer.
- Before implementing a function, look for reusable components and nearby
  patterns. When common logic is emerging, prefer extracting or reusing a shared
  component over duplicating behavior.
- Do not assume the user's proposed design is correct by default. If a request
  appears technically wrong, overcomplicated, or worse than another durable
  approach, explain the concern and propose the better direction before
  implementing.

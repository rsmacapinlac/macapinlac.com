# Project Rules for macapinlac.com

This directory contains project-specific rules for Cursor AI assistance. Rules are written in MDC (Markdown with Context) format and can be of different types:

- **Always**: Always included in the model context
- **Auto Attached**: Included when matching files are referenced
- **Agent Requested**: Available to AI, which decides whether to include it
- **Manual**: Only included when explicitly mentioned using @ruleName

## Rule Types

### Always Rules
- `code_style.mdc`: Core coding standards and style guidelines
- `architecture.mdc`: Architectural decisions and patterns

### Auto Attached Rules
- `blog_posts.mdc`: Guidelines for blog post creation and formatting
- `testing.mdc`: Testing standards and practices

### Agent Requested Rules
- `content_guidelines.mdc`: Content creation and management guidelines
- `deployment.mdc`: Deployment procedures and requirements

## Usage

Rules are automatically applied based on their type and the context of your work. You can:

1. Reference rules manually using @ruleName
2. Let rules auto-attach based on file patterns
3. Allow the AI to request relevant rules
4. Have certain rules always included

## Creating New Rules

Use the "New Cursor Rule" command (Cmd + Shift + P) to create rules quickly. Each rule should:

- Be focused and actionable
- Include clear examples when helpful
- Reference specific files using @filename syntax
- Stay under 500 lines for clarity 
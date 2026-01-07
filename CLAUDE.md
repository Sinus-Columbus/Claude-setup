## SECTION 1: CLAUDE CODE INSTRUCTIONS

### Read This First

**IMPORTANT:** Always read `.claude/project_context.md` when relaunched to understand the current state, known issues, and active development phase.

<<<<<<< HEAD
**Primary Documentation (current repo):**
- **[PROJECT_STATUS.md](PROJECT_STATUS.md)** - Current implementation status and next steps
- **[INITIAL.md](INITIAL.md)** - Original feature request and goals
- **[PRPs/league-dashboard.md](PRPs/league-dashboard.md)** - Full spec, implementation blueprint, and validation steps
- **[PRPs/frontend-shadcn-completion.md](PRPs/frontend-shadcn-completion.md)** - Frontend completion guide
- **[PRPs/ui-enhancements.md](PRPs/ui-enhancements.md)** - Multi-page navigation, dark mode toggle, and archive fix
- **[backend/README.md](backend/README.md)** - Backend setup and API summary
- **[COMPLETION_SUMMARY.md](COMPLETION_SUMMARY.md)** - High-level completion notes
=======
**Primary Documentation:**
- **[README.md](README.md)** - **START HERE!** Complete project overview, architecture, all 15 core components, API documentation, code examples, and getting started guide
- **[CHANGELOG.md](CHANGELOG.md)** - Detailed history of fixes, learnings, and breakthroughs (Nov 5-17, 2025) - 27 entries with implementation decisions and key lessons
- **[.claude/project_context.md](.claude/project_context.md)** - **Current project state** - Read this when relaunched! Contains performance metrics (84.6% accuracy), known issues, active development status
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Azure deployment guide and CI/CD setup (Docker, Azure Web App, GitHub Actions)
>>>>>>> parent of 662e221 (Initial program)

**Specialized Documentation:**
Documentation specialized for parts of the app like how to optimize docker deployment.



---

### How to work with this codebase

#### Development Workflow
 
**Before Making Changes:**
1. Read `.claude/project_context.md` for current state and active issues
2. Check `CHANGELOG.md` for similar past issues and their solutions
3. Review `README.md` for architecture and API details
 
**For Specific Tasks:**
- **Architecture questions** → README.md (authoritative source for all 15 components)
- **Similar past issues** → CHANGELOG.md (search for similar problems and solutions)
- **Azure Deployment** → **docs/azure-deployment-best-practices.md (MUST READ BEFORE ANY DEPLOYMENT - prevents deploying stale Docker images)**
- **Azure CI/CD Setup** → DEPLOYMENT.md (step-by-step Azure deployment guide)
- **Pipeline 2.0** → PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md (complete implementation)
- **Corrections** → docs/correction_system_guide.md (Excel-based workflow)
 
#### Development Standards & Best Practices
 
**From User's Global Instructions (MUST FOLLOW):**
- **Minimize new files**: Always add changes to existing files - minimize creating new temporary files or scripts
- **No emoji in code**: Never use emoji characters when generating documents or code
- **Document learnings**: Always update CLAUDE.md when making significant findings or progress in the project
- **Clean project structure**: If making a temporary file or script, remove it after use - maintain clean structured projects
- **Write fixes to CHANGELOG**: Always document learnings from fixes in CHANGELOG.md (not in CLAUDE.md "Recent Fixes" section anymore)
- **Move PRPs to implemented, after run**: After successfully implementing a PRP, move it to subfolder implemented.
 
**Project Awareness & Context**
- **Before starting work**: Read README.md (architecture, all 15 components), .claude/project_context.md (current state, metrics, known issues), CHANGELOG.md (past solutions and learnings)
- **Understanding system state**: Check current accuracy (84.6%), known issues (OrientationAgent 56.2%), active features (Pipeline 2.0, visual few-shot learning)
- **Verify first, code second**: Always confirm file paths exist, modules are imported correctly, and dependencies are available
 
**Code Structure & Modularity**
- **Target**: 500 lines for NEW files/features (pragmatic guideline, not strict enforcement)
- **Current reality**: Some stable modules exceed this (agent.py: 1,176 lines, ocr_cross_validator.py: 1,028 lines) - that's OK
- **When to split**: Adding unrelated features, file becomes hard to navigate, or approaching 1,000+ lines
- **Module organization**: Group by feature/responsibility (e.g., agent.py + models.py + prompts.py for each agent)
- **Imports**: Use clear, consistent imports (prefer relative imports within packages)
 
**Testing & Reliability**
- **Test location**: tests/ directory using pytest
- **When to test**: Recommended for new features, especially critical business logic (extraction, validation, API endpoints)
- **Policy**: Encouraged but optional - not blocking for development
- **Existing validation**: Leverage validator.py (5%/10m² tolerance), ocr_cross_validator.py (hallucination detection)
- **Test coverage**: At least 1 expected case, 1 edge case, 1 failure case when writing tests
 
**Task Completion & Tracking**
- **Tool**: Use TodoWrite for multi-step tasks (flexible approach - whatever works best)
- **Documentation updates**:
  - CHANGELOG.md: Document fixes and learnings with root cause, solution, and key lessons
  - README.md: Update when architecture changes, new components added, or API endpoints modified
  - .claude/project_context.md: Update current state, metrics, and known issues
- **Definition of done**: Works locally, tests pass (if written), documentation updated, Azure deployment verified (if production change)
- **CRITICAL FOR AZURE DEPLOYMENTS**: ALWAYS read docs/azure-deployment-best-practices.md BEFORE building Docker images or deploying to Azure Web App
 
**Style & Conventions**
- **Python**: Follow PEP 8, use type hints, descriptive variable names (Danish terms OK: sagsnummer, planloesning, koekken_alrum)
- **FastAPI**: Use Pydantic models for validation, write docstrings, leverage dependency injection, handle CORS properly
- **Pydantic**: Be explicit about required/optional fields, use Field() for metadata, avoid default=False for required booleans, use Literal for choice fields
- **Naming conventions**: snake_case for files/functions, PascalCase for classes, UPPER_SNAKE_CASE for constants
- **Docstrings**: Use Google style for all functions/classes
- **Format**: Use black for code formatting (optional but recommended)
 
**AI Behavior Rules**
- **NEVER RUN PURGE COMMANDS UNLESS ABSOLUTELY NECESSARY. AND ALWAYS REMIND THE USER THAT THIS WILL PURGE EVERYTHING**
- **Path verification**: Always verify file paths exist before referencing them, use absolute paths in examples, handle Windows path separators correctly
- **No assumptions**: Read files before modifying, check database schema before migrations, verify API endpoints exist before documenting
- **Error handling**: Handle Danish Unicode characters (ø, æ, å, ²), add try-catch for external APIs (SharePoint, Azure OpenAI), log errors with context, fail gracefully with user-friendly messages
- **Verification steps**: Read existing code → Check dependencies → Test locally → Validate with real data (PDFs, database queries)
- **Never hallucinate**: Only reference verified Python packages, confirmed file paths, and documented API endpoints
 
#### Important Project Context

**Current System State:**

**Tech Stack:**

**Key Features:**

<<<<<<< HEAD
**Known Issues:**
- Production CORS will need explicit frontend origins (see `backend/app/main.py`)
- `frontend/src/components/PickStats.tsx` multiplies `win_rate` by 100 although the backend already returns a percent
=======
**Known Issues (Check `.claude/project_context.md` for updates):**
>>>>>>> parent of 662e221 (Initial program)

#### Neon MCP Server Integration

**Connection Status:**
- Neon MCP server is configured and active
- Project: MnM (round-dust-39089624)
- Database: neondb (PostgreSQL 17, eu-central-1)
- Connection string configured in `backend/.env`

**Available Capabilities:**

**Project & Organization Management:**
- List and search organizations
- List, create, describe, and delete projects
- Get connection strings for any project/branch

**Database Operations:**
- Run SQL queries and transactions
- Get table lists and describe table schemas
- Execute EXPLAIN for query analysis
- List slow queries for performance monitoring

**Schema Management:**
- Prepare and complete database migrations (safe two-step process)
- Compare schemas between branches
- Generate zero-downtime migration SQL

**Query Performance Tuning:**
- Prepare query tuning (analyze execution plans, suggest indexes)
- Complete query tuning (apply optimizations)
- Automatic index recommendations based on query patterns

**Branching & Development:**
- Create branches for development/staging
- Delete branches
- Reset branch from parent
- Describe branch contents (all objects)
- Compare database schemas between branches

**Authentication:**
- Provision Neon Auth for branch (managed auth service)

**Advanced Features:**
- Search across all resources (orgs, projects, branches)
- Fetch detailed resource information
- List branch computes (endpoints)
- Load documentation resources

**Common Workflows:**

1. **Safe Schema Changes:**
   - Use `prepare_database_migration` to test changes on temporary branch
   - Review and verify changes
   - Use `complete_database_migration` to apply to main branch

2. **Query Optimization:**
   - Use `list_slow_queries` to identify performance issues
   - Use `prepare_query_tuning` to analyze and get index suggestions
   - Test changes on temporary branch
   - Use `complete_query_tuning` to apply optimizations

3. **Development Branching:**
   - Create branch for feature development
   - Test schema changes on branch
   - Compare schemas with parent before merging
   - Reset or delete branch when done

**Best Practices:**
- Always use migration tools for schema changes (never modify main branch directly)
- Test queries on temporary branches before applying to production
- Use `compare_database_schema` before merging branches
- Leverage `explain_sql_statement` to understand query performance
- Use Neon's branching feature for development/staging environments

---
 
## SECTION 2: TECHNICAL REFERENCE
 
**NOTE:** For complete architecture, API documentation, and code examples, see [README.md](README.md) as the authoritative source. This section provides Claude-specific technical notes and implementation details.
 
---

## Project Overview
An overview of the project. Keep it technical and focused on development.

## Architecture
The complete Architecture of the project.

### Core Components
Core components of the project.

### Data Flow
Insert the flow of the program, describe the pipeline that the data moves through.

Insert file tree for the project.
In case in code block ``` like this ```

## Key Commands
Use code blocks for the text

### Setup
Setup for running the project

### Development
Start a test instance of the project

### Testing
Run tests on the project

## API Endpoints
A list of API endpoints with params that we can use.

## Important Implementation Details

### Feature 1

### Documentation Hierarchy
 
```
Idea → future_features/ → PRP (PRPs/) → Implementation → CHANGELOG.md
```
 
1. **Idea Stage**: Create brief doc in `future_features/`
2. **Planning Stage**: Create detailed PRP in `PRPs/` when ready for implementation
3. **Implementation**: Follow PRP blueprint, document progress
4. **Completion**: Document learnings and outcomes in `CHANGELOG.md`

## File Organization
 
**For complete project structure, see [README.md#project-structure](README.md#project-structure).**

### Best Practices
 
- **Keep future_features/ lightweight**: 1-2 pages max, focus on "what" and "why"
- **Make PRPs comprehensive**: Include pseudocode, validation, edge cases
- **Update PRPs during implementation**: Add learnings, adjust plan as needed
- **Archive completed PRPs**: Move to `docs/archive/` or reference in CHANGELOG.md
- **Cross-reference**: Link PRPs to related future_features docs for context
 
## Environment Variables


---
 
## 📖 Additional Resources
 
- **README.md** - Complete project documentation (AUTHORITATIVE SOURCE)
- **CHANGELOG.md** - Detailed history with 27 entries (Nov 5-17, 2025)
- **.claude/project_context.md** - Current state and metrics
- **DEPLOYMENT.md** - Azure deployment instructions
- **PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md** - Complete Pipeline 2.0 guide
- **docs/correction_system_guide.md** - Excel-based correction system
## 🚀 SECTION 1: CLAUDE CODE INSTRUCTIONS

**IMPORTANT:** This is an example of how I want claude.md to look. Some parts may not be relevant and this has no relation to the project.

### Read This First
 
**Primary Documentation:**
- **[README.md](README.md)** - **START HERE!** Complete project overview, architecture, all 15 core components, API documentation, code examples, and getting started guide
- **[CHANGELOG.md](CHANGELOG.md)** - Detailed history of fixes, learnings, and breakthroughs (Nov 5-17, 2025) - 27 entries with implementation decisions and key lessons
- **[.claude/project_context.md](.claude/project_context.md)** - **Current project state** - Read this when relaunched! Contains performance metrics (84.6% accuracy), known issues, active development status
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Azure deployment guide and CI/CD setup (Docker, Azure Web App, GitHub Actions)
 
**Specialized Documentation:**
- **[docs/azure-deployment-best-practices.md](docs/azure-deployment-best-practices.md)** - **CRITICAL: READ BEFORE ANY AZURE DEPLOYMENT!** Complete guide to prevent deploying stale Docker images (ACR, Web App, webhooks, CI/CD, Azure AI Foundry Agent management)
- **[PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md](PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md)** - Complete Pipeline 2.0 implementation guide (3-agent architecture, visual few-shot learning, deployment workflow)
- **[docs/azure-foundry-agent-setup.md](docs/azure-foundry-agent-setup.md)** - Quick reference for Azure AI Foundry Agent setup (conversational chat)
- **[.claude/agent_dispatch_guide.md](.claude/agent_dispatch_guide.md)** - Task tool usage patterns for specialized agents
- **[docs/correction_system_guide.md](docs/correction_system_guide.md)** - Excel-based correction system (technical documentation)
- **[docs/correction_quick_start.md](docs/correction_quick_start.md)** - User guide for Excel correction workflow
- **[future_features/split_extraction_architecture.md](future_features/split_extraction_architecture.md)** - Proposed facade/floor plan split extraction research
 
**IMPORTANT:** Always read `.claude/project_context.md` when relaunched to understand the current state, known issues, and active development phase.
 
---
 
### How to Work with This Codebase
 
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
- **Path verification**: Always verify file paths exist before referencing them, use absolute paths in examples, handle Windows path separators correctly
- **No assumptions**: Read files before modifying, check database schema before migrations, verify API endpoints exist before documenting
- **Error handling**: Handle Danish Unicode characters (ø, æ, å, ²), add try-catch for external APIs (SharePoint, Azure OpenAI), log errors with context, fail gracefully with user-friendly messages
- **Verification steps**: Read existing code → Check dependencies → Test locally → Validate with real data (PDFs, database queries)
- **Never hallucinate**: Only reference verified Python packages, confirmed file paths, and documented API endpoints
 
#### Important Project Context
 
**Current System State (as of Nov 17, 2025):**
- **Status**: Pipeline 2.0 deployed to production
- **Accuracy**: 84.6% overall (FacadeAgent: 83.8%, OrientationAgent: 56.2%, FloorPlanAgent: 86.9%)
- **Properties**: 432 production properties loaded (environment='production')
- **RAG System**: Active with 1,001+ corrections learning from past mistakes
- **SharePoint Integration**: ALREADY WORKING - Microsoft Graph API fetching cases and PDFs
- **Database**: PostgreSQL with pgvector on Azure (3072-dim embeddings, text-embedding-3-large)
- **AI Models**: Azure OpenAI (gpt-4o for vision, gpt-4o-mini for text, text-embedding-3-large for embeddings)
 
**Tech Stack:**
- **AI/ML**: Pydantic AI + Azure OpenAI GPT-4 Vision (gpt-4o) + Azure Document Intelligence OCR
- **Database**: PostgreSQL with pgvector extension (3072-dim embeddings)
- **Backend**: Python 3.13+, FastAPI, SQLAlchemy ORM
- **Integration**: Microsoft SharePoint Online (Graph API) - ALREADY WORKING
- **Frontend**: React (separate repo) with iframe authentication support
- **Cloud**: Azure (Web App, Blob Storage, PostgreSQL, OpenAI)
 
**Key Features:**
- **3-Agent Architecture** (Pipeline 2.0): FacadeAgent, OrientationAgent, FloorPlanAgent analyze different PDF pages in parallel
- **Visual Few-Shot Learning**: Reference images for planløsning classification (100% accuracy on test cases)
- **RAG Self-Improvement**: Learns from past corrections to avoid repeated mistakes
- **OCR Cross-Validation**: PyMuPDF line-based extraction detects AI hallucinations (100% room accuracy)
- **Environment Separation**: development/production/staging environments in same database
- **Excel Correction System**: User-friendly correction workflow with data validation
 
**Known Issues (Check `.claude/project_context.md` for updates):**
- OrientationAgent: 56.2% accuracy - lowest performer, needs compound direction logic (Nord-øst, Syd-vest)
- Visual few-shot references limited to original 8 test cases - may need expansion for better generalization
- Kitchen layout classification still challenging (46.7% accuracy with visual examples)
 
---
 
## 📚 SECTION 2: TECHNICAL REFERENCE
 
**NOTE:** For complete architecture, API documentation, and code examples, see [README.md](README.md) as the authoritative source. This section provides Claude-specific technical notes and implementation details.
 
---
 
## Project Overview
 
Hybel House Plan Analysis System - An AI-powered solution for automatically extracting structured metadata from Danish architectural house plan PDFs. The system uses GPT-4 Vision (via Azure OpenAI) to analyze drawings and extract key features like square meters, room counts, roof types, floor plan layouts, and interior features.
 
**Tech Stack:**
- **AI/ML**: Pydantic AI + Azure OpenAI GPT-4 Vision (gpt-4o) + Azure Document Intelligence OCR
- **Database**: PostgreSQL with pgvector extension (3072-dim embeddings)
- **Backend**: Python 3.13+, FastAPI, SQLAlchemy ORM
- **Integration**: Microsoft SharePoint Online (via Graph API) - **ALREADY WORKING**
- **Frontend**: React (separate repo)
 
## Architecture
 
**For complete architecture details, see [README.md](README.md).**
 
### Core Components
 
1. **FastAPI REST API** (`src/hybel/api.py`)
   - RESTful API serving property data to frontend
   - Main endpoints: `/api/properties`, `/api/properties/{case_number}/image|pdf`, `/api/stats`
   - CORS enabled, port 8000
 
2. **SharePoint Integration** (`src/hybel/sharepoint_integration.py`)
   - **ALREADY WORKING** - Microsoft Graph API integration
   - Searches `AFLEV_2024`, `AFLEV_2025`, `ORDRE EGEN` directories
   - Downloads Skitse PDFs from `03_Tegninger/00_Salgsskitse` folders
   - Fetches metadata: byggerådgiver (2-step lookup), varmekilde, modtaget_byggetilladelse
 
3. **3-Agent System** (`src/hybel/agent.py`) - **Pipeline 2.0**
   - **FacadeAgent**: Analyzes Page 1 (elevations) → 6 facade fields (83.8% accuracy)
   - **OrientationAgent**: Analyzes Page 2-3 (site plan) → 2 orientation fields (56.2% accuracy, self-consistency voting)
   - **FloorPlanAgent**: Analyzes Page 3 (floor plan) → 30+ fields (86.9% accuracy, RAG + visual few-shot)
   - Pydantic AI with gpt-4o via Azure OpenAI
   - Danish-language prompts with learned hustype classifications
   - **Visual Few-Shot Learning**: Uses reference images (`data/reference_images/`) for planløsning classification
 
4. **Database** (`src/hybel/database.py`)
   - PostgreSQL with pgvector extension
   - `house_plans` table: Metadata + 3072-dim embeddings (text-embedding-3-large)
   - `plan_corrections` table: User corrections for RAG
   - Environment separation: `environment` column (development/production/staging)
 
5. **RAG System** (`src/hybel/rag_system.py`)
   - Self-improvement via past corrections
   - Vector similarity search for relevant examples
   - Error classification and context-aware learning
   - Similarity threshold: 0.70 minimum
 
6. **Pipeline** (`src/hybel/pipeline.py`)
   - Orchestrates: PDF → Images → Extraction → Validation → DB → Embeddings → Thumbnails
   - **3-Agent Orchestration** (Pipeline 2.0): Parallel execution
   - Strict validation: 5%/10m² tolerance, "Skitse" keyword requirement
   - Batch processing with concurrency control
 
7. **Azure AI Foundry Agent Chat** (`src/hybel/foundry_agent_client.py`) - **NEW: Nov 20, 2025**
   - **Conversational property search** with thread-based conversation memory
   - Agent configured in Azure AI Foundry Portal (one-time setup)
   - Thread management: Automatic refinement (100 → 45 → 23 properties)
   - Session persistence via sessionStorage (survives page refresh)
   - Tools: search_properties (initial), refine_properties (conversational)
   - Handles 95%+ of complex CSV queries (vs 40% regex coverage)
   - Cost: $0.003/query + $0.01/thread/day (GPT-4o-mini)
 
**For all 15 components, see [README.md#core-components](README.md#core-components).**
 
### Data Flow
 
```
SharePoint Online (Projekter list + Data drive)
    ↓
SharePointClient fetches cases with valid Skitse PDFs
    ↓
Pipeline downloads PDF + metadata
    ↓
PDF Processor converts to images
    ↓
PyMuPDF Text Extractor reads embedded text (line-based, 100% room accuracy)
    ↓
GPT-4 Vision Agent extracts metadata (RAG-enhanced, with OCR text guidance)
    ↓
OCR Cross-Validator compares Vision vs OCR (detects hallucinations)
    ↓
Strict Validation (5%/10m² tolerance, "Skitse" keyword check)
    ↓
Database saves HousePlan + SharePoint URLs + OCR validation scores
    ↓
Embedding Generator creates vector for similarity search
    ↓
Thumbnail Generator creates floor plan preview
    ↓
FastAPI serves data to frontend via REST endpoints
    ↓
Frontend displays properties (React dashboard)
```
 
## Key Commands
 
### Setup
 
```bash
# Install dependencies
pip install -r requirements.txt
 
# Note: pdf2image requires poppler-utils
# Windows: Download from https://github.com/oschwartz10612/poppler-windows/releases/
# Linux: sudo apt-get install poppler-utils
# macOS: brew install poppler
 
# Create .env file from example
cp config/.env.example config/.env
# Then edit config/.env with your API keys
 
# Initialize database
python -m hybel.database
```
 
### Development
 
```bash
# Start FastAPI server
python -m hybel.api
# Or use the start script:
python start_api.py
 
# Process PDFs from SharePoint
python scripts/load_sharepoint_properties.py
 
# Generate thumbnails for existing properties
python scripts/generate_thumbnails.py
 
# Run validation against ground truth
python scripts/run_validation_batch.py
```
 
### Testing
 
```bash
# Run pytest suite
pytest
 
# Test SharePoint connection
python scripts/validate_sharepoint_cases.py
```
 
## API Endpoints
 
**For complete API documentation, see [README.md#api-endpoints](README.md#api-endpoints).**
 
### GET /api/properties
List all properties with optional filtering.
 
**Query Parameters:**
- `limit` (int, default 100): Maximum results to return
- `offset` (int, default 0): Pagination offset
- `planloesning` (str): Filter by layout type
- `tagkonstruktion` (str): Filter by roof type
- `min_size` (float): Minimum property size in m²
- `max_size` (float): Maximum property size in m²
- `environment` (str): Filter by environment (default: 'production')
 
**Response:** Array of Property objects
 
### GET /api/properties/{case_number}
Get single property by case number.
 
### GET /api/properties/{case_number}/image
Get floor plan thumbnail (JPEG).
 
### GET /api/properties/{case_number}/pdf
Download full PDF.
 
### GET /api/stats
Database statistics.
 
### GET /health
Health check endpoint.
 
## Important Implementation Details
 
**For complete implementation details, see [README.md#important-implementation-details](README.md#important-implementation-details).**
 
### SharePoint Integration
 
**Status: ALREADY WORKING**
 
The SharePoint integration is fully functional and actively fetches data from:
- Projekter list (case metadata including byggerådgiver, varmekilde, modtaget_byggetilladelse)
- Data drive (PDF files in `03_Tegninger/00_Salgsskitse` folders)
 
To add properties from SharePoint:
```bash
python scripts/load_sharepoint_properties.py
```
 
### PDF Page Structure
Danish house plans (Hybel) typically follow this structure:
- **Page 1**: Forside (cover/title page) + Facader (elevations)
- **Page 2**: Situationsplan (site plan) - has compass, garage/carport, property boundaries
- **Page 3**: Plantegning (floor plan) - room layouts, dimensions, features
- **Page 4-5**: Additional facader (elevations) - roof type, facade details, sun studies
 
**Pipeline 2.0** analyzes pages separately with specialized agents.
 
### Field Extraction Logic
 
**Planløsning** (floor plan type - EXACT SharePoint types):
- Længehus: Linear rectangular
- Forskudt længehus: Offset linear
- Vinkelhus: L-shaped
- Forskudt vinkelhus: Offset L-shaped
- Knækhus: Angled/broken
- Dobbelt knækhus: Double angled
- H-hus: H-shaped
- Arkitekttegnet hus: Architect-designed/unique
 
**Pipeline 2.0 uses visual few-shot learning** with reference images for each house type.
 
**Tagkonstruktion** (roof type):
- Saddeltag: Gabled roof (two slopes meeting at ridge)
- Boks: Flat roof with parapet/box style
- Ensidig: Single-pitch/shed roof
 
**Orientation** (TWO fields):
- `orientering_udsigt`: Directions where living room/kitchen windows face (e.g., "Syd, Øst")
- `orientering_indkoersel`: Driveway access direction from compass on site plan
 
### Validation Rules
 
**Strict PDF Validation** (prevents junk data):
1. Filename MUST contain "Skitse" or "Skitseforslag"
2. Extracted size MUST be > 0
3. If SharePoint size available: Must match within 5% OR 10m² (whichever is smaller)
 
**Accuracy Validation**:
- Overall accuracy: ~84.6% (Pipeline 2.0)
- Size fields: 5%/10m² tolerance
- Boolean fields: Exact match
- Choice fields: Exact string match
 
### Database Schema
 
**For complete database schema, see [README.md#database-schema](README.md#database-schema).**
 
See `src/hybel/database.py` for complete schema. Key tables:
 
**house_plans**:
- Primary key: `sagsnummer`
- 40+ metadata fields
- `embedding` (vector 3072): For similarity search (text-embedding-3-large)
- `thumbnail_path`, `thumbnail_blob_url`: Cached thumbnails
- `sharepoint_folder_url`, `sharepoint_pdf_url`, `pdf_blob_url`: SharePoint and Blob Storage URLs
- `byggeraadgiver`, `varmekilde`, `modtaget_byggetilladelse`: SharePoint metadata
- `environment`: Environment tag (development/production/staging)
- **OCR validation columns**: `ocr_agreement_score`, `low_confidence_fields`, `needs_review`
 
**plan_corrections**:
- Tracks user corrections for RAG system
- `correction_embedding` (vector 3072): For similarity search
- `correction_context` (JSON): Metadata about the correction
 
## Common Development Tasks
 
**For complete code examples, see [README.md#common-development-tasks](README.md#common-development-tasks).**
 
### Add Properties from SharePoint
 
```bash
# Fetch recent cases with valid PDFs
python scripts/load_sharepoint_properties.py
```
 
### Start the API Server
 
```bash
# Development mode (auto-reload)
python start_api.py
 
# API docs: http://localhost:8000/docs
```
 
### Process a Single PDF
 
```python
from hybel.pipeline import create_pipeline
import asyncio
 
async def process():
    pipeline = create_pipeline()
    result = await pipeline.process_pdf(
        'path/to/pdf.pdf',
        save_to_db=True,
        strict_validation=True,
        environment='development'
    )
    print(f"Processed: {result.metadata.sagsnummer}")
 
asyncio.run(process())
```
 
### Apply Manual Correction (RAG System)
 
```python
from hybel.rag_system import create_rag_system
 
rag = create_rag_system()
 
# Save correction with embedding for future learning
rag.save_correction_with_embedding(
    sagsnummer="237030",
    field_name="planloesning",
    original_value="Vinkelhus",
    corrected_value="Forskudt vinkelhus",
    corrected_by="admin@hybel.dk",
    notes="Clearly has offset wings visible in floor plan"
)
 
# Future extractions will learn from this correction
```
 
## File Organization
 
**For complete project structure, see [README.md#project-structure](README.md#project-structure).**
 
```
hybel/
├── src/hybel/              # Main package
│   ├── api.py              # FastAPI REST API
│   ├── agent.py            # GPT-4 Vision agents (Pipeline 2.0: 3-agent architecture)
│   ├── pipeline.py         # Processing pipeline
│   ├── sharepoint_integration.py  # SharePoint client (Microsoft Graph API)
│   ├── database.py         # PostgreSQL + pgvector
│   ├── rag_system.py       # Self-improvement system
│   ├── models.py           # Pydantic schemas
│   └── ...
├── scripts/                # Utility scripts
├── tests/                  # Test suite
├── config/                 # Configuration files
├── data/                   # Data files
│   ├── thumbnails/         # Generated thumbnails
│   ├── hustype_learned.json  # Learned classifications
│   └── reference_images/   # Visual few-shot reference images
├── migrations/             # Database migrations
├── docs/                   # Documentation
├── .claude/                # Claude Code configuration
│   ├── project_context.md  # Current state (READ FIRST for Claude)
│   └── agent_dispatch_guide.md  # Task tool patterns
├── PRPs/                   # Problem-Requirement-Plan documents (detailed feature specs)
├── future_features/        # Feature ideas and research
├── README.md               # Complete project documentation (AUTHORITATIVE)
├── CHANGELOG.md            # Detailed history of fixes and learnings
├── CLAUDE.md               # This file - Claude Code development guide
├── DEPLOYMENT.md           # Azure deployment guide
└── PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md  # Pipeline 2.0 implementation
```
 
## Feature Planning & Documentation Structure
 
The Hybel project uses a two-tier approach for feature planning and documentation:
 
### PRPs/ Directory - Problem-Requirement-Plan Documents
 
**Purpose**: Detailed, structured implementation plans for approved features ready for development.
 
**Structure**: Each PRP follows a standardized format:
- **Goal**: What we're building and why
- **Why**: Business justification and user value
- **What**: Detailed requirements and acceptance criteria
- **Context**: Technical background, constraints, dependencies
- **Blueprint**: Step-by-step implementation guide with pseudocode
- **Validation**: Test cases, edge cases, success criteria
 
**When to Create a PRP**:
- Feature has been approved for implementation
- Requirements are well-defined and stable
- Implementation approach is clear
- Ready to start coding
 
**Example**: `PRPs/orientation_udsigt_filtering.md` (23KB) - Comprehensive guide for orientation filtering feature with detailed pseudocode, validation steps, and test cases.
 
**Creating PRPs**: Use `.claude/commands/generate-prp.md` command to create a new PRP from a template.
 
### future_features/ Directory - Feature Ideas & Research
 
**Purpose**: Lightweight documentation for proposed features, research, and ideas still under consideration.
 
**Content**: Brief descriptions, sketches, research notes, architectural proposals.
 
**When to Use**:
- Early-stage feature ideas
- Research and exploration
- Architectural proposals not yet approved
- Long-term roadmap items
 
**Examples**:
- `chat-function.md` - Brief idea for chat functionality
- `facade_udtryk.md` - Research on facade expression classification
- `split_extraction_architecture.md` (39KB) - Detailed architectural research for facade/floor plan split extraction
 
### Documentation Hierarchy
 
```
Idea → future_features/ → PRP (PRPs/) → Implementation → CHANGELOG.md
```
 
1. **Idea Stage**: Create brief doc in `future_features/`
2. **Planning Stage**: Create detailed PRP in `PRPs/` when ready for implementation
3. **Implementation**: Follow PRP blueprint, document progress
4. **Completion**: Document learnings and outcomes in `CHANGELOG.md`
 
### Best Practices
 
- **Keep future_features/ lightweight**: 1-2 pages max, focus on "what" and "why"
- **Make PRPs comprehensive**: Include pseudocode, validation, edge cases
- **Update PRPs during implementation**: Add learnings, adjust plan as needed
- **Archive completed PRPs**: Move to `docs/archive/` or reference in CHANGELOG.md
- **Cross-reference**: Link PRPs to related future_features docs for context
 
## Environment Variables
 
**For complete environment variables documentation, see [README.md#environment-variables](README.md#environment-variables).**
 
Required in `config/.env`:
```bash
# Azure OpenAI (Primary)
AZURE_OPENAI_ENDPOINT= https://your-resource.openai.azure.com/
AZURE_OPENAI_API_KEY=your_api_key_here
AZURE_OPENAI_API_VERSION=2024-10-21
AZURE_OPENAI_DEPLOYMENT_GPT4O=gpt4o-deployment
AZURE_OPENAI_DEPLOYMENT_GPT4O_MINI=gpt4o-mini-deployment
AZURE_OPENAI_DEPLOYMENT_EMBEDDINGS_LARGE=embeddings-deployment
 
# Database
DATABASE_URL=postgresql://user:pass@host:port/dbname
 
# SharePoint
AZURE_TENANT_ID=...
AZURE_CLIENT_ID=...
AZURE_CLIENT_SECRET=...
 
# Azure Blob Storage
AZURE_STORAGE_CONNECTION_STRING=DefaultEndpointsProtocol=https;AccountName=...
```
 
## API Usage & Costs
 
**GPT-4 Vision (gpt-4o via Azure OpenAI)**:
- ~$0.02-0.06 per PDF (depends on page count, 3 agents parallel)
- Initial batch of 432 plans: ~$8-26
- Ongoing: 2-10 plans/month = negligible
 
**Embeddings (text-embedding-3-large)**:
- ~$0.00004 per plan (very cheap, 3072-dim vectors)
- 432 plans: ~$0.02
 
**Total monthly estimate**: $2-10 for 100 properties
 
## Troubleshooting
 
**For complete troubleshooting guide, see [README.md#troubleshooting](README.md#troubleshooting).**
 
**pdf2image not working**:
- Ensure poppler-utils is installed and in PATH
- Windows: Download from https://github.com/oschwartz10612/poppler-windows/releases/
 
**Database connection errors**:
- Check DATABASE_URL format: `postgresql://user:pass@host:port/dbname`
- Ensure PostgreSQL server is running
- Verify pgvector extension is installed: `CREATE EXTENSION IF NOT EXISTS vector;`
 
**SharePoint authentication errors**:
- Verify Azure AD credentials in `.env`
- Check tenant ID, client ID, and client secret
- Ensure app has Microsoft Graph API permissions
 
**Low extraction accuracy**:
- Check `.claude/project_context.md` for current accuracy metrics and known issues
- Review RAG system corrections
- Check `CHANGELOG.md` for known accuracy issues and fixes
 
**API not serving thumbnails**:
- Run `python scripts/generate_thumbnails.py` to generate missing thumbnails
- Check `data/thumbnails/` directory exists and has write permissions
 
**Deployment issues**:
- See `DEPLOYMENT.md` for complete Azure deployment guide and troubleshooting
 
---
 
## 📖 Additional Resources
 
- **README.md** - Complete project documentation (AUTHORITATIVE SOURCE)
- **CHANGELOG.md** - Detailed history with 27 entries (Nov 5-17, 2025)
- **.claude/project_context.md** - Current state and metrics
- **DEPLOYMENT.md** - Azure deployment instructions
- **PIPELINE_2.0_VISUAL_FEW_SHOT_ARCHITECTURE.md** - Complete Pipeline 2.0 guide
- **docs/correction_system_guide.md** - Excel-based correction system
# Education Domain

This bounded context manages educational content, learning paths, progress tracking, and gamification for options trading education.

## Domain Concepts

### Aggregates
- **Course** - Structured learning path with modules and assessments
- **Tutorial** - Interactive lesson with examples and exercises
- **Quiz** - Assessment with questions, answers, and scoring
- **LearnerProgress** - Individual progress tracking and achievements

### Value Objects
- **Badge** - Achievement earned through learning milestones
- **Competency** - Skill level in specific trading concepts
- **LearningPath** - Recommended sequence of educational content
- **Question** - Quiz question with multiple choice or scenario-based answers

### Domain Services
- **ProgressCalculator** - Tracks learning advancement and competency
- **BadgeAwarder** - Manages achievement recognition
- **ContentRecommender** - Suggests relevant educational materials

### Domain Events
- **LessonCompleted** - Student finished a tutorial or module
- **BadgeEarned** - Achievement milestone reached
- **QuizPassed** / **QuizFailed** - Assessment results
- **ProgressMilestoneReached** - Significant learning advancement
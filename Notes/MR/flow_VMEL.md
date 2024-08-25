# PV Eylea 2mg pathway

version 0.1

Date: 2024-08-02



# Markdown Rendering Test

Normal text

**Bold text**

*Italic text*

`Inline code`

```
Code block
```

<div style="background-color: yellow; color: black; padding: 10px;">
This is a yellow box with black text.
</div>

<span style="background-color: white; color: black;">This text should have a white background and black color.</span>

![Test Image](https://via.placeholder.com/150)

---

> This is a blockquote

1. Numbered list item 1
2. Numbered list item 2

- Bullet point 1
- Bullet point 2

| Column 1 | Column 2 |
|----------|----------|
| Cell 1   | Cell 2   |

```mermaid
   %%{init: {'theme': 'default'}}%%

graph TD
    Start[Diagnosis] --> Week0[Week 00: Treatment]
    Week0 --> Week4[Week 4: Treatment]
    Week4 --> Week8[Week 8: Treatment + OCT Scan]
    Week8 --> VirtualReview{Virtual Review}
    
    VirtualReview -->|Continue| Week16[Week 16: Treatment + Scan]
    VirtualReview -->|Stop| End[End Treatment]
    VirtualReview -->|Switch| SwitchTreatment[Switch to Another Treatment]
    
    Week16 --> Week16Review{Review}
    Week16Review -->|Dry| Extend10Weeks[Extend to 10 Weeks]
    Week16Review -->|Responding but not perfect| Continue8Weeks[Continue 8 Weeks]
    Week16Review -->|Worse| ReconsiderSwitch[Reconsider Switching]
    
    Extend10Weeks --> NextVisit[Next Visit]
    Continue8Weeks --> NextVisit
    
    NextVisit --> VisitReview{Review}
    VisitReview -->|Dry and Vision OK| ExtendInterval[Extend Interval by 2 Weeks]
    VisitReview -->|Not Dry or Vision Not OK| AdjustTreatment[Adjust Treatment]
    
    ExtendInterval --> IntervalCheck{Interval = 16 Weeks?}
    IntervalCheck -->|No| NextVisit
    IntervalCheck -->|Yes| Check16WeekStability
    
    Check16WeekStability{3 Consecutive 16-Week Visits?}
    Check16WeekStability -->|No| NextVisit
    Check16WeekStability -->|Yes| FinalDecision{Final Decision}
    
    FinalDecision -->|Continue at 16 Weeks| ContinueIndefinitely[Continue at 16 Weeks Indefinitely]
    FinalDecision -->|Stop, with Monitoring| StopWithMonitoring[Stop Treatment, Continue Monitoring]
    
    ContinueIndefinitely --> NextVisit
    
    classDef decision fill:#f9f,stroke:#333,stroke-width:2px;
    class VirtualReview,Week16Review,VisitReview,IntervalCheck,Check16WeekStability,FinalDecision decision;
```
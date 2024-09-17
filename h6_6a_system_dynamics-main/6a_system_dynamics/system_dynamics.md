# Using Insight Maker to create a simple system dynamics model

## Causal loop diagrams

A way to map influences with _direction_ and _polarity_ of influences

```mermaid

graph TD
    Coffee-->A{Grumpy}
    Insomnia-->A{Grumpy}
    Tired-->A{Grumpy}
    Tired-->Coffee
    Coffee-->Insomnia;
    Insomnia-->Tired
```


```mermaid

graph LR
    A --(+)-->B
```

Quantitive system dynamics models are built on the foundation of causal loop diagrams

## Stock and flow diagrams

```mermaid
graph TD
    A[Stock] -->|Flow| B[Stock]
```

However SD models don't look at discrete events, but rather continuous changes over time. Better for flow (like water) rather than events. 

## Building a simple model

Look at the following model:

```mermaid
graph TD
    A[Stock] -->|Flow| B[Stock]
    B -->|Flow| C[Stock]
``` 

What about eggs taking 3 weeks to hatch - in SD world each week 1/3 of the egg would hatch.



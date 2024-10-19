# Scheme of work

## Developing a Flexible Simulation Model for Optimising Anti-VEGF Treatment Strategies in Ophthalmology

### Problem Statement: Wet macular degeneration and diabetic maculopathy are effectively treated with anti-VEGF drugs injected in the eye. However, the treatment landscape is complex:

- Frequent injections required (every 1-4 months)
- Multiple treatment options with varying durations, costs, and monitoring requirements
- Diverse treatment strategies (e.g., fixed interval vs. treat-and-extend)
- Treatment and monitoring consume a lot of resource: this is not just a financial issue as some trusts are simply unable to recruit staff to do these jobs.
- The drugs are expensive: best estimate I can find is in excess of £1 billion (NHS England, combined 2015-18 data).
- Staffing costs are probably around £200-300 million on the same basis
- Between AMD and diabetic maculopathy, anti-VEGF costs represent around 20% of the ophthalmology spend each year, about four times more than the budget for cataract surgery.

The complexity makes it challenging to determine the most effective and efficient treatment approach, balancing clinical outcomes, costs, and resources; the cost makes it important.

### Project Aim: To develop a comprehensive, flexible simulation model that enables comparison and optimisation of various anti-VEGF treatment strategies

This model will:

- Assess clinical effectiveness of different approaches
- Analyse associated costs
- Predict personnel and resource requirements
- Adapt to incorporate new drugs and treatment paradigms as they emerge

### Methodology

#### Dual Modeling Approach

- Develop proof-of-concept models using both Mesa (agent-based) and SimPy (process-based) frameworks 
(in process at the moment)
- Compare frameworks for ease of use, explanatory power, and adaptability
- Select the most appropriate framework for full-scale model development

#### Data Collection:

- Negotiate with EPR supplier for improved data access

I have asked for a meeting with Medisight to discuss this - 29th October all day is my offer. 

As a backup I am actively exploring using the EPR database directly for quewrying, but this will take time.

- Supplement with published literature data
- Engage with clinicians for expert input on treatment patterns and outcomes

#### Model Development

- Implement modular design for easy addition/removal of features
- Incorporate key variables: drug efficacy, treatment intervals, patient adherence, clinic capacity
- Develop separate modules for clinical outcomes, cost analysis, and resources

#### Validation

- Compare model outputs with real-world data from literature and local clinics
- Conduct sensitivity analyses to identify key influencing factors
- Engage expert clinicians to review model assumptions and outputs

#### User Interface and Visualisation

- Develop interactive dashboard for stakeholders to explore different scenarios
- Create clear, intuitive visualisations of model outcomes
- Design user-friendly interface for inputting new drug parameters or treatment strategies

#### Challenges and Mitigation Strategies

##### Data Access

- Establish data sharing agreement with EPR supplier
- Explore alternative data sources (e.g., national registries, clinical trial data)

##### Model Complexity:

- Iterative development process, starting with core functionalities
- Review and refine model with stakeholder input

##### Stakeholder Engagement:

- Form advisory group including clinicians, administrators, and patient representatives
- Conduct regular workshops to gather feedback and refine model

##### Ethical Considerations:

- Explicitly model trade-offs between cost-effectiveness and patient outcomes
- Include quality of life measures in outcome assessments

##### Implementation and Impact:

- Develop case studies demonstrating potential real-world applications
- Create implementation toolkit for adopting model recommendations

##### Expected Outcomes:

A validated, flexible simulation model for anti-VEGF treatment optimisation
Improved understanding of the impact of different treatment strategies on clinical outcomes, costs, and resources
Tool for rapid assessment of new drugs or treatment approaches as they emerge
Framework for data-driven decision making in ophthalmology clinic management
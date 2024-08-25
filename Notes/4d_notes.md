# Decision trees

First get the environment set up:

```bash
cd ../environment
conda env create -f environment.yml
```
From requirements.txt:

```text
catboost==1.2.5
numpy==1.26.1
pandas==2.1.4
matplotlib==3.8.0
ipykernel==6.29.4
requests==2.31.0
scikit-learn==1.4.2
routingpy==1.3.0
openpyxl==3.1.3
xlrd==2.0.1
plotly==5.22.0
xgboost==2.0.3
lightgbm==4.3.0
nbformat>=4.2.0
seaborn==0.12.2
shap==0.44.1
lime==0.2.0.1
optuna==3.5.0
ydata-profiling==4.7.0
ipywidgets==8.1.3
```


## There is a problem with environments.yml for mac: 
 ninja: error: '/opt/homebrew/opt/libomp/lib/libomp.dylib', needed by '/private/var/folders/cf/hfdshtps1bzbtzd3txx2ybmr0000gn/T/pip-install-jojlg4z7/lightgbm_6cb6ae8464a540779c89cd569e0f4d82/lib_lightgbm.so', missing and no known rule to make it

 From github:

 ```
 LightGBM expects by default to find OpenMP installed locally, and to be able to dynamically link to it. It appears from this line that you don't have it installed.

ninja: error: '/opt/homebrew/opt/libomp/lib/libomp.dylib', needed by '/private/var/folders/y4/jnpd1pl92r50hk6sfmrcq20c0000gn/T/pip-install-nj8eih_s/lightgbm_fbb81935721e47e2b01bf4ab5b7285c7/lib_lightgbm.so', missing and no known rule to make it
Since it appears from the logs you provided that you're on a Mac, you can install it like this:

brew install libomp
Alternatively, if you don't want to use OpenMP, you can install a version of lightgbm that does not use OpenMP. Training and prediction will be slower (as a result of not using multithreading), but you'll be able to build lightgbm.

If you absolutely have to stay on lightgbm v3.3.2, run the following

pip install 'pip<23.1'
pip install \
    --no-binary lightgbm \
    --install-option='--nomp' \
    'lightgbm==3.3.2'
The pip ceiling is because pip v23.1 removed support for --install-option: #5061 (comment).


 ```

 However because the first attempt partially installed have to remove it completely then reinstall:
    
     ```bash    
    conda env remove --name env_name
    conda env create -f environment.yml
    ```

it works!

Also might work by changing the version of lightgbm to 4.4.0 but I haven't tried that yet. 

## Summary

* Decision trees
* Random forests

Gradient boosted decision trees
* ADABoost
* Histogram-based gradient boosting trees
* XGBoost
* LightGBM
* CatBoost



### Decision Trees:
Decision trees are hierarchical models that make decisions based on asking a series of questions. They split the data into subsets based on feature values, creating a tree-like structure of decisions and outcomes.

### Random Forests:
Random forests are an ensemble learning method that constructs multiple decision trees and combines their outputs. Each tree is built using a random subset of data and features, which helps reduce overfitting and improves generalization.

###  Gradient Boosted Decision Trees:
This is a family of ensemble learning techniques that build decision trees sequentially, with each new tree correcting errors made by the previous ones. The main variants you mentioned are:

1. AdaBoost (Adaptive Boosting):
AdaBoost focuses on difficult-to-classify instances by adjusting the weight of misclassified samples after each iteration. It combines weak learners (often shallow decision trees) to create a strong classifier.

2. Histogram-based Gradient Boosting Trees:
This technique uses histograms to approximate the gradient statistics of the loss function. It can handle large datasets efficiently by binning continuous features into discrete bins.

3. XGBoost (Extreme Gradient Boosting):
XGBoost is an optimized implementation of gradient boosting that offers improved speed and performance. It includes regularization terms to prevent overfitting and can handle sparse data effectively.

4. LightGBM (Light Gradient Boosting Machine):
LightGBM uses a leaf-wise growth strategy instead of level-wise growth, which can lead to better accuracy with fewer splits. It's designed for efficiency, especially with large datasets.

5. CatBoost (Categorical Boosting):
CatBoost is particularly effective at handling categorical features. It uses a novel technique called Ordered Boosting to reduce prediction shift caused by target leakage in gradient boosting.


Comparing Random Forests to linear regression is an interesting exercise, as they are quite different approaches to predictive modeling. Let me break down the key differences:

1. Model Structure:
   - Linear Regression: Assumes a linear relationship between features and the target variable. It finds the best-fitting linear equation.
   - Random Forests: Can capture complex, non-linear relationships and interactions between features.

2. Interpretability:
   - Linear Regression: Highly interpretable. Each coefficient directly represents the impact of a feature on the target.
   - Random Forests: Less interpretable overall, though feature importance can be derived from the model.

3. Handling of Non-linear Relationships:
   - Linear Regression: Struggles with non-linear relationships unless explicitly modeled (e.g., polynomial terms).
   - Random Forests: Naturally handles non-linear relationships and complex interactions.

4. Outliers and Robustness:
   - Linear Regression: Sensitive to outliers, which can significantly impact the model.
   - Random Forests: Generally more robust to outliers due to its ensemble nature and the use of multiple decision trees.

5. Feature Selection:
   - Linear Regression: Doesn't perform feature selection inherently (though techniques like Lasso can be used).
   - Random Forests: Implicitly performs feature selection and can provide measures of feature importance.

6. Assumptions:
   - Linear Regression: Assumes linearity, independence of errors, homoscedasticity, and normality of residuals.
   - Random Forests: Makes fewer assumptions about the underlying data distribution.

7. Extrapolation:
   - Linear Regression: Can extrapolate beyond the range of training data (though caution is needed).
   - Random Forests: Generally poor at extrapolating beyond the range of training data.

8. Computational Complexity:
   - Linear Regression: Generally faster to train and make predictions, especially for large datasets.
   - Random Forests: Can be more computationally intensive, especially during training.

9. Handling of Categorical Variables:
   - Linear Regression: Requires encoding of categorical variables (e.g., one-hot encoding).
   - Random Forests: Can handle categorical variables without explicit encoding in many implementations.

10. Ensemble Nature:
    - Linear Regression: A single model.
    - Random Forests: An ensemble of many decision trees, which often leads to better generalization.

In practice, the choice between Linear Regression and Random Forests (or other models) depends on the specific problem, dataset characteristics, interpretability requirements, and performance metrics. Linear regression is often a good starting point for its simplicity and interpretability, while Random Forests can capture more complex patterns but at the cost of some interpretability and potentially increased computational requirements.

## Revision of true and false positive etc..

| Term | Definition |
|------|------------|
| True Positive (TP) | The number of correct positive predictions (correctly identified) |
| True Negative (TN) | The number of correct negative predictions (correctly rejected) |
| False Positive (FP) | The number of incorrect positive predictions (Type I error) |
| False Negative (FN) | The number of incorrect negative predictions (Type II error) |
| Accuracy | (TP + TN) / (TP + TN + FP + FN). The proportion of correct predictions among the total number of cases examined |
| Precision | TP / (TP + FP). The proportion of positive identifications that were actually correct |
| Recall (Sensitivity) | TP / (TP + FN). The proportion of actual positives that were identified correctly |
| Specificity | TN / (TN + FP). The proportion of actual negatives that were identified correctly |
| F1 Score | 2 * (Precision * Recall) / (Precision + Recall). The harmonic mean of precision and recall |
| False Positive Rate | FP / (FP + TN). The proportion of negative cases that were incorrectly classified as positive |
| False Negative Rate | FN / (TP + FN). The proportion of positive cases that were incorrectly classified as negative |

## Benefits of decision trees
Very easy for stakeholders to understand (white-box model)
This can make it easier to build trust in the models


Handles categorical and numeric data
Categorical data doesn’t require one-hot encoding*


Can deal with non-linear relationships


Can capture interactions between features 


Doesn’t require normalisation of the data (scale invariant)


Not strongly affected by outliers


Handles missing values

## Disadvantages of decision trees
Very prone to overfitting (high variance)


Small changes in training data can lead to big changes in trees
High variance

## Bias and variance

High bias means a model hasn’t captured the true relationships in the data very well
It’s too simple 
It has underfitted to the data

High variance means the model has captured noise in the training data rather than the true relationships 
It has overfitted 
It might do a good job on the training data but a poor job on new, unseen data

Balancing bias and variance is crucial to creating good machine learning models that capture patterns while generalising well to unseen data

Decision Trees tend to have high variance

They are prone to capturing noise and not generalising well

# Diagnostic Testing Diagram

| | **Predicted Positive (PP)** | **Predicted Negative (PN)** |
|--------------------------|---------------------------|---------------------------|
| **Actual Positive (P)** | **True Positive (TP)**, hit | **False Negative (FN)**, miss, underestimation |
| | True Positive Rate (TPR), recall, sensitivity (SEN), probability of detection, hit rate, power <br> $TPR = \frac{TP}{P} = 1 - FNR$ | False Negative Rate (FNR), miss rate, type II error <br> $FNR = \frac{FN}{P} = 1 - TPR$ |
| **Actual Negative (N)** | **False Positive (FP)**, false alarm, overestimation | **True Negative (TN)**, correct rejection |
| | False Positive Rate (FPR), probability of false alarm, fall-out, type I error <br> $FPR = \frac{FP}{N} = 1 - TNR$ | True Negative Rate (TNR), specificity (SPC), selectivity <br> $TNR = \frac{TN}{N} = 1 - FPR$ |

## Derived Metrics

- Total population = P + N
- Prevalence = $\frac{P}{P + N}$
- Accuracy (ACC) = $\frac{TP + TN}{P + N}$
- Positive Predictive Value (PPV), precision = $\frac{TP}{PP} = 1 - FDR$
- Negative Predictive Value (NPV) = $\frac{TN}{PN} = 1 - FOR$
- False Discovery Rate (FDR) = $\frac{FP}{PP} = 1 - PPV$
- False Omission Rate (FOR) = $\frac{FN}{PN} = 1 - NPV$
- Positive Likelihood Ratio (LR+) = $\frac{TPR}{FPR}$
- Negative Likelihood Ratio (LR-) = $\frac{FNR}{TNR}$
- Informedness, Bookmaker Informedness (BM) = TPR + TNR - 1
- Markedness (MK), deltaP (Δp) = PPV + NPV - 1
- Balanced Accuracy (BA) = $\frac{TPR + TNR}{2}$
- F1 score = $\frac{2 \cdot PPV \cdot TPR}{PPV + TPR} = \frac{2TP}{2TP + FP + FN}$
- Fowlkes–Mallows index (FM) = $\sqrt{PPV \cdot TPR}$
- Matthews Correlation Coefficient (MCC):
  $$MCC = \sqrt{TPR \cdot TNR \cdot PPV \cdot NPV} - \sqrt{FNR \cdot FPR \cdot FOR \cdot FDR}$$
- Threat Score (TS), Critical Success Index (CSI), Jaccard index = $\frac{TP}{TP + FN + FP}$
- Diagnostic Odds Ratio (DOR) = $\frac{LR+}{LR-}$
- Prevalence Threshold (PT):
  $$PT = \frac{\sqrt{TPR \cdot FPR} - FPR}{TPR - FPR}$$

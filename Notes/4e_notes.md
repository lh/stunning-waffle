 # Various models pros and cons
  
  
  |type| import | model = | notes | cautions|
   |--|--|--|--|--|
 |Logistic Regression | from sklearn.linear_model import LogisticRegression | model = LogisticRegression() | Good baseline model | Don’t forget to standardise or scale your data! |
Decision Trees | from sklearn.tree import DecisionTreeClassifier | model = DecisionTreeClassifier() | Interpretable, but prone to overfitting | |
Random Forest | from sklearn.ensemble import RandomForestClassifier | model = RandomForestClassifier() | Less interpretable, but a bit less prone to overfitting | |
XGBoost | from xgboost.sklearn import XGBClassifier | model = XGBClassifier() | Powerful - used commonly in industry and a good one to try.  | Not interpretable without the help of SHAP or LIME.|
AdaBoost |from sklearn.ensemble import AdaBoostClassifier | model = AdaBoostClassifier() | Older model - not used much now (Other boosting algorithms tend to work better). Same problems as XGBoost with interpretability. | |
CatBoost | from catboost import CatBoostClassifier | model = CatBoostClassifier() | Great for data with lots of categorical features. Same problems as XGBoost with interpretability. | |
LightGBM | from lightgbm import LGBMClassifier | model = LGBMClassifier() | Another powerful option! Same problems as XGBoost with interpretability. | |
Histogram Gradient Boosting | from sklearn.ensemble import HistGradientBoostingClassifier | model = HistGradientBoostingClassifier() | Another powerful option! Same problems as XGBoost with interpretability. | |

Note: most of the above ahve a regression version too. 

## One hot encoding

One hot encoding is a way to turn categorical data into numerical data. It works by creating a new column for each category in a categorical variable and assigning a 1 or 0 to the column.

For example, if we had a column called `colour` with the categories `red`, `blue` and `green`, one hot encoding would turn this into three columns: `colour_red`, `colour_blue` and `colour_green`. If a row was `red`, the `colour_red` column would be 1 and the other two would be 0.

One hot encoding is useful because many machine learning models can only handle numerical data. It is also useful because it does not assume an order to the categories (unlike label encoding).

Can do it with the pandas function `pd.get_dummies()`.
eg:
```python
import pandas as pd
data = pd.DataFrame({'colour': ['red', 'blue', 'green', 'red']})


```


# Mixed_Reaction_Model

---

# Sleep Study Project

## Overview

This project explores and analyzes the sleepstudy dataset using the linear mixed-effects model in R. The dataset, sourced from the lme4 library, records reaction times under different levels of sleep deprivation.

## Key Analyses

1. **Dataset Overview:**
   - The initial exploration includes a preview of the first six rows and a summary statistics overview using the `head()` and `summary()` functions.

2. **Missing Values:**
   - The `sapply` function is employed to detect and report missing values across each column, ensuring data quality.

3. **Data Visualization:**
   - A scatter plot visualizes the relationship between reaction time and days of sleep deprivation, providing an immediate insight into the dataset's patterns.

4. **Distribution Analysis:**
   - A histogram illustrates the distribution of reaction times, aiding in understanding the dataset's overall pattern and frequency.

5. **Linear Mixed-Effects Model:**
   - A linear mixed-effects model is fitted to the data, incorporating both fixed effects (Days of Sleep Deprivation) and a random effect (Subject).
   - Model summary includes information on standard deviation, fixed effects coefficients, and residual analysis.

6. **Model Interpretation:**
   - The standard deviation measures variability due to the random effect (Subject).
   - The fixed effect output indicates a positive relationship between reaction time and days of sleep deprivation.

7. **Residual Analysis:**
   - Residuals vs. Fitted Values plot is examined for homoscedasticity, revealing a constant spread among data points.

## Conclusion

The analysis provides a comprehensive understanding of the sleepstudy dataset, offering insights into its characteristics, relationships, and model performance. This README serves as a guide to the project structure and key findings.

---

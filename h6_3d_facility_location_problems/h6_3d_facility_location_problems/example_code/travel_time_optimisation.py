import pandas as pd
import geopandas
from itertools import combinations
import numpy as np
import matplotlib.pyplot as plt
import plotly.express as px
import contextily as cx
from datetime import datetime

class FacilityLocationObjective:
    '''
    Encapsulates logic for calculation of
    metrics in a simple facility location problem

    Demand and travel matrices must have a common column

    demand: pd.dataframe:  Two column dataframe. One column should be labels for the
    demand locations (e.g. LSOA identifiers, postcodes). Second column should contain
    demand figures of some kind (e.g. number of historical cases)
    If demand assumed to be equal, all values in this column could be 1.

    travel_matrix: pd.dataframe: dataframe with columns representing sites
    and rows representing locations demand will come from.
    One column should be labels for the demand locations (e.g. LSOA identifiers, postcodes).
    All other values will be either distance or time in float form.
    No additional columns of information must be included or they will be used as part of the
    calculation of the lowest-cost solution, which may lead to incorrect results.
    '''
    def __init__(self, demand, travel_matrix, merge_col, demand_col):
        '''
        Store the demand and travel times

        Args:
            demand: pd.DataFrame:

            travel_matrix: pd.DataFrame:
        '''
        self.demand = demand.set_index(merge_col)
        self.travel_matrix = travel_matrix.set_index(merge_col)
        self.demand_col = demand_col


    def evaluate_solution(self, site_list):
        '''
        Calculates the

        Args:
            site_list: list: column indices of solution to evaluate
                            (to apply to travel matrix)

            merge_col: str: name of shared column in demand df and travel time
                    df that contains labels for areas that can be merged on (e.g. "lsoa")

            n_patients_or_referrals_col: str: name of column containing numeric data
                                            (e.g. "n_patients", "referrals")

        Returns:
            Pandas dataframe to pass to evaluation functions

        '''

        active_facilities = self.travel_matrix.iloc[:, site_list].copy()

        # Assume travel to closest facility
        # Need to drop the column that contains
        active_facilities['min_cost'] = active_facilities.min(axis=1)


        # Merge demand and travel times into a single DataFrame
        problem = self.demand.merge(active_facilities,
                                    left_index=True, right_index=True,
                                    how='inner')

        return problem.reset_index()


    def generate_solution_metrics(self, site_list):
        '''
        Calculates the weighted average travel time for selected sites

        Args:
            site_list: list or np.array: A list of site IDs as a list or array (e.g. [0, 3, 4])
            merge_col: string: The column name to use for merging the data.
            n_patients_or_referrals_col: string: The column name to use for the number of patients or referrals.

        Returns:
            A tuple containing the problem and the maximum travel time.
        '''
        problem = self.evaluate_solution(site_list)

        # Return weighted average
        weighted_average = np.average(problem['min_cost'], weights=problem[self.demand_col])
        unweighted_average = np.average(problem['min_cost'])
        max_travel = np.max(problem['min_cost'])

        return {
            'site_indices': site_list,
            'site_names': ", ".join(self.travel_matrix.columns[site_list].tolist()),
            'weighted_average': weighted_average,
            'unweighted_average': unweighted_average,
            'max': max_travel,
            'problem_df': problem
        }
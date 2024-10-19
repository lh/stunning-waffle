import pandas as pd
import plotly.express as px
from itables import show

import os
team = os.environ.get('QUARTO_PARAM_TEAM', 'Waterdeep')

df = pd.read_csv("kpis_fantasy_land_mhs.csv")
df['date'] = pd.to_datetime(df['date'], format='%d/%m/%Y')

df_team = df[df["team"] == team]

most_recent_month_string = df_team['date'].max().strftime("%b %Y")

df_team_most_recent_month = df_team[df_team['date'] == df_team['date'].max()]

kpi_most_recent = df_team_most_recent_month.melt(id_vars=["team","date"])[['variable', 'value']]

kpi_most_recent = (kpi_most_recent
  .merge(
    pd.read_csv("kpi_details.csv"),
    left_on="variable",
    right_on="KPI")
  .drop(columns=["KPI"])
  )

kpi_most_recent["Formatted Value"] = (kpi_most_recent
  .apply(lambda x: f"{x.value*100:.1f}%" if x["Format"]=="Percentage" else f"{x.value:.1f}", axis=1)
  )

def get_kpi_value(kpi):
  return kpi_most_recent[kpi_most_recent['variable'] == kpi]['Formatted Value'].iloc[0]

def get_kpi_month(kpi):
  return f"Value for {most_recent_month_string}: {get_kpi_value(kpi)}"

def kpi_line_chart(kpi):
  if kpi_most_recent[kpi_most_recent["variable"] == kpi]["Direction"].iloc[0] != "No Direction":
    title=f"{kpi} ({kpi_most_recent[kpi_most_recent['variable'] == kpi]['Direction'].iloc[0]})"
  else:
    title = kpi

  fig = px.line(
    df_team, x="date", y=kpi,
    markers=True,
    title=title,
    labels={"date": "Date", kpi: "Value"}
    )

  if kpi_most_recent[kpi_most_recent["variable"] == kpi]["Format"].iloc[0] == "Percentage":
    fig.update_layout(
      yaxis = dict(
          tickformat='.1%'
      )
    )

  fig.add_hline(
    y=df_team[kpi].median(),
    line_dash="dot",
    annotation_text="18 Month Average (Median)",
    annotation_position="top left",
    line=dict(color="deeppink")
  )

  if kpi_most_recent[kpi_most_recent["variable"] == kpi]["Target"].iloc[0] > 0:
    fig.add_hline(
      y=kpi_most_recent[kpi_most_recent["variable"] == kpi]["Target"].iloc[0],
      line_dash="dot",
      annotation_text="Target",
      annotation_position="bottom right"
      )

  return fig

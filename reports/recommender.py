import pandas as pd

def load_recommender_engine():
    """Loads the fund data and prepares the risk grades based on Category."""
    try:
        # Load the scorecard (adjust path if running directly from terminal vs notebook)
        scorecard = pd.read_csv('../data/processed/fund_scorecard.csv')
    except FileNotFoundError:
        # Fallback path
        scorecard = pd.read_csv('data/processed/fund_scorecard.csv')

    # Build risk_grade using the 'category' column
    if 'risk_grade' not in scorecard.columns:
        def assign_risk(category):
            cat = str(category).upper()
            if 'DEBT' in cat or 'LIQUID' in cat:
                return 'Low'
            elif 'HYBRID' in cat or 'INDEX' in cat:
                return 'Moderate'
            else: 
                return 'High' # Standard Equity falls here

        scorecard['risk_grade'] = scorecard['category'].apply(assign_risk)

    return scorecard

def recommend_funds(risk_appetite, top_n=3):
    """
    Takes a risk appetite (Low/Moderate/High) and returns top funds.
    """
    scorecard = load_recommender_engine()

    # Standardize input
    risk_appetite = risk_appetite.capitalize()

    # Filter the dataset to match the user's risk profile
    match = scorecard[scorecard['risk_grade'] == risk_appetite]

    if match.empty:
        return f"Error: No funds found for risk appetite '{risk_appetite}'."

    # Sort by your calculated composite and sharpe scores (Highest is best)
    recommendations = match.sort_values(by=['composite_score', 'sharpe_score'], ascending=[False, False]).head(top_n)

    # Return a clean table with only the necessary info
    columns_to_show = ['scheme_name', 'category', 'risk_grade', '3yr_cagr_pct', 'sharpe_ratio', 'composite_score']
    return recommendations[columns_to_show]

# --- Test the Engine ---
if __name__ == "__main__":
    print("=== Bluestock Robo-Advisor ===")

    print("\n[ RECOMMENDING FOR CONSERVATIVE INVESTOR (LOW RISK) ]")
    print(recommend_funds('Low').to_string(index=False))

    print("\n[ RECOMMENDING FOR AGGRESSIVE INVESTOR (HIGH RISK) ]")
    print(recommend_funds('High').to_string(index=False))

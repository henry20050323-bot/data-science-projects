# Applied Data Science Portfolio

Four Dataquest guided projects using Python and SQL. The notebooks include methods and sample outputs. The SQL report pairs each business question with query results and recommendations.

| Project | Method and result | Open |
| --- | --- | --- |
| Customers and products analysis | Joined order, customer, and inventory records in SQLite. Flagged the 1968 Ford Mustang for replenishment review and estimated historical gross profit across 98 purchasing accounts. | [Read the report](customers-and-products-sql/README.md) · [SQL script](customers-and-products-sql/Store_Analysis.sql) |
| Premier League match prediction | Tested rolling team form on a chronological holdout. Win precision rose from 47.46% to 62.50%. A separate agreement rule selected 40 matches and made 27 correct picks. | [Python notebook](notebooks/Premier_League_Match_Prediction.ipynb) |
| S&P 500 market direction | Used walk-forward evaluation across 4,737 trading sessions. The rolling random forest issued an up signal on 16.6% of sessions, with 56.9% precision. | [Python notebook](notebooks/SP500_Market_Direction.ipynb) |
| Speech recognition and summarization | Converted English audio into a timestamped transcript and an extractive summary. The 46-second demo produced 142 recognized words. | [Python notebook](notebooks/Speech_Recognition_and_Summarization.ipynb) |

## Run a project

- **Customers and products.** Open the course database in DB Browser for SQLite and follow the [run instructions](customers-and-products-sql/README.md#run-the-analysis).
- **Premier League.** Upload [matches.csv](notebooks/matches.csv) to the Colab runtime or place it in the notebook working directory locally.
- **S&P 500.** Run the cells in order. The default configuration loads the historical data snapshot used in the walkthrough.
- **Speech recognition.** Run all cells in Colab to process the sample audio. Select upload mode to use another recording.

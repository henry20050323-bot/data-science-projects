# Applied Data Science Portfolio

Three Python notebooks adapted from Dataquest guided projects. Each notebook shows its method, evaluation, and sample output.

| Project | What to look for |
| --- | --- |
| [Premier League match prediction](notebooks/Premier_League_Match_Prediction.ipynb) | A chronological holdout, rolling team form, and a three-panel results figure. Win precision was 47.46% for the baseline and 62.50% with rolling features. The agreement rule returned 27 correct picks out of 40 selected matches. |
| [S&P 500 market direction](notebooks/SP500_Market_Direction.ipynb) | Walk-forward evaluation across 4,737 shared trading sessions. The rolling forest achieved 56.9% up-signal precision with 16.6% signal coverage. |
| [Speech recognition and summarization](notebooks/Speech_Recognition_and_Summarization.ipynb) | An English audio pipeline that produces timestamped text and an extractive summary. The 46-second demo produced 142 recognized words. |

## Run the notebooks

- **Premier League:** Upload [matches.csv](notebooks/matches.csv) to the Colab runtime, or run locally with that file in the notebook working directory.
- **S&P 500:** Run the notebook from top to bottom. The default loads a historical data snapshot used in the walkthrough.
- **Speech:** Run all cells in Colab for the sample audio. To use a different recording, change the input mode to upload.

The reported scores describe the evaluation samples and selection rules used in the notebooks.

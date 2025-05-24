import pandas as pd

# CSVファイルを読み込む（例：data.csv）
df = pd.read_csv('data.csv')

# データの先頭5行を表示
print("=== データの先頭 ===")
print(df.head())

# カラム情報とデータ型の確認
print("\n=== データの概要 ===")
print(df.info())

# 統計情報の表示（数値列に対して）
print("\n=== 統計情報 ===")
print(df.describe())

# 特定のカラム（例：'age'）の平均値を計算
if 'age' in df.columns:
    avg_age = df['age'].mean()
    print(f"\n年齢の平均: {avg_age}")

# 条件でフィルタ（例：ageが30以上の行）
if 'age' in df.columns:
    filtered_df = df[df['age'] >= 30]
    print("\n=== 年齢が30歳以上の人 ===")
    print(filtered_df)

# 新しい列を追加（例：'age_category'）
if 'age' in df.columns:
    df['age_category'] = df['age'].apply(lambda x: 'Adult' if x >= 18 else 'Child')
    print("\n=== 年齢カテゴリを追加したデータ ===")
    print(df.head())

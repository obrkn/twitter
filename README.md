# Twitter風アプリ

## アピールポイント

### セキュリティ
| 攻撃 | 対策 | 備考 |
|---|---|---|
| SQLインジェクション | プレースホルダ |
| XSS攻撃 | エスケープ処理・CookieのHttpOnly属性付与 |
| CSRF攻撃 | トークン埋め込み | https://github.com/gorilla/csrf |
| ブルートフォース攻撃 | アカウントロック | 10回連続失敗したら30分間ロック |
| オフライン攻撃 | ソルト・ストレッチング | https://pkg.go.dev/golang.org/x/crypto/bcrypt |
| DOS攻撃 | 同IPアクセス制限 | Nginx設定 |

### 速度パフォーマンス

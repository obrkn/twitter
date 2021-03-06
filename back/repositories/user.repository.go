package repositories

import (
	"database/sql"

	"github.com/obrkn/twitter/models"
)

type UserRepository interface {
	GetUserByEmail(user *models.User, email string) error
	ExistsUserByEmail(email string) (bool, error)
	CreateUser(createUser *models.User) error
}

type userRepository struct {
	db *sql.DB
}

func NewUserRepository(db *sql.DB) UserRepository {
	return &userRepository{db}
}

/*
	emailに紐づくユーザーを取得
*/
func (ur *userRepository) GetUserByEmail(user *models.User, email string) error {
	if err := ur.db.
		QueryRow("SELECT id, email, password, created_at, updated_at FROM users WHERE email = ?", email).
		Scan(&user.Id, &user.Email, &user.Password, &user.CreatedAt, &user.UpdatedAt); err != nil {
		return err
	}

	return nil
}

/*
	emailに紐づくユーザーが存在判定
*/
func (ur *userRepository) ExistsUserByEmail(email string) (bool, error) {
	var isExists bool
	if err := ur.db.
		QueryRow("SELECT EXISTS ( SELECT 1 FROM users WHERE email = ? LIMIT 1)", email).
		Scan(&isExists); err != nil {
		return isExists, err
	}

	return isExists, nil
}

/*
	ユーザーデータ新規登録
*/
func (ur *userRepository) CreateUser(createUser *models.User) error {
	_, err := ur.db.Exec("INSERT INTO users(email, password) VALUES(?, ?);", createUser.Email, createUser.Password)
	if err != nil {
		return err
	}

	return nil
}

package utils

import (
	"fmt"

	"github.com/GreenTeaProgrammers/WhereChildBus/backend/config"
	"golang.org/x/crypto/bcrypt"
)

func HashPassword(password string) (string, error) {
	// 環境変数からペッパーを取得
	config, _ := config.New()
	pepper := config.PasswordPepper

	// パスワードにペッパーを追加
	passwordWithPepper := password + pepper

	// ハッシュ計算のコストを増やす（例: bcrypt.MinCost + 5）
	cost := bcrypt.MinCost + 5
	if cost > bcrypt.MaxCost {
		cost = bcrypt.MaxCost
	}

	// ペッパーを追加したパスワードをハッシュ化
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(passwordWithPepper), cost)
	if err != nil {
		return "", fmt.Errorf("failed to hash password: %w", err)
	}
	return string(hashedPassword), nil
}

// ハッシュ化されたパスワードと送られてきたパスワードを比較
func CheckPassword(hashedPassword string, plainPassword string) bool {
	config, _ := config.New()
	pepper := config.PasswordPepper

	//パスワードにペッパーを追加
	passwordWithPepper := plainPassword + pepper

	err := bcrypt.CompareHashAndPassword([]byte(hashedPassword), []byte(passwordWithPepper))
	return err == nil
}

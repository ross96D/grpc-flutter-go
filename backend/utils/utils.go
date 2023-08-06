package utils

import (
	"crypto/sha256"
	"encoding/hex"
	"math"
)

func RoundTo(n float64, decimals int) float64 {
	return math.Round(n*math.Pow(10, float64(decimals))) / math.Pow(10, float64(decimals))
}

func Hash(s string) string {
	h := sha256.New()
	h.Write([]byte(s))
	return hex.EncodeToString(h.Sum(nil))
}
